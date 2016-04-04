<?php
namespace AppBundle\Twig;

class AppExtension extends \Twig_Extension
{
    public function getFilters()
    {
        return array(
            new \Twig_SimpleFilter('importSeries', array($this, 'importSeriesFilter')),
            new \Twig_SimpleFilter('importCssAndJs', array($this, 'importCssAndJsFilter')),
            new \Twig_SimpleFilter('importSeriesFromDatabase', array($this, 'importSeriesFromDatabaseFilter')),
            new \Twig_SimpleFilter('createTable', array($this, 'createTableFilter')),
            new \Twig_SimpleFilter('getDateToday', array($this, 'getdayTodayFilter')),

        );
    }



    public function importSeriesFilter()
    {
        require_once('phpHelper/databaseHelper.php');
        require_once('phpHelper/getSeasonsFromUrlHelper.php');
        require_once ('phpHelper/getSeasonsFromDatabaseHelper.php');
        $database = new \Database();
        $staffelRepository = new \getSeasonsFromUrlHelper();
        $series = $staffelRepository->getXmlFromUrl();

        foreach ($series->channel->item as $series) {


            require_once("phpHelper/isGermanOrEnglishHelper.php");

            $query = 'INSERT INTO serien (
             language,
             name,
             season,
             date,
             url
         )
         VALUES (
              "' . substr(str_replace('.', ' ', $series->title), 1, 2) . '",
              "' . substr(str_replace('.', ' ', $series->title), 10, 1000) . '",
              "' . ucfirst($getStaffelArray[$getArrayKey] . ' ' . $getStaffelArray[$getNextArrayKey]) . '",
              "' . $series->pubDate . '",
              "' . $series->link . '"
         )';
            $database->getResult($query);

        }
    }

    public function importCssAndJsFilter()
    {
        require_once('phpHelper/getJsAndCssHelper.php');

    }

    public function importSeriesFromDatabaseFilter()
    {
        require_once('phpHelper/getSeasonsFromDatabaseHelper.php');
        $getSeasons = new \getSeasonsFromDatabaseHelper;
        $seasons = $getSeasons->getSeriesNames();

        foreach ($seasons as $season) {

            echo '
                        <option>' . $season['name'] . '</option>
                        ';
        }
    }

    public function createTableFilter()
    {
        require_once('phpHelper/getXmlHelper.html.php');
        $xml = new \XML();
        $xml->createTable();
    }


    public function getdayTodayFilter()
    {
        $currentDay =getdate(date("U"));
        echo '<p class="pull-right">Datum: ';
        echo "$currentDay[mday].$currentDay[mon].$currentDay[year]";
        echo '</p>';
    }



    public function getName()
    {
        return 'app_extension';
    }
}

?>