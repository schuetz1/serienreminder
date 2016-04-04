<?php
/**
 * Created by PhpStorm.
 * User: karstenschutz
 * Date: 22.03.16
 * Time: 23:51
 *
 * Die Klasse Database stellt eine Verbindung zur Datenbank her und gibt sie in einer Variablen zurück.
 */


class Database {

    /**
     * @var mysqli
     */
    protected $connection;

    /**
     * @return mysqli
     */
    protected function getConnection() {
        if (empty($this->connection)) {
            $this->connection = mysqli_connect('127.0.0.1', 'dev', 'dev');
            if (!$this->connection) {
                die('Verbindung schlug fehl: ' . mysql_error());
            }
            if (!mysqli_select_db($this->connection, 'serienreminder')) {
                die('Konnte mydbname nicht selektieren: ' . mysql_error());
            }
        }
        return $this->connection;
    }

    /**
     * @param string $query
     * @return mysqli_result
     * @throws Exception
     */
    public function getResult($query) {
        $result = mysqli_query($this->getConnection(), $query);
        if (mysqli_errno($this->getConnection())) {
            throw new \Exception(mysqli_error($this->getConnection()));
        }
        return $result;
    }

    /**
     * Fetch All from Database "serienreminder"
     * @param string $query
     * @return array
     */
    public function getRows($query) {
        $result = $this->getResult($query);
        return mysqli_fetch_all($result, MYSQL_ASSOC);

    }
}