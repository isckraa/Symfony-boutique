<?php

namespace App\Controller;

use DateTime;
use App\Entity\Command;
use App\Entity\User;
use App\Entity\Product;
use App\Entity\CommandLine;
use App\Form\CommandType;
use App\Repository\CommandLineRepository;
use App\Service\Cart\CartService;
use App\Repository\CommandRepository;
use App\Repository\ProductRepository;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

/**
 * @Route("/command")
 */
class CommandController extends AbstractController
{
    /**
     * @Route("/", name="command_index", methods={"GET"})
     */
    public function index(CommandRepository $commandRepository): Response
    {
        $userId = $this->getUser()->getId();
        $commands = $commandRepository->findByExampleField( $userId );

        return $this->render('command/index.html.twig', [
            'commands' => $commands,
        ]);
    }

    /**
     * @Route("/new", name="command_new", methods={"GET","POST"})
     */
    public function new(CartService $cartService)
    {
        $entityManager = $this->getDoctrine()->getManager();
        
        $command = new Command();
        $command->setUser( $this->getUser() );
        $rand = rand(10000,99999);
        $command->setOrderNumber( "OMNI-RF$rand" );
        $command->setState('en cours');
        $command->setDateTime( new DateTime() );

        $entityManager->persist( $command );
        $entityManager->flush();

        
        foreach( $cartService->getFullCart() as $cart )
        {
            $commandLine = new CommandLine();        
            
            $product = $cart['product'];

            $commandLine->setProduct($product);
            $commandLine->setCommand($command);
            $commandLine->setQuantity($cart['quantity']);

            $entityManager->persist($commandLine);
            $entityManager->flush();
        }
        

        return $this->redirectToRoute( "command_index" );
    }

    /*
    public function new(Request $request): Response
    {
        $command = new Command();
        $form = $this->createForm(CommandType::class, $command);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($command);
            $entityManager->flush();

            return $this->redirectToRoute('command_index');
        }

        return $this->render('command/new.html.twig', [
            'command' => $command,
            'form' => $form->createView(),
        ]);
    }
    */

    /**
     * @Route("/{id}", name="command_show", methods={"GET"})
     */
    public function show(Command $command, CommandLineRepository $commandLineRepository): Response
    {
        $commandId = $command->getId();
        $products = array();
        $quantities = array();
        
        // dd($commandLineRepository->findByCommand($commandId));

        foreach( $commandLineRepository->findByCommand($commandId) as $command )
        {
            $product = $command->getProduct();
            $quantity = $command->getQuantity();


            array_push($products, $product);
            array_push($quantities, $quantity);
        }

        // var_dump($products);
        // exit;
        // dd($products);

        return $this->render('command/show.html.twig', [
            'command'   => $command,
            'products'  => $products,
            'quantities'=> $quantities,
        ]);
    }

    /**
     * @Route("/{id}/edit", name="command_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, Command $command): Response
    {
        $form = $this->createForm(CommandType::class, $command);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('command_index');
        }

        return $this->render('command/edit.html.twig', [
            'command' => $command,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="command_delete", methods={"DELETE"})
     */
    public function delete(Request $request, Command $command): Response
    {
        if ($this->isCsrfTokenValid('delete'.$command->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($command);
            $entityManager->flush();
        }

        return $this->redirectToRoute('command_index');
    }
}
