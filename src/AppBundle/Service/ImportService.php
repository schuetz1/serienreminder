<?php
namespace AppBundle\Service;

use AppBundle\Entity\Series;
use AppBundle\Entity\SeriesRepository;
use Doctrine\ORM\EntityManager;

class ImportService
{
    /**
     * @var EntityManager
     */
    protected $entityManager;

    /**
     * ImportService constructor.
     * @param EntityManager $entityManager
     */
    public function __construct(EntityManager $entityManager)
    {
        $this->entityManager = $entityManager;
    }

    /**
     * @return void
     * @throws \Exception
     */
    public function execute()
    {
        $source = simpleXML_load_file('http://serienjunkies.org/xml/feeds/staffeln.xml');
        if (empty($source->channel->item)) {
            throw new \Exception('Could not load xml');
        }

        foreach ($source->channel->item as $item) {
            $name = explode('/', parse_url($item->link, PHP_URL_PATH))[1];
            $name = str_replace('-', ' ', $name);
            $name = ucwords($name);

            if (!preg_match('/\[([^\]]+)\].*/', $item->title, $matches)) {
                throw new \Exception('Could not parse language');
            }

            switch (strtolower($matches[1])) {
                case 'deutsch':
                case 'german':
                    $language = 'de';
                    break;
                case 'englisch':
                case 'english':
                case 'enlisch':
                    $language = 'en';
                    break;
                default:
                    throw new \Exception('Unknown language ' . $matches[1]);
            }

            $series = $this->getSeriesRepository()->findOneBy(array('name' => $name, 'language' => $language));

            if (empty($series)) {
                $series = new Series();
                $series->setName($name);
                $series->setLanguage($language);
            }

            $series->setPublishDate(new \DateTime($item->pubDate));
            $series->setUrl($item->link);

            $this->getEntityManager()->persist($series);
            $this->getEntityManager()->flush();
        }
    }

    /**
     * @return EntityManager
     */
    protected function getEntityManager()
    {
        return $this->entityManager;
    }

    /**
     * @return SeriesRepository
     */
    protected function getSeriesRepository()
    {
        return $this->getEntityManager()->getRepository('AppBundle:Series');
    }
}