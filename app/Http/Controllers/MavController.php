<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Barryvdh\DomPDF\Facade\Pdf;

class MavController extends Controller
{
    public function report(Request $request){
        //mengambil data dari table stock
        $barang = DB::table('table_barang')->distinct()->get('SKU');

        if($request->input('bulan_mulai') != null)
        {  
            $bulan_mulai = $request->input('bulan_mulai');
            $bulan_selesai = $request->input('bulan_selesai');

        }else{
            $date = date('Y-m-d');
            $date = strtotime($date);
            $date = strtotime("-3 month", $date);
            $bulan_mulai = date('Y-m-d', $date);
            $bulan_selesai = date('Y-m-d');
        }
        // step calc
        $step = (int)Str::substr($bulan_selesai, 5, 2)-(int)Str::substr($bulan_mulai, 5, 2);
        if($step<=0)$step+=12;
        $step+=1;
        // Single Moving Average Calculate
        $report = [];
        foreach($barang as $br){
            // cek di tabel pengeuaran apakah terdapat barang ini
            $dataKeluar = DB::table('barang_keluar')
                                ->where([
                                        ['SKU', '=', $br->SKU], 
                                        ['tanggal', '>=', $bulan_mulai],
                                        ['tanggal', '<=', $bulan_selesai]])
                                ->get();
            if($dataKeluar->count()>0){
                $jumlahKeluar = DB::table('barang_keluar')
                            ->where([
                                    ['SKU', '=', $br->SKU], 
                                    ['tanggal', '>=', $bulan_mulai],
                                    ['tanggal', '<=', $bulan_selesai]])
                            ->sum('qty');
                $jumlahMasuk = DB::table('table_barang')
                            ->where([
                                    ['SKU', '=', $br->SKU], 
                                    ['tanggal', '>=', $bulan_mulai],
                                    ['tanggal', '<=', $bulan_selesai]])
                            ->sum('qty');
                $dataTemp = [
                    'barang'=> DB::table('table_barang')->where('SKU', $br->SKU)->get()[0],
                    'sma' => round($jumlahKeluar/$step, 2),
                    'masuk'=>$jumlahMasuk,
                    'keluar'=>$jumlahKeluar
                ];
                array_push($report, $dataTemp);
            }
        }

        $data['report'] = $report;
        $data['bulan_mulai'] = $bulan_mulai;
        $data['bulan_selesai'] = $bulan_selesai;
        // dd($data['report'][0]);
        return view('MovingAvg/report', $data);
    }

    public function print_report(Request $request){
        //mengambil data dari table stock
        $barang = DB::table('table_barang')->distinct()->get('SKU');

        if($request->input('bulan_mulai') != null)
        {  
            $bulan_mulai = $request->input('bulan_mulai');
            $bulan_selesai = $request->input('bulan_selesai');

        }else{
            $date = date('Y-m-d');
            $date = strtotime($date);
            $date = strtotime("-3 month", $date);
            $bulan_mulai = date('Y-m-d', $date);
            $bulan_selesai = date('Y-m-d');
        }
        // step calc
        $step = (int)Str::substr($bulan_selesai, 5, 2)-(int)Str::substr($bulan_mulai, 5, 2);
        if($step<=0)$step+=12;
        $step+=1;
        // Single Moving Average Calculate
        $report = [];
        foreach($barang as $br){
            // cek di tabel pengeuaran apakah terdapat barang ini
            $dataKeluar = DB::table('barang_keluar')
                                ->where([
                                        ['SKU', '=', $br->SKU], 
                                        ['tanggal', '>=', $bulan_mulai],
                                        ['tanggal', '<=', $bulan_selesai]])
                                ->get();
            if($dataKeluar->count()>0){
                $jumlahKeluar = DB::table('barang_keluar')
                            ->where([
                                    ['SKU', '=', $br->SKU], 
                                    ['tanggal', '>=', $bulan_mulai],
                                    ['tanggal', '<=', $bulan_selesai]])
                            ->sum('qty');
                $jumlahMasuk = DB::table('table_barang')
                            ->where([
                                    ['SKU', '=', $br->SKU], 
                                    ['tanggal', '>=', $bulan_mulai],
                                    ['tanggal', '<=', $bulan_selesai]])
                            ->sum('qty');
                $dataTemp = [
                    'barang'=> DB::table('table_barang')->where('SKU', $br->SKU)->get()[0],
                    'sma' => round($jumlahKeluar/$step, 2),
                    'masuk'=>$jumlahMasuk,
                    'keluar'=>$jumlahKeluar
                ];
                array_push($report, $dataTemp);
            }
        }

        $data['report'] = $report;
        $data['bulan_mulai'] = $bulan_mulai;
        $data['bulan_selesai'] = $bulan_selesai;
        // dd($data['report'][0]);
        $pdf = Pdf::loadView('pdf.report', $data);
        return $pdf->stream('report '.$bulan_mulai.'-'.$bulan_selesai.'.pdf');
    }
}
