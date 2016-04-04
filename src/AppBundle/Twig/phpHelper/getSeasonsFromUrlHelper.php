<?php

/**
 * User: karstenschutz
 * Date: 25.03.16
 * Time: 23:51
 * Die Klasse liest alle Serien der Datenbank aus, um sie in der Select Box auszugeben.
 */

class getSeasonsFromUrlHelper {

    public function getXmlFromUrl()
    {
        $xml = simpleXML_load_file("http://serienjunkies.org/xml/feeds/staffeln.xml");
        return $xml;
    }
}