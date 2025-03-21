package com.CRUDAPI.CRUDAPI;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface AnimalRepository extends JpaRepository<Animal, Integer> {

    List<Animal> getAnimalsBySpecies(String species);

    @Query(value = "SELECT * FROM animals a WHERE a.name LIKE %?1%", nativeQuery = true)
    List<Animal> getAnimalsByName(String name);
}
