<?php

namespace AppBundle\Entity;

use Doctrine\ORM\EntityRepository;

class SeriesRepository extends EntityRepository
{
    /**
     * @return array
     */
    public function findAllGroupedByName()
    {
        return $this->getEntityManager()
            ->createQuery(
                'SELECT s FROM AppBundle:Series s GROUP BY s.name ORDER BY s.name ASC'
            )
            ->getResult();
    }
}
