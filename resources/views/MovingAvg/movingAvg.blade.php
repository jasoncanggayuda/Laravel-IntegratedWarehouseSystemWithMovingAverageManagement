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

                <!DOCTYPE html>
                    <html lang="en">
                    <head>
                        <meta charset="UTF-8">
                        <meta http-equiv="X-UA-Compatible" content="IE=edge">
                        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
                        <script>
                            
                        </script>
                        <title>Dashboard</title>
                    </head>
                    <body>
						<a href="/dashboard"> Kembali</a>
						
						<br/>
						<br/>
                        
						<form action="#" method="post">
                        @foreach($table_barang as $s)
                        <input type="hidden" name="id" value="{{ $s->id }}">
                        <label for="kode_barang">PO/2022/{{ $s->id }}</label> 
                        </br>
                        <label for="nama_barang">Nama Barang</label> 
						<input type="text" class="form-control" name="nama_barang" placeholder="Nama Barang" value="{{ $s->nama_barang }}" required="required"> <br/>
                        @endforeach
                        <table class="table">
                            <thead>
                                <tr>
                                <th scope="col">#</th>
                                <th scope="col">Bulan</th>
                                <th scope="col">Data Penjualan</th>
                                </tr>
                            </thead>
                            <tbody>
                            
                            @foreach($month as $m)
                                <tr>
                                <th scope="row">{{ $m->id_month }}</th>
                                <td>{{ $m->name_month }}</td>
                                @foreach($penjualan as $p)
                                <td>{{ $p->JualPerBulan }}</td>
                                @endforeach
                            @endforeach

                            
                                
                                </tr>
                            
                            
                            </tbody>
                            </table>
						</form>
                        
					</body>
				</html>
				</div>
            </div>
        </div>
    </div>
</x-app-layout>