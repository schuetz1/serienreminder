<?php
/**
 * User: karstenschutz
 * Date: 25.03.16
 * Time: 23:51
 * Die Klasse liest alle Serien der Datenbank aus, um sie in der Select Box auszugeben.
 */
$getSeasons = new getSeasonsFromDatabaseHelper;
$getSeasons->getSeriesNames();
$getSeasons->getId();

class getSeasonsFromDatabaseHelper
{

    /**
     * @var Database
     */
    protected $database;

    /**
     * @return Database
     */
    protected function getDatabase()
    {
        if (empty($this->database)) {
            $this->database = new Database();
        }
        return $this->database;
    }

    /**
     * @return array

    public function getAll()
     * {
     * print_r($this->getDatabase()->getRows('SELECT * FROM game'));
     * }*/


    /**
     * @return array
     */
    public function getSeriesNames()
    {
        return $this->getDatabase()->getRows('SELECT name
                                               FROM serien');

    }

    public function getId()
    {
        return $this->getDatabase()->getRows('SELECT id
                                               FROM serien');

    }



}