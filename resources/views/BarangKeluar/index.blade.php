<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Barang Keluar') }}
        </h2>
    </x-slot>
    

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 bg-white border-b border-gray-200">

                <!DOCTYPE html>
                    <html lang="en">
                    <head>
                        <meta charset="UTF-8">
                        <meta http-equiv="X-UA-Compatible" content="IE=edge">
                        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
                        <title>Barang Keluar</title>
                    </head>
                    <body>
                    
                    <h3>Pengeluaran Barang</h3>

                        <table class="table table-bordered border-primary">
                        <thead>
                            <tr>
                                <th scope="col">No</th>
                                <th scope="col">Kode Barang</th>
                                <th scope="col">Nama Barang</th>
                                <th scope="col">Supplier</th>
                                <th scope="col">Tanggal</th>
                                <th scope="col">Terjual</th>
                                @role('Admin-Purchasing|Manager-Warehouse')
                                <th scope="col">Harga Satuan</th>
                                <th scope="col">Jumlah</th>
                                @endrole
                                <th scope="col">PIC</th>
                                <th scope="col">Pilihan</th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php $i=1; ?>
                            @foreach($barang_keluar as $ts)
                            <tr>
                                <td>{{ $i++ }}</td>
                                <td>{{ $ts->SKU }}</td>
                                <td>{{ $ts->nama_barang }}</td>
                                <td>{{ $ts->keterangan }}</td>
                                <td>{{ $ts->tanggal }}</td>
                                <td>{{ $ts->qty }}</td>
                                @role('Admin-Purchasing|Manager')
                                <td>{{ $ts->harga_satuan }}</td>
                                <td>{{ $ts->jumlah }}</td>
                                @endrole
                                <td>{{ $ts->nama_by }}</td>
                                <td>
                                @role('Admin-Warehouse')
                                <a class="btn btn-warning" href="/BarangKeluar/edit/{{ $ts->id }}">Edit</a>
				                <!-- <a class="btn btn-danger" href="/BarangKeluar/out/{{ $ts->id }}">Delete</a> -->
                                @endrole
                                </td>
                            </tr>
                            @endforeach
                            </tbody>
                        </table>
                    
                    </body>
                    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
                    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
                    </html>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
