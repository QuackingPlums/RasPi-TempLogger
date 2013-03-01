<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<? $lastupdate = date("F d, Y g:i A", filemtime("../1h.png")); ?>
<?php include '_vars.php'; ?>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<?php include '_header.php'; ?>
</head>

<body>

<div id="topbar">
	<div id="title">RasPi-TempLogger</div>
	<div id="rightbutton"><a href="" class="noeffect" onClick="document.location.reload(true)">Refresh</a></div>
</div>
<div id="tributton">
	<div class="links">
		<a href="index.php">24h</a><a id="pressed">1m</a><a href="12m.php">12m</a></div>
</div>
<div id="content">
	<span class="graytitle">Last updated: <?=str_replace(' ','&nbsp;',$lastupdate)?></span>
	<ul class="pageitem">
		<li class="textbox">
			<span class="header">Last updated:<br><?=str_replace(' ','&nbsp;',$lastupdate)?></span>
			<p><img src="../7d.png"/></p>
			<p><img src="../30d.png"/></p>
		</li>
	</ul>
</div>
<div id="footer">
	<!-- Support iWebKit by sending us traffic; please keep this footer on your page, consider it a thank you for my work :-) -->
	<a class="noeffect" href="http://snippetspace.com">iPhone site powered by iWebKit</a></div>

</body>

</html>
