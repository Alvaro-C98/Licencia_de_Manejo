package com.mvc.licmanejo.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.mvc.licmanejo.models.License;

@Repository
public interface LicenseRepository extends CrudRepository<License,Long>{
	public License findTopByOrderByNumberDesc();
}
