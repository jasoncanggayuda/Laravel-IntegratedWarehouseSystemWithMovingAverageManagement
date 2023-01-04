<?php
	$connect= new PDO("mysql:host=localhost; dbname=db_metode; charset=utf8mb4", "root", "");
	date_default_timezone_set('Asia/Makassar');
	define('APP_NAME', 'MA', true);
	define('APP_DESC', 'Moving Average');
	define('APP_COPYRIGHT', '&copy; '.APP_NAME.' - All Right Reserved 2020');
	define('BASEURL', 'http://localhost/moving_average/');
?>