<?php


/**
 * User: karstenschutz
 * Date: 19.03.16
 * Time: 23:51
 * Class XML:
 * CreateTable = Lädt über die Methode "getXmlFormUrl von der Staffel API, die aktuellen Staffel.
 * Die Funktion "createTable" baut die Tabelle für das Dashboard.
 */
class XML
{
    public function createTable()
    {
        // Lädt die XML Datei von der Serienjunkies API herunter.
        require_once("getSeasonsFromUrlHelper.php");
        $getXML = new getSeasonsFromUrlHelper();

        foreach ($getXML->getXmlFromUrl()->channel->item as $series) {
            require_once("isGermanOrEnglishHelper.php");
            require_once("dateHelper.php");

            echo '<tr>';
            echo '<td>' . substr(str_replace('.', ' ', $series->title), 1, 2) . '</td>';
            echo '<td>' . substr(str_replace('.', ' ', $series->title), 10, 1000) . '</td>';
            echo '<td>' . ucfirst($getStaffelArray[$getArrayKey] . ' ' . $getStaffelArray[$getNextArrayKey]) . '</td>';
            echo '<td>' . $new_date . '</td>';
            echo '<td>' . '<a href=' . $series->link . ' target="_blank">Weitere Informationen</a>' . '</td>';
            echo '</tr>';
        };

    }
}