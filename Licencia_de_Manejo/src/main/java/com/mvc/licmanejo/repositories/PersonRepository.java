package com.mvc.licmanejo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.mvc.licmanejo.models.Person;

@Repository
public interface PersonRepository extends CrudRepository<Person,Long>{
	List<Person> findAll();
	@Query(value="SELECT p.* FROM persons p LEFT OUTER JOIN licenses l ON p.id=l.person_id WHERE l.id IS NULL", nativeQuery=true)
	List<Person> findIdLicNull();
	
	//List<Person> findByLicenseIdIsNull();
}
