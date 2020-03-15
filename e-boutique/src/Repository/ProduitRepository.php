<?php

namespace App\Repository;

use App\Data\SearchData;
use App\Entity\Produit;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;

/**
 * @method Produit|null find($id, $lockMode = null, $lockVersion = null)
 * @method Produit|null findOneBy(array $criteria, array $orderBy = null)
 * @method Produit[]    findAll()
 * @method Produit[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ProduitRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Produit::class);
    }

    /**
     * @return Produit[] Returns an array of Produit objects
     */

    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('p')
            ->andWhere('p.categorie = :val')
            ->setParameter('val', $value)
            ->orderBy('p.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    
    /** 
     * @return Produit[] Rècupèrer les produits en lien avec une recherche
     */

    public function findSearch(SearchData $search): array 
    {
        $query = $this
            ->createQueryBuilder( 'p' );

        if( !empty( $search->q ) ) {
            $query = $query
                ->andWhere( 'p.nom LIKE :q' )
                ->setParameter( 'q', "%{$search->q}%" );
        }
        
        if( !empty( $search->min ) ) {
            $query = $query
                ->andWhere( 'p.prix >= :min' )
                ->setParameter( 'min', $search->min );
        }
        
        if( !empty( $search->max ) ) {
            $query = $query
                ->andWhere( 'p.prix <= :max' )
                ->setParameter( 'max', $search->max );
        }

        if( !empty( $search->categories ) ) {
            $query = $query
                ->andWhere( 'p.categorie IN (:categories)' )
                ->setParameter( 'categories', $search->categories );
        }

        return $query->getQuery()->getResult();
    }
}
