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
                            function recalc() {
                                var i1 = parseFloat(document.getElementById("1").value);
                                var i2 = parseFloat(document.getElementById("2").value);
                                i1 = isNaN(i1) ? 0 : i1;
                                i2 = isNaN(i2) ? 0 : i2;
                                document.getElementById("3").value = i1 * i2;
                            }
                        </script>
                        <title>Dashboard</title>
                    </head>
                    <body>
						<a class="btn btn-warning" href="/SPB/BuatSurat"> Back</a>
						
						<br/>
						<br/>
					
						<form action="/SPB/BuatSurat/store" method="post">
							{{ csrf_field() }}
							<div class="form-group">
                            <label for="nama_barang">Kode PR</label> 
							<input type="text" class="form-control" name="kode_spb" placeholder="PR/YYYY/*" required="required"> <br/>

							<label for="nama_barang">Nama Barang</label> 
							<input type="text" class="form-control" name="nama_barang" placeholder="Nama Barang" required="required"> <br/>

							<label for="keterangan">Supplier </label>
							<textarea class="form-control" name="keterangan" placeholder="Supplier" required="required"></textarea> <br/>

                            <label for="jumlah">Qty</label> 
							<input id="1" type="number" class="form-control" name="qty" placeholder="Qty" onblur="recalc()"> <br/>
                            @role('Admin-Purchasing|Manager-Warehouse')
                            <label for="jumlah">Harga Satuan</label> 
							<input id="2" type="number" class="form-control" name="harga_satuan" placeholder="Harga Satuan" onblur="recalc()"> <br/>

                            <label for="jumlah">Jumlah</label> 
							<input id="3" type="number" class="form-control" name="jumlah" placeholder="Total Harga" readonly> <br/>
                            @endrole
							<input type="submit" class="btn btn-primary" value="Simpan Data">
						</form>
 
					</body>
				</html>
				</div>
            </div>
        </div>
    </div>
</x-app-layout>