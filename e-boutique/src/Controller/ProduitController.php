<?php

namespace App\Controller;

use App\Data\SearchData;
use App\Form\SearchForm;
use App\Repository\ProduitRepository;
use App\Repository\CategorieRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/produit")
 */
class ProduitController extends AbstractController
{
    
    /**
     * @Route("/", name="produit_index", methods={"GET"})
     */
    public function index( ProduitRepository $produitRepository, CategorieRepository $categorieRepository, Request $request ): Response
    {
        $data = new SearchData();

        $form = $this->createForm( SearchForm::class, $data );
        $form->handleRequest( $request );

        $produits = $produitRepository->findSearch( $data );

        return $this->render( 'produit/index.html.twig', [
            'produits'      => $produits,
            'form'          => $form->createView(),
        ]);
    }

}
