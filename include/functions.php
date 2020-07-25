<?php
/**
 * Initializes the database connection
 * @return \mysqli db connection
 */
function connect(){
	$c = new mysqli('internal-db.s127408.gridserver.com','db127408_games','jq,(9><4E*P)a}q', 'db127408_gumbeesgames');
	return $c;
}

/**
 * Closes the database connection
 * @param \mysqli $c db connection
 */
function disconnect($c){
  $c->close();
}

/**
 * Builds the li elements for the games dropdown
 * @param \mysqli $c db connection
 */
function get_dropdown($c){
	$r = $c->query('SELECT * FROM `games` ORDER BY `name` ASC');
	$dropdown = '';
	while($row = $r->fetch_assoc()){
		$name      = $row['name'];
		$page_url  = $row['page_url'];
		$dropdown .= '
                  <li><a href="'.$page_url.'" title="Play '.$name.'">'.$name.'</a></li>';
	}
	$r->free();
	return $dropdown;
}

/**
 * Builds the list of recently added games
 * @param \mysqli $c db connection
 */
function get_recent($c){
	$r = $c->query('SELECT * FROM `games` ORDER BY `id` DESC LIMIT 0, 6 ');
	$recent = '';
	$row = null;
	for($i=0;$i<3;$i+=1) {
		for($j=0;$j<6;$j+=1){
			$row = $r->fetch_assoc();
			if (!is_null($row)) {
				$name = $row['name'];
				$url  = $row['page_url'];
				$img  = $row['img_url'];
				//$des1  = $row['description'];
				$recent .= '					<dl' . (($j % 2 == 1) ? ' class="right"' : '') . '>
													<dt><a href="' . $url . '" title="Play ' . $name . ' Free"><img src="' . $img . '" width="70" height="60" alt="Play ' . $name . '" />' . $name . '</a></dt>
														<!-- <dd class="clear"></dd> -->
												</dl>';	
			} else {
				break;
			}
		}
		if (is_null($row)) {
		  break;
		}
	}
	$r->free();
	return $recent;
}

/**
 * Builds a short list of games
 * @param \mysqli $c db connection
 */
function get_all_short($c){
	$r = $c->query('SELECT * FROM `games` ORDER BY `id` ASC LIMIT 0, 30');
	$all = '';
	for($i=0;$i<30;$i++){
		$row = $r->fetch_assoc();
		if (!is_null($row)) {
			$name = $row['name'];
			$url  = $row['page_url'];
			$all .= '                	<a href="'.$url.'" title="Play '.$name.' Free">'.$name.'</a>&nbsp;
	';	
		} else {
		  break;
		}
	}
	$r->free();
	return $all;
}

/**
 * Builds a list of all games
 * @param \mysqli $c db connection
 */
function get_all($c){
	$r = $c->query('SELECT * FROM `games` ORDER BY `id` ASC');
	$all = '';
	while($row = $r->fetch_assoc()){
		$name = $row['name'];
		$url  = $row['page_url'];
		$all .= '                	<a href="'.$url.'" title="Play '.$name.' Free">'.$name.'</a>&nbsp;
';
	}
	$r->free();
	return $all;
}
/**
 * @param string $cat category name
 * @param \mysqli $c db connection
 */
function get_by_cat($cat,$c){
	$cat = strtolower($cat);
	$r = $c->query('SELECT * FROM `games` WHERE `category`=\''.$cat.'\' ORDER BY `name` ASC');
	$n = $r->num_rows;
	$byCat = '';
	for($i=0;$i<$n;$i+=2){
		$row  = $r->fetch_assoc();
		$name = $row['name'];
		$url  = $row['page_url'];
		$img  = $row['img_url'];
		//$des  = $row['description'];
		$byCat .= '					<dl>
                    	<dt><a href="'.$url.'" title="Play '.$name.' Free"><img src="'.$img.'" width="70" height="60" alt="'.$name.'" />'.$name.'</a></dt>
                        <!--<dd class="clear"></dd>-->
                    </dl>
';
		if ($i+1<$n){
			$row = $r->fetch_assoc();
			$name = $row['name'];
			$url  = $row['page_url'];
			$img  = $row['img_url'];
			//$des  = $row['description'];
			$byCat .= '                    <dl class="right">
                    	<dt><a href="'.$url.'" title="Play '.$name.' Free"><img src="'.$img.'" width="70" height="60" alt="'.$name.'" />'.$name.'</a></dt>
                        <!--<dd class="clear"></dd>-->
                    </dl>
';
		}
	}
	$r->free();
	return $byCat;
}
