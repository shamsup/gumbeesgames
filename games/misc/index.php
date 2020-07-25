<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Random Games - GumbeesGames.com</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<META Name="revisit-after" Content="3 Days">
<META Name="Description" Content="Free random flash games available to play any time, anywhere.">
<META Name="Keywords" Content="free games, random flash games, random games, random, gumbee, flash games, gamesloth">
<?php
    $incpath = 'http://gumbeesgames.com/include/';
    include($incpath.'head.php');
    include($incpath.'body.php');
    $username="dbo268220341";
    $password="DGbVjMXG";
    $database="db268220341";
    $hostname="db1788.perfora.net";

?>

  <div id="bigcolumn">

  <?
                    mysql_connect($hostname,$username,$password);
                    @mysql_select_db($database) or die( "Sorry, there was an error.<br />Please reload the page.");
                    $query="SELECT * FROM games WHERE category='misc' ORDER BY name ASC";
                    $result=mysql_query($query);

                    $num=mysql_numrows($result);
                    echo "<h3 align=\"left\">Random Games - ".$num."</h3>";

                    mysql_close();

                    echo "<table>
                    c";
                    $i=0;
                    if ($num > 5) {
                    $max_h=9;
                    } else{$max_h=$num;}
                    while ($i < $num) {
                      echo "<tr>
                      ";
                            for ($h=1; $h<=$max_h; $h++)  {
                                if ($i < $num) {
                                $name=mysql_result($result,$i,"name");
                                $img_url=mysql_result($result,$i,"img_url");
                                $page_url=mysql_result($result,$i,"page_url");

                                echo "<td><a href=\"$page_url\" title=\"$name\">";
                                if ($i<$max_h){echo "<img src=\"$img_url\" title=\"$name\" alt=\"$name\" /><br />";}
                                echo "$name</a></td>
                                ";
                                }
                                $i++;
                            }
            echo"</tr>
            ";
            }
            echo "</table>
            ";
  ?>
  </div>
  <!-- Begin Footer -->
  <?php include($incpath.'footer.php'); ?>