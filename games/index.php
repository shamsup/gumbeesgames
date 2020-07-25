<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>Free Games - GumbeesGames.com</title>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
  <meta name="revisit-after" content="3 Days" />
  <meta name="Description" content="Hundreds of free, addicting, flash games to play for hours on end at work, home, school, or anywhere." />
  <meta name="Keywords" content="games, internet games, flash, online games, free games, entertainment, fun, gumbee, mesme marbles, bike, gamesloth" />
<?php
    $incpath = 'http://gumbeesgames.com/include/';
    include($incpath.'head.php');
    include($incpath.'body.php');
?>
    <div id="bigcolumn">
      <?php
        $username="dbo268220341";
	    $password="DGbVjMXG";
	    $database="db268220341";
	    $hostname="db1788.perfora.net";

        mysql_connect($hostname,$username,$password);
        @mysql_select_db($database) or die( "Sorry, there was an error.<br />Please reload the page.");
        $query="SELECT * FROM games ORDER BY name ASC";
        $result=mysql_query($query);

        $num=mysql_numrows($result);

        mysql_close();

        echo "<h3 align=\"left\">All Games - ".$num."</h3><br />";
        echo "<div id=\"noborder\"><table cellspacing=\"0\">";
        $i=0;
        if ($num > 5) {
        $max_h=9;
        } else{$max_h=$num;}
        while ($i < $num) {
            echo "<tr>
            ";
            for ($h=1; $h<=$max_h; $h++)  {

                $name=mysql_result($result,$i,"name");
                $page_url=mysql_result($result,$i,"page_url");

                echo "<td><a class=\"gamelink\" title=\"$name\" href=\"$page_url\">$name</a></td>
                ";

                $i++;
            }
            echo"</tr>
            ";
        }
        echo "</table></div>";
      ?>
    </div><!-- Begin Footer -->
<?php include($incpath.'footer.php'); ?>
