<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<? $lastupdate = date("F d, Y g:i A", filemtime("../1h.png")); ?>
<?php include '_vars.php'; ?>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<?php include '_header.php'; ?>
</head>

<body>

<div id="topbar">
	<div id="title"><?php echo $title; ?></div>
	<div id="rightnav">
		<a href="index.php"><img alt="home" src="images/home.png" /></a></div>
</div>
<div id="content">
	<ul class="pageitem">
		<li class="textbox">
			<p>
			<?php
			$METAR = file_get_contents('../METAR.txt');
			echo $METAR;
			?>
			</p>
		</li>
	</ul>
</div>
<div id="footer">
	<!-- Support iWebKit by sending us traffic; please keep this footer on your page, consider it a thank you for my work :-) -->
	<a class="noeffect" href="http://snippetspace.com">iPhone site powered by iWebKit</a></div>

</body>

</html>
