<?php

namespace App\Controller;

use App\Data\SearchData;
use App\Form\SearchForm;
use App\Entity\Produit;
use App\Form\ProduitType;
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
    public function index(ProduitRepository $produitRepository, CategorieRepository $categorieRepository): Response
    {
        $data = new SearchData();
        $form = $this->createForm(SearchForm::class, $data);

        return $this->render('produit/index.html.twig', [
            'produits'      => $produitRepository->findAll(),
            'categories'    => $categorieRepository->findAll(),
            'form'          => $form->createView(),
        ]);
    }
    
    /**
     * @Route("/categorie/{categoryId}", name="produit_show_category", methods={"GET"})
     */
    public function showByCategory(ProduitRepository $produitRepository, $categoryId): Response
    {
        return $this->render('produit/show.html.twig', [
            'produits' => $produitRepository->findByExampleField($categoryId),
        ]);
    }
}
