<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class BarangController extends Controller
{
    public function index()
    {
        //mengambil data dari table stock
        $table_barang = DB::table('table_barang')->get();
        
        //mengirimkan data ke view dashboard
        
        return view('dashboard',['table_barang' => $table_barang]);
    }

    public function BarangMasuk()
    {
        //mengambil data dari table stock
        $table_barang = DB::table('table_barang')->get();
        
        //mengirimkan data ke view dashboard
        
        return view('/BarangMasuk',['table_barang' => $table_barang]);
    }

    public function SMA()
    {        
        return view('BarangKeluar/movingAverage');
    }

    public function viewBarangKeluar()
    {
        //mengambil data dari table stock
        $table_barang = DB::table('barang_keluar')->get();
        //mengirimkan data ke view dashboard
        
        return view('BarangKeluar/index',['barang_keluar' => $table_barang]);
    }

    public function edit($id)
    {
         // mengambil data pegawai berdasarkan id yang dipilih
         $tableBarang = DB::table('table_barang')->where('id',$id)->get();
         // passing data pegawai yang didapat ke view edit.blade.php
         return view('BarangKeluar/edit',['table_barang' => $tableBarang]);
    }


    public function update(Request $request)
     {
         
         DB::table('table_barang')->where('id',$request->id)->update([
             'nama_barang' => $request->nama_barang,
             'SKU' => $request->SKU,
             'keterangan' => $request->keterangan,
             'qty'=>$request->qty,
             'harga_satuan'=>$request->harga_satuan,
             'jumlah' => $request->jumlah,
         ]);
         
         return redirect('/dashboard');
     }

     public function Barang($id)
     {
          // mengambil data pegawai berdasarkan id yang dipilih
          $tableBarang = DB::table('table_barang')->where('id',$id)->get();
          
          return view('BarangKeluar/out',['table_barang' => $tableBarang]);
     }

    public function BarangKeluar(Request $request)
    {

        DB::unprepared("
        UPDATE `table_barang` SET `nama_barang`='$request->nama_barang',`SKU`='$request->SKU',
        `keterangan`='$request->keterangan',`qty`=`qty`-'".(int)$request->qty."', `harga_satuan`='".(int)$request->harga_satuan."',
        `jumlah`=`jumlah`-'".(int)$request->jumlah."', `jumlah_jual`='".(int)$request->qty."', `ramalan`=`jumlah_jual`-'3' WHERE `id`='$request->id';

        INSERT INTO `barang_keluar`(`nama_barang`,`SKU`, `keterangan`, `qty`, `harga_satuan`, `jumlah`, `nama_by`) VALUES 
        ('$request->nama_barang', '$request->SKU', '$request->keterangan','".(int)$request->qty."','".(int)$request->harga_satuan."','".(int)$request->jumlah."','$request->nama_by');

        DELETE FROM `table_barang` WHERE `qty`<='0';
        ");

        
        
        return redirect('/dashboard');
    }

    public function tambahBarang()
    {
        return view('/tambahBarang');
    }
    
    public function tambahBarangStore(Request $request)
    {
        // insert data ke table spb
        DB::table('table_barang')->insert([
            'SKU' => $request->SKU,
            'nama_barang' => $request->nama_barang,
            'keterangan' => $request->keterangan,
            'qty'=>$request->qty,
        ]);
        // alihkan halaman ke halaman pegawai
        return redirect('/dashboard');
    
    }
}
