@include('BarangKeluar/movingAverage')
<!DOCTYPE html>
<html>
    <head>  
        <title>Moving Average</title>
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
    </head>
<body>
<div class="container">
<div class="row">
<div class="col-md-12">
<p>
<center><strong>ESTIMASI PENJUALAN MENGGUNAKAN METODE MOVING AVERAGE</strong></center>
</p>
</div>
</div>
<div class="row">
<div class="col-md-4">				
<table class="table table striped">
<thead>						
<tr>
<th>ID</th>
<th>Bulan</th>
<th>Penjualan</th>						
</tr>
</thead>
<?php
$query = $connect->query("SELECT * from `month` ");
$query->setFetchMode(PDO::FETCH_ASSOC);                  				
while($data =$query->fetch()){      
?>
<tbody>
<tr>
<td><?php echo $data['id_month'];?></td>
<td><?php echo $data['name_month'];?></td>
<td><?php echo $data['qty'];?></td>							
</tr>
</tbody>
<?php } ?>
</table>
<form action="" method="POST">
<button type="submit" name="proses" class="btn btn-primary">Proses</button>
</form>			
</div>
<div class="col-md-8">				
<div class="card">
<h5 class="card-header">Hasil Perhitungan</h5>
<div class="card-body">
<?php 
if (isset($_REQUEST['proses'])) {
?>	
<div class="row">
<div class="col-md-4">
<table class="table">
<thead>
<tr>					  			
<th>Bulan</th>
<th>Penjualan</th>
</tr>
</thead>
<?php
$query = $connect->query("SELECT * from `month` LIMIT 3,9");
$query->setFetchMode(PDO::FETCH_ASSOC);                  				
while($data =$query->fetch()){      
?>
<tbody>
<tr>					  			
<td><?php echo $data['name_month'];?></td>
<td><?php echo $data['qty'];?></td>	
</tr>
</tbody>
<?php } ?>
</table>		
</div>				  	
<div class="col-md-4">
<?php						
$query=$connect->query("SELECT a.dt, id_month, name_month, a.qty, Round( ( SELECT SUM(b.qty) / COUNT(b.qty) FROM `month` AS b WHERE DATEDIFF(a.dt, b.dt) BETWEEN 0 AND 2), 1 ) AS '5dayMovingAvg' FROM `month` AS a ORDER BY a.dt LIMIT 8,9")->fetch(PDO::FETCH_ASSOC);							
$hasil=$query['5dayMovingAvg'];							
?>					
<table class="table table striped">
<thead>
<th>MA</th>
</thead>
<?php
$ma= $connect->query("SELECT a.dt, id_month, name_month, a.qty, Round( ( SELECT SUM(b.qty) / COUNT(b.qty) FROM `month` AS b WHERE DATEDIFF(a.dt, b.dt) BETWEEN 0 AND 2), 1 ) AS '5dayMovingAvg' FROM `month` AS a ORDER BY a.dt LIMIT 2,9");
$ma->setFetchMode(PDO::FETCH_ASSOC);                  				
while($data =$ma->fetch()){      
?>
<tbody>
<tr>														
<td><?php echo $data['5dayMovingAvg'];?></td>							
</tr>
</tbody>
<?php } ?>
</table>
<hr>
Hasil estimasi penjualan pada name_month November adalah : <b><?php echo $hasil?></b		
</div>
</div>	
<?php							
}
?>			
</div>
</div>					
</div>
</div>		
</div>
<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
</body>
</html>