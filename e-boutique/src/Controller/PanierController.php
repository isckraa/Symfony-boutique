<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;

class PanierController extends AbstractController
{
    /**
     * @Route("/panier", name="panier")
     */
    public function index()
    {
        return $this->render( 'panier/index.html.twig', [
            'controller_name' => 'PanierController',
        ]);
    }

    /**
     * @Route("/panier/add/{id}", name="produit_add")
     */
    public function add( $id, Request $request )
    {
        $session = $request->getSession();
        $panier = $session->get( 'panier', [] );

        if( !empty( $panier[$id] ) ) {
            $panier[$id]++;
        } else {
            $panier[$id] = 1;
        }


        $session->set( 'panier', $panier );

        dd( $session->get( 'panier' ) );
    }
}
