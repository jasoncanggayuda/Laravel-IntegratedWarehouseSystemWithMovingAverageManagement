<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\DB;

use Illuminate\Http\Request;

class MovingAvgController extends Controller
{
    public function ShowMovingAvg($id){
        
        $movingAvg = DB::table('table_barang')->where('id',$id)->get();
        $table_month = DB::table('month')->get();

        return view('MovingAvg/movingAvg')->with([
            'month' => $table_month,
            'table_barang' => $movingAvg, 
        ]);
    }

    public function PeriodMovingAvg(Request $request){
        $JualPerBulan = DB::select(DB::raw("
        SELECT `month`.`name_month`, SUM(`table_barang`.`jumlah_jual`) AS JualPerBulan
        FROM `month`
        INNER JOIN `table_barang`
        ON `month`.`id_month`=`table_barang`.`id_month`
        WHERE `month`.`id_month`= `table_barang`.`id_month`
        AND `table_barang`.`id` = '$request->id_month'
        GROUP BY `month`.`name_month`
        "));
        return view('MovingAvg/movingAvg')->with(['penjualan' => $JualPerBulan]);
    }

    public function periode(){
        return view('MovingAvg/periode');
    }

}
  