<?php

namespace AppBundle\Command;

use AppBundle\Service\ImportService;
use Symfony\Bundle\FrameworkBundle\Command\ContainerAwareCommand;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;

class SeriesImportCommand extends ContainerAwareCommand
{
    /**
     * @return void
     */
    protected function configure()
    {
        $this
            ->setName('series:import')
            ->setDescription('Imports series from serienjunkies.org to local database.')
        ;
    }

    /**
     * @param InputInterface $input
     * @param OutputInterface $output
     * @return void
     */
    protected function execute(InputInterface $input, OutputInterface $output)
    {
        $importService = new ImportService($this->getContainer()->get('doctrine')->getManager());
        $importService->execute();
    }
}