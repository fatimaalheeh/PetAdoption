package com.axsos.logandreg.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.axsos.logandreg.models.Category;
import com.axsos.logandreg.models.Pet;


@Repository
public interface  PetRepository extends CrudRepository<Pet, Long>{

    List <Pet> findAll(); 

    List <Pet> findByCategoryContains(Category category);
    List <Pet> findByName(String name);
    Optional<Pet> findById(Long id);
}