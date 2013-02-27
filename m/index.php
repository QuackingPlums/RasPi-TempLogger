<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<? $lastupdate = date("F d, Y g:i A", filemtime("../1h.png")); ?>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="yes" name="apple-mobile-web-app-capable" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<link href="thumbs/homescreen.gif" rel="apple-touch-icon" />
<meta content="minimum-scale=1.0, maximum-scale=0.6667, user-scalable=no" name="viewport" />
<link href="css/style.css" rel="stylesheet" media="screen" type="text/css" />
<script src="javascript/functions.js" type="text/javascript"></script>
<title>RasPi-TempLogger</title>
<meta content="Raspberry,Pi,Temperature,Logger" name="keywords" />
<meta content="Indoor/Outdoor temperature graphs over time. A Raspberry Pi project." name="description" />
</head>

<body>

<div id="topbar">
	<div id="title">RasPi-TempLogger</div>
	<div id="rightbutton"><a href="" class="noeffect" onClick="document.location.reload(true)">Refresh</a></div>
</div>
<div id="content">
	<span class="graytitle">Last updated: <?=str_replace(' ','&nbsp;',$lastupdate)?></span>
	<ul class="pageitem">
		<li class="textbox">
			<span class="header">Resolution: 5 minutes</span>
			<p><img src="../1h.png"/></p>
			<p><img src="../8h.png"/></p>
			<p><img src="../1d.png"/></p>
		</li>
	</ul>
	<ul class="pageitem">
		<li class="textbox">
			<span class="header">Resolution: 60 minutes</span>
			<img src="../7d.png"/>
		</li>
	</ul>
	<ul class="pageitem">
		<li class="textbox">
			<span class="header">Resolution: 4 hours</span>
			<img src="../30d.png"/>
		</li>
	</ul>
	<ul class="pageitem">
		<li class="textbox">
			<span class="header">Resolution: 12 hours</span>
			<p><img src="../90d.png"/></p>
			<p><img src="../180d.png"/></p>
		</li>
	</ul>
	<ul class="pageitem">
		<li class="textbox">
			<span class="header">Resolution: 24 hours</span>
			<img src="../365d.png"/>
		</li>
	</ul>
</div>
<div id="footer">
	<!-- Support iWebKit by sending us traffic; please keep this footer on your page, consider it a thank you for my work :-) -->
	<a class="noeffect" href="http://snippetspace.com">iPhone site powered by iWebKit</a></div>

</body>

</html>
