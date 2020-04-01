<?php

namespace App\Form;

use App\Entity\CustomerAddress;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class CustomerAddressType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('name')
            ->add('firstName')
            ->add('phone')
            ->add('address')
            ->add('postcode')
            ->add('city')
            ->add('country')
            ->add('type')
            ->add('user')
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => CustomerAddress::class,
        ]);
    }
}
