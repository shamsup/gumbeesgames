<?php
$isCatPage=false;
if (isset($_GET['cat'])){$isCatPage=true;$cat=$_GET['cat'];}
include('include/functions.php');
$c=connect();
($isCatPage ? $byCat=get_by_cat($cat,$c) : $recent = get_recent($c));
$dropdown=get_dropdown($c);
$all=get_all($c);
disconnect($c);
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><?php echo($isCatPage ? 'Play '.ucfirst($cat).' Games Free - Gumbee\'s Games' : 'Free Online Games - Gumbee\'s Games'); ?></title>
<style type="text/css">@import 'style.css';</style>
<!--[if lt IE 7]>
<link rel="stylesheet" type="text/css" href="ie.css" />
<![endif]-->
<script src="js.js" type="text/javascript"></script>
<script src="g-g-games.js" type="text/javascript"></script>
</head>

<body>
<div id="content-wrap">
	<div id="wrapper">
<!--BEGIN HEADER -->
    	<div id="header">
        	<h1><a href="http://gumbeesgames.com/"><span>Play Free Games - Gumbee's Games</span></a></h1>
            <div class="tl"></div><div class="tr"></div><div class="bl"></div><div class="br"></div>
        </div>
<!-- END HEADER -->
<!-- BEGIN NAVBAR -->
        <div id="navbar">
        	<ul id="nav">
            	<li class="first"><a href="/action"><span></span>Action<span class="hid"> Games</span></a></li>
                <li><a href="/adventure">Adventure<span class="hid"> Games</span></a></li>
                <li><a href="/arcade">Arcade<span class="hid"> Games</span></a></li>
                <li><a href="/puzzle">Puzzle<span class="hid"> Games</span></a></li>
                <li><a href="/sports">Sports<span class="hid"> Games</span></a></li>
                <li class="last"><a href="/misc"><span></span>Random<span class="hid"> Games</span></a></li>
            </ul>
            <div id="games-dropdown">
            <span class="arr"></span>
            	<div id="selected-game">-- Select a Game --</div>
                <ul>
                <?php echo($dropdown); ?>
                </ul>
            </div>
        </div>
<!-- END NAVBAR -->
<!-- BEGIN LEFT COLUMN -->
        <div id="left">
        	<div class="box">
            	<div class="content">
                	<h2><?php echo(($isCatPage ? ucfirst($cat) : 'Newest') . ' Games'); ?></h2>
                    <div style="text-align:center;">
                    	<script type="text/javascript">
						google_ad_client="pub-1176090277900359";google_ad_slot="3524007625";google_ad_width=468;google_ad_height=15;
						</script><script type="text/javascript" src="http://pagead2.googlesyndication.com/pagead/show_ads.js"></script>
                    </div>
                    <?php echo($isCatPage ? $byCat : $recent); ?>
                    <div class="clear"></div>
                </div>
            	<div class="tl"></div><div class="tr"></div><div class="bl"></div><div class="br"></div>
            </div>
            <div class="box">
            	<div class="content">
                	<h2>All Games</h2>
                    <div style="text-align:center;">
                    	<script type="text/javascript">
						google_ad_client="pub-1176090277900359";google_ad_slot="3524007625";google_ad_width=468;google_ad_height=15;
						</script><script type="text/javascript" src="http://pagead2.googlesyndication.com/pagead/show_ads.js"></script>
                    </div>
                    <?php echo $all; ?>
                    <div class="clear"></div>
                </div>
            	<div class="tl"></div><div class="tr"></div><div class="bl"></div><div class="br"></div>
            </div>
        </div>
<!-- END LEFT COLUMN -->
<!-- BEGIN RIGHT COLUMN -->
        <div id="right">
        	<div class="box">
            	<div class="content">
                	<div style="float:left;display:inline;">
						<script type="text/javascript">
						google_ad_client="pub-1176090277900359";google_ad_slot="5210243501";google_ad_width=120;google_ad_height=90;
						</script><script type="text/javascript" src="http://pagead2.googlesyndication.com/pagead/show_ads.js"></script>
                    </div>
                    <div style="float:right;display:inline;">
						<script type="text/javascript">
						google_ad_client="pub-1176090277900359";google_ad_slot="8911642377";google_ad_width=120;google_ad_height=90;
						</script><script type="text/javascript" src="http://pagead2.googlesyndication.com/pagead/show_ads.js"></script>
                    </div>
                    <div class="clear"></div>
                </div>
            	<div class="tl"></div><div class="tr"></div><div class="bl"></div><div class="br"></div>
            </div>
            
        	<div class="box">
            	<div class="content">
                	<div style="text-align:center;">
                		<script type="text/javascript">
						google_ad_client="pub-1176090277900359";google_ad_slot="0208323290";google_ad_width=300;google_ad_height=250;
						</script><script type="text/javascript" src="http://pagead2.googlesyndication.com/pagead/show_ads.js"></script>
                	</div>
                    <div class="clear"></div>
                </div>
            	<div class="tl"></div><div class="tr"></div><div class="bl"></div><div class="br"></div>
            </div>
            
            <div class="box">
            	<div class="content">
                	<h2>Need More Games?</h2>
                    We're always trying to add <a href="http://gumbeesgames.com/">new games</a> here at <a href="http://gumbeesgames.com/">Gumbee's Games</a>, but we're running out of sources. Got a game you want to see on the site? Email an administrator at <a href="mailto:games@gumbeesgames.com">games@gumbeesgames.com</a> with the name of the game and where you've seen it before. If you created the game, just attach a zip file and include the width/height, title, and description as well as your name/company so we can give you credit.
                    <div class="clear"></div>
                </div>
            	<div class="tl"></div><div class="tr"></div><div class="bl"></div><div class="br"></div>
            </div>
        </div>
<!-- END RIGHT COLUMN -->
		<div class="clear"></div>
    </div>
</div>
<!-- BEGIN FOOTER -->
	<div id="footer">
    	<a href="/action">Play Action Games</a> | <a href="/adventure">Play Adventure Games</a> | <a href="/arcade">Play Arcade Games</a> | <a href="/puzzle">Play Puzzle Games</a> | <a href="/sports">Play Sports Games</a> | <a href="/misc">Play Random Games</a><br />
        &copy;2010 Alex Mitchell | <a href="http://gumware.com/">Gumware Design</a>
    </div>
<!-- END FOOTER -->
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-7034825-2']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
</body>
</html>
