<?php
/**
 * Created by PhpStorm.
 * User: karstenschutz
 * Date: 22.03.16
 * Time: 23:51
 *
 * Gibt das aktuelle Datum der Serie formatiert in d.m.Y aus.
 */

$date = $series->pubDate;
$timestamp = strtotime($date);
$new_date = date('d.m.Y',$timestamp );