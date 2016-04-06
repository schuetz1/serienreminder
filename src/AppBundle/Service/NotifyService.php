<?php

namespace AppBundle\Service;

use AppBundle\Entity\Series;
use AppBundle\Entity\SeriesRepository;
use AppBundle\Entity\Subscription;
use AppBundle\Entity\User;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\EntityRepository;
use FOS\UserBundle\Mailer\Mailer;
use Symfony\Bundle\FrameworkBundle\Templating\DelegatingEngine;
use Symfony\Component\DependencyInjection\ContainerInterface;

class NotifyService
{
    /**
     * @var ContainerInterface
     */
    protected $container;

    /**
     * ImportService constructor.
     * @param ContainerInterface $container
     */
    public function __construct(ContainerInterface $container)
    {
        $this->container = $container;
    }

    /**
     * @return void
     * @throws \Exception
     */
    public function execute(\DateTime $date = null)
    {
        if (empty($date)) {
            $date = new \DateTime();
        }
        $date->setTime(0, 0, 0);
        $templating = $this->getTemplating();
        /** @var Series[] $series */
        $series = $this->getSeriesRepository()->findBy(['publishDate' => $date]);
        foreach ($series as $item) {
            /** @var Subscription[] $subscriptions */
            $subscriptions = $this->getSubscriptionRepository()->findBy(['seriesId' => $item->getId()]);
            foreach ($subscriptions as $subscription) {
                /** @var User $user */
                $user = $this->getUserRepository()->find($subscription->getUserId());

                $message = \Swift_Message::newInstance()
                    ->setSubject('Hello Email')
                    ->setFrom('schuetz2011@gmail.com')
                    //$user->getEmail()
                    ->setTo('schuetz2011@gmail.com')
                    ->setBody(
                        $templating->render(
                            'emails/notify.html.twig',
                            ['user' => $user, 'series' => $item]
                        ),
                        'text/html'
                    );
                $this->getMailer()->send($message);
            }
        }
    }

    /**
     * @return ContainerInterface
     */
    protected function getContainer() {
        return $this->container;
    }

    /**
     * @return EntityManager
     */
    protected function getEntityManager()
    {
        return $this->getContainer()->get('doctrine')->getManager();
    }

    /**
     * @return SeriesRepository
     */
    protected function getSeriesRepository()
    {
        return $this->getEntityManager()->getRepository('AppBundle:Series');
    }

    /**
     * @return EntityRepository
     */
    protected function getSubscriptionRepository()
    {
        return $this->getEntityManager()->getRepository('AppBundle:Subscription');
    }

    /**
     * @return EntityRepository
     */
    protected function getUserRepository()
    {
        return $this->getEntityManager()->getRepository('AppBundle:User');
    }

    /**
     * @return \Swift_Mailer
     */
    protected function getMailer() {
        return $this->getContainer()->get('mailer');
    }

    /**
     * @return DelegatingEngine
     */
    protected function getTemplating() {
        return $this->getContainer()->get('templating');
    }
}