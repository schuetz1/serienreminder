<?php
/**
 * Created by PhpStorm.
 * User: karstenschutz
 * Date: 22.03.16
 * Time: 23:43
 *
 * Es wird zunächst geprüft, ob es eine Englische oder Deusche Staffel ist.
 * Wenn es deutsch ist, wird nach dem deutschen Namen gesucht, wenn es Englisch ist, nach dem englische.
 * @var $getArrayKey: Gibt an, an welcher Position in der URL sich der Name "Staffel" / "Season" befindet.
 ** @var $getNextArrayKey: Macht die Position des Array Keys Plus 1, um die Staffel Nummer zu bekommen.
 */

$getStaffelFromXml = $series->link;
$isGerman = strpos($getStaffelFromXml, 'staffel');
$isEnglish = strpos($getStaffelFromXml, 'season');

if ($isGerman) {
    $getStaffelArray = explode("-", $getStaffelFromXml);
    $getArrayKey = array_search('staffel', $getStaffelArray);
    $getNextArrayKey = $getArrayKey + 1;
} elseif ($isEnglish) {
    $getStaffelArray = explode("-", $getStaffelFromXml);
    $getArrayKey = array_search('season', $getStaffelArray);
    $getNextArrayKey = $getArrayKey + 1;
} elseif ($isGerman === false && $isEnglish === false) {

    $getStaffelArray = NULL;
    $getArrayKey = NULL;
    $getNextArrayKey = NULL;
}