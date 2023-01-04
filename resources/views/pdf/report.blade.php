<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Report</title>
    <style>
        h1{
            margin-bottom: 0px;
        }
        h4{
            margin-top: 0px;
        }
        h3, p{
          font-family: sans-serif;
          margin: 5px;
      }
      
      table {
          font-family: Arial, Helvetica, sans-serif;
          color:black;
          background: #eaebec;
          border: black 2px solid;
          margin: 0px auto;
          font-size: 12px;
          width: 100%;
      }
      
      table th {
          padding: 8px;
          border-left:1px solid black;
          border-bottom: 1px solid black;

          background: #808080; 
      }
      
      table th:first-child{  
          border-left:none;  
      }
      
      table tr {
          text-align: left;
      }
      
      table td:first-child {
          text-align: left;
          border-left: 0;

      }
      
      table td {
          padding: 6px;
          border: 1px solid black;
          background: white;
      }
      
      table tr:last-child td {
          border-bottom: 0;
      }
    </style>
</head>
<body>
    <center><h1>Laporan</h1></center>
    <center><h4>{{$bulan_mulai}} - {{$bulan_selesai}}</h4></center>
    <table class="table table-report" border="1" cellspacing="0">
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

</body>
</html>
