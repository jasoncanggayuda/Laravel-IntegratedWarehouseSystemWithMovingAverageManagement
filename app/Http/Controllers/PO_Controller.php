<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PO_Controller extends Controller
{
    public function SuratPO()
    {
        //mengambil data dari table PO
        $table_PO = DB::table('_surat_p_o')->get();

        //mengirimkan data ke view dashboard
        return view('PO/SuratPO',['_surat_p_o' => $table_PO]);    
    }

    public function tambah()
    {
    
        // memanggil view tambah
        return view('PO/tambah_PO');
    
    }

    // method untuk insert data ke table PO
    public function store(Request $request)
    {
        // insert data ke table pegawai
        DB::table('_surat_p_o')->insert([
            'kode_PO' => $request->kode_PO,
            'nama_barang' => $request->nama_barang,
            'keterangan' => $request->keterangan,
            'qty'=>$request->qty,
            'harga_satuan'=>$request->harga_satuan,
            'jumlah' => $request->jumlah,
        ]);
        // alihkan halaman ke halaman pegawai
        return redirect('/PO/SuratPO');
    
    }

    public function TerimaSPB()
    {
        //mengambil data dari table PO
        $table_valid = DB::table('valid_spb')->get();

        //mengirimkan data ke view dashboard
        return view('PO/TerimaSPB',['valid_spb' => $table_valid]);    
    }
    
    public function TerimaPO($id_SPB)
        {
            
            $tableSPB = DB::table('valid_spb')->where('id_SPB',$id_SPB)->get();
            
            return view('PO/TerimaPO',['valid_spb' => $tableSPB]);
        
        }

    public function storeTerimaPO(Request $request)
    {

        DB::unprepared("
        INSERT INTO `_surat_p_o`(`kode_PO`,`nama_barang`, `keterangan`, `qty`, `harga_satuan`, `jumlah`) VALUES 
        ('$request->kode_PO','$request->nama_barang','$request->keterangan','$request->qty','$request->harga_satuan','$request->jumlah');
        
        
        ");

        return redirect('/PO/TerimaSPB');
    }

     // method untuk edit data pegawai
     public function edit($id_PO)
     {
         // mengambil data pegawai berdasarkan id yang dipilih
         $tablePO = DB::table('_surat_p_o')->where('id_PO',$id_PO)->get();
         // passing data pegawai yang didapat ke view edit.blade.php
         return view('PO/editPO',['_surat_p_o' => $tablePO]);
     
     }
     
     public function update(Request $request)
     {
         
         DB::table('_surat_p_o')->where('id_PO',$request->id_PO)->update([
             'kode_PO' => $request->kode_PO,
             'nama_barang' => $request->nama_barang,
             'keterangan' => $request->keterangan,
             'qty'=>$request->qty,
             'harga_satuan'=>$request->harga_satuan,
             'jumlah' => $request->jumlah,
         ]);
         
         return redirect('/PO/SuratPO');
     }

     public function delete($id_PO)
     {
         // menghapus data pegawai berdasarkan id yang dipilih
         DB::table('_surat_p_o')->where('id_PO',$id_PO)->delete();
             
         // alihkan halaman ke halaman pegawai
         return redirect('/PO/SuratPO');
     }

     public function ValidasiPO()
     {
         //mengambil data dari table PO
         $table_spb = DB::table('_surat_p_o')->get();
         //mengirimkan data ke view ValidasiPO
         return view('PO/ValidasiPO',['_surat_p_o' => $table_spb]);    
     }

     public function ValidPO($id_PO)
     {
         
         $tablePO = DB::table('_surat_p_o')->where('id_PO',$id_PO)->get();
         
         return view('PO/ValidPO',['_surat_p_o' => $tablePO]);
     
     }
     public function NoValidPO($id_PO)
     {
         
         $tablePO = DB::table('_surat_p_o')->where('id_PO',$id_PO)->get();
         
         return view('PO/NoValidPO',['_surat_p_o' => $tablePO]);
     
     }

     public function storeValidPO(Request $request)
     {
 
         DB::unprepared("
         INSERT INTO `valid_po`(`kode_PO`,`nama_barang`, `keterangan`, `qty`, `harga_satuan`, `jumlah`) VALUES 
         ('$request->kode_PO','$request->nama_barang','$request->keterangan','$request->qty','$request->harga_satuan','$request->jumlah');
         
         DELETE FROM `_surat_p_o` WHERE `id_PO`='$request->id_PO';
         ");
 
         return redirect('/PO/ValidasiPO');
     }
 
     public function storeNoValidPO(Request $request)
     {
 
         DB::unprepared("
         INSERT INTO `no_valid_po`(`kode_PO`,`nama_barang`, `keterangan`, `qty`, `harga_satuan`, `jumlah`) VALUES 
         ('$request->kode_PO','$request->nama_barang','$request->keterangan','$request->qty','$request->harga_satuan','$request->jumlah');
         
         DELETE FROM `_surat_p_o` WHERE `id_PO`='$request->id_PO';
         ");
 
         return redirect('/PO/ValidasiPO');
     }

     public function ProsesPO()
     {
         //mengambil data dari table spb
         $table_po = DB::table('valid_po')->get();
         //mengirimkan data ke view ProsesSPB
         return view('PO/ProsesPO',['valid_po' => $table_po]);
     }
 
     public function ProsesNoValidPO()
     {
         //mengambil data dari table spb
         $table_po = DB::table('no_valid_po')->get();
         //mengirimkan data ke view ProsesSPB
         return view('PO/ProsesNoValidPO',['no_valid_po' => $table_po]);
     }

     
    public function deleteNoValid($id_PO)
    {
        // menghapus data pegawai berdasarkan id yang dipilih
        DB::table('no_valid_po')->where('id_PO',$id_PO)->delete();
            
        // alihkan halaman ke halaman pegawai
        return redirect('/PO/ProsesNoValidPO');
    }

    public function Barang($id_PO)
     {
         
         $tablePO = DB::table('valid_po')->where('id_PO',$id_PO)->get();
         
         return view('PO/Barang',['valid_po' => $tablePO]);
     
     }
     public function BarangDatang(Request $request)
     {
 
         DB::unprepared("
         UPDATE `valid_po` SET `nama_barang`='$request->nama_barang',
        `keterangan`='$request->keterangan',`qty`=`qty`-'$request->qty',`harga_satuan`='$request->harga_satuan',
        `jumlah`=`jumlah`-'$request->jumlah';
        
        DELETE FROM `valid_po` WHERE `qty`<='0';
         
        INSERT INTO `table_barang`(`SKU`, `nama_barang`, `keterangan`, `qty`, `harga_satuan`, `jumlah`, `nama_by`) VALUES 
        ('$request->SKU', '$request->nama_barang','$request->keterangan',
        '$request->qty','$request->harga_satuan','$request->jumlah', '$request->nama_by');
       

         INSERT INTO `history`(`nama_barang`, `keterangan`, `qty`, `harga_satuan`, `jumlah`) VALUES 
         ('$request->nama_barang','$request->keterangan','$request->qty','$request->harga_satuan','$request->jumlah');
         
         
         ");
 
         return redirect('/PO/ProsesPO');
     }

     public function Gagal($id_PO)
     {
         // menghapus data pegawai berdasarkan id yang dipilih
         DB::table('valid_po')->where('id_PO',$id_PO)->delete();
             
         // alihkan halaman ke halaman pegawai
         return redirect('/PO/ProsesPO');
     }
}
