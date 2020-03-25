<?php

namespace App\Controller;

use App\Data\SearchData;
use App\Form\SearchForm;
use App\Repository\ProductRepository;
use App\Repository\CategoryRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/product")
 */
class ProductController extends AbstractController
{
    
    /**
     * @Route("/", name="product_index", methods={"GET"})
     */
    public function index( ProductRepository $productRepository, CategoryRepository $categoryRepository, Request $request ): Response
    {
        $data = new SearchData();

        $form = $this->createForm( SearchForm::class, $data );
        $form->handleRequest( $request );

        $products = $productRepository->findSearch( $data );

        return $this->render( 'product/index.html.twig', [
            'products'      => $products,
            'form'          => $form->createView(),
        ]);
    }

}
