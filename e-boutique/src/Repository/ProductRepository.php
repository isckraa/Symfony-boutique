<?php

namespace App\Repository;

use App\Data\SearchData;
use App\Entity\Product;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;

/**
 * @method Product|null find($id, $lockMode = null, $lockVersion = null)
 * @method Product|null findOneBy(array $criteria, array $orderBy = null)
 * @method Product[]    findAll()
 * @method Product[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ProductRepository extends ServiceEntityRepository
{
    public function __construct( ManagerRegistry $registry )
    {
        parent::__construct( $registry, Product::class );
    }

    /** 
     * @return Product[] Rècupèrer les produits en lien avec une recherche
     */

    public function findSearch( SearchData $search ): array
    {
        $query = $this
            ->createQueryBuilder( 'p' );

        if( !empty( $search->q ) ) {
            $query = $query
                ->andWhere( 'p.name LIKE :q' )
                ->setParameter( 'q', "%{$search->q}%" );
        }
        
        if( !empty( $search->min ) ) {
            $query = $query
                ->andWhere( 'p.price >= :min' )
                ->setParameter( 'min', $search->min );
        }
        
        if( !empty( $search->max ) ) {
            $query = $query
                ->andWhere( 'p.price <= :max' )
                ->setParameter( 'max', $search->max );
        }

        if( !empty( $search->categories ) ) {
            $query = $query
                ->andWhere( 'p.category IN (:categories)' )
                ->setParameter( 'categories', $search->categories );
        }

        return $query->getQuery()->getResult();
    }
}
