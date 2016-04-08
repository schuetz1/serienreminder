<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Series;
use AppBundle\Entity\SeriesRepository;
use AppBundle\Entity\Subscription;
use Doctrine\Common\Persistence\ObjectRepository;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\HttpFoundation\Request;

class DefaultController extends Controller
{
    /**
     * @var SeriesRepository
     */
    protected $seriesRepository;

    /**
     * @var ObjectRepository
     */
    protected $subscriptionRepository;

    /**
     * @Route("/", name="homepage")
     */
    public function indexAction(Request $request)
    {
        return $this->render('default/index.html.twig', [
            'base_dir' => realpath($this->getParameter('kernel.root_dir') . '/..'),
        ]);
    }

    /**
     * @Route("/", name="homepage")
     * @Route("/dashboard", name="dashboard")
     */
    public function dashboardAction(Request $request)
    {
        return $this->render(
            'dashboard/dashboard.html.twig',
            ['series' => $this->getSeriesRepository()->findAllGroupedByName()]
        );
    }



    /**
     * @Route("/dashboard/meine-serien", name="mein-serien")
     */
    public function meineSerienAction(Request $request)
    {
        $options = [];
        $series = $this->getSeriesRepository()->findAllGroupedByName();
        foreach ($series as $item) {
            /** @var $item Series */
            $options[$item->getName()] = $item->getId();
        }

        $subscription = new Subscription();
        $form = $this->createFormBuilder($subscription)
            ->add('seriesId', ChoiceType::class, ['choices' => $options, 'label' => 'Serie', 'placeholder' => 'Wähle deine Lieblingsserie'])
            ->add('save', SubmitType::class, ['label' => 'Für meine Serie eintragen'])
            ->getForm();


        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $subscription->setUserId($this->getUser()->getId());
            $persistentSubscription = $this->getSubscriptionRepository()->findOneBy([
                'userId' => $subscription->getUserId(),
                'seriesId' => $subscription->getSeriesId()
            ]);
            if (empty($persistentSubscription)) {
                $this->getDoctrine()->getManager()->persist($subscription);
                $this->getDoctrine()->getManager()->flush();
            }
            return $this->redirectToRoute('dashboard');
        }

        return $this->render(
            'meine-serien/meine-serien.html.twig',
            ['form' => $form->createView()]
        );
    }
    /**
     * @return SeriesRepository
     */
    protected function getSeriesRepository()
    {
        if (empty($this->seriesRepository)) {
            $this->seriesRepository = $this->getDoctrine()->getManager()->getRepository('AppBundle:Series');
        }
        return $this->seriesRepository;
    }

    /**
     * @return SeriesRepository
     */
    protected function getSubscriptionRepository()
    {
        if (empty($this->subscriptionRepository)) {
            $this->subscriptionRepository = $this->getDoctrine()->getManager()->getRepository('AppBundle:Subscription');
        }
        return $this->subscriptionRepository;
    }
}
