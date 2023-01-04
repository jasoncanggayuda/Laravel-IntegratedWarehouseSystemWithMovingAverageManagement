<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Dashboard') }}
        </h2>
    </x-slot>
    
    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 bg-white border-b border-gray-200">
                    <h2><strong>Moving Average</strong></h2>
                    <form action="{{route('Report')}}">
                        <div class="row my-3 col-12">
                            <h3>Pilih Rentang Waktu</h3>
                            @csrf
                            <div class="col-4">
                                <input type="text" class="form-control datepicker" value="{{$bulan_mulai}}" name="bulan_mulai" placeholder="Tanggal mulai">
                            </div>
                            <div class="col-4">
                                <input type="text" class="form-control datepicker" value="{{$bulan_selesai}}" name="bulan_selesai" placeholder="Sampai dengan">
                            </div>
                            <div class="col-4">
                                <input type="submit" class="btn btn-primary bg-primary border-primary" placeholder="Sampai dengan">
                            </div>
                        </div>
                    </form>
                    <div class="col-12">
                        <div class="d-flex flex-row-reverse row">
                            <div class="p-2">
                                <form action="{{route('print_report')}}" target="__blank">
                                    @csrf
                                    <input type="text"  value="{{$bulan_mulai}}" name="bulan_mulai" hidden>
                                    <input type="text"  value="{{$bulan_selesai}}" name="bulan_selesai" hidden>
                                <button type="submit" class="btn btn-info bg-info float-right btn-sm mb-3 text-white"><i class="fa fa-print"></i> Print</button>
                                </form>
                            </div>
                        </div>
                        <div class="row">
                        <table class="table table-report">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Kode Barang</th>
                                    <th>Nama Barang</th>
                                    <th>Keluar</th>
                                    <th>Average</th>
                                </tr>
                            </thead>
                            <tbody>
                                @php
                                $n=0;
                                @endphp
                                @foreach ($report as $row)
                                <tr>
                                    <td>{{++$n}}</td>
                                    <td>{{$row['barang']->SKU}}</td>
                                    <td>{{$row['barang']->nama_barang}}</td>
                                    <td>{{$row['keluar']}}</td>
                                    <td>{{$row['sma']}}</td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</x-app-layout>