<?php

namespace App\Controller;

use App\Service\Cart\CartService;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

class CartController extends AbstractController
{
    /**
     * @Route("/cart", name="cart")
     */
    public function index( CartService $cartService )
    {
        return $this->render( 'cart/index.html.twig', [
            'controller_name' => 'CartController',
            'items'           => $cartService->getFullCart(),
            'total'           => $cartService->getTotal()
        ]);
    }

    /**
     * @Route("/cart/add/{id}", name="product_add")
     */
    public function add( $id, CartService $cartService )
    {
        $cartService->add( $id );

        return $this->redirectToRoute( "cart" );
    }

    /**
     * @Route("/cart/supprimer/{id}", name="cart_remove")
     */
    public function remove( $id, CartService $cartService ) 
    {
        $cartService->remove( $id );

        return $this->redirectToRoute( "cart" );
    }

    /**
     * @Route("/cart/decrement/{id}", name="product_decrement")
     */
    public function decrement( $id, CartService $cartService ) 
    {
        $cartService->decrement( $id );

        return $this->redirectToRoute( "cart" );
    }
}
