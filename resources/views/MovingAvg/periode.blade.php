<?php 
include 'connect.php';	
?>
<!DOCTYPE html>
<html>
    <head>  
        
        <title>Moving Average</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    </head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
            <p>
            <a href="/dashboard" class="btn btn-primary">Back</a>
            <center><strong>MOVING AVERAGE</strong></center>
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
$query = $connect->query("SELECT * from tb_movingaverage ");
$query->setFetchMode(PDO::FETCH_ASSOC);                  				
while($data =$query->fetch()){      
?>
<tbody>
<tr>
<td><?php echo $data['id'];?></td>
<td><?php echo $data['bulan'];?></td>
<td><?php echo $data['qty'];?></td>							
</tr>
</tbody>
<?php } ?>
</table>
<form action="">
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
$query = $connect->query("SELECT * from tb_movingaverage LIMIT 3,9");
$query->setFetchMode(PDO::FETCH_ASSOC);                  				
while($data =$query->fetch()){      
?>
<tbody>
<tr>					  			
<td><?php echo $data['bulan'];?></td>
<td><?php echo $data['qty'];?></td>	
</tr>
</tbody>
<?php } ?>
</table>		
</div>				  	
<div class="col-md-4">
<?php						
$query=$connect->query("SELECT a.dt, id, bulan, a.qty, Round( ( SELECT SUM(b.qty) / COUNT(b.qty) FROM tb_movingaverage AS b WHERE DATEDIFF(a.dt, b.dt) BETWEEN 0 AND 2), 1 ) AS '5dayMovingAvg' FROM tb_movingaverage AS a ORDER BY a.dt LIMIT 8,9")->fetch(PDO::FETCH_ASSOC);							
$hasil=$query['5dayMovingAvg'];							
?>					
<table class="table table striped">
<thead>
<th>MA</th>
</thead>
<?php
$ma= $connect->query("SELECT a.dt, id, bulan, a.qty, Round( ( SELECT SUM(b.qty) / COUNT(b.qty) FROM tb_movingaverage AS b WHERE DATEDIFF(a.dt, b.dt) BETWEEN 0 AND 2), 1 ) AS '5dayMovingAvg' FROM tb_movingaverage AS a ORDER BY a.dt LIMIT 2,9");
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
Hasil estimasi penjualan pada bulan November adalah : <b><?php echo $hasil?></b		
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
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js" integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy" crossorigin="anonymous"></script>
</body>
</html>