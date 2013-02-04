<? $lastupdate = date("F d, Y g:i A", filemtime("1h.png")); ?>
<html>
<head>
  <meta http-equiv="cache-control" content="no-cache">
  <meta http-equiv="refresh" content="300" >
  <title>RasPi-TempLogger</title>
  <style>
      BODY 
      { 
        font-family: arial; 
        font-size: 10pt;
        color:#FFFFFF;
        background-color:#0060AC;
        background-repeat: no-repeat;
        background-position: center center; 
      }
 
      H2, H3
      {
        color:#FFFFFF;
        margin-bottom: 0;
      }
  </style>
</head>
<body>
  <div style="width: 800px; margin-left: 100px;" >
    <h2>RasPi-Templogger</h2>
    <i>Last updated: <?=$lastupdate?></i>

    <h3></h3>
    <img src="1h.png" />

    <h3></h3>
    <img src="8h.png" />

    <h3></h3>
    <img src="1d.png" />

    <h3></h3>
    <img src="7d.png" />

    <h3></h3>
    <img src="30d.png" />

    <h3></h3>
    <img src="90d.png" />

    <h3></h3>
    <img src="180d.png" />

    <h3></h3>
    <img src="365d.png" />
  </div>
</body>
</html>