package com.mvc.licmanejo.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.licmanejo.models.License;
import com.mvc.licmanejo.models.Person;
import com.mvc.licmanejo.repositories.LicenseRepository;
import com.mvc.licmanejo.repositories.PersonRepository;

@Service
public class MainService {
	@Autowired
	private PersonRepository perRep;
	@Autowired
	private LicenseRepository licRep;
	
	public Person createPer(Person p) {
		return perRep.save(p);
	}
	
	public License createLic(License l) {
		l.setNumber(this.generateNumber());
		return licRep.save(l);
	}
	
	public List<Person> allPerson() {
		return perRep.findAll();
	}
	
	public List<Person> findIDNull() {
		return perRep.findIdLicNull();
	}
	
	public Person findPer(Long id) {
		Optional<Person> optionalPer = perRep.findById(id);
	    if(optionalPer.isPresent()) {
	    	return optionalPer.get();
	    }else {
	        return null;
	    }
	 }
	
	public int generateNumber() {
		License license = licRep.findTopByOrderByNumberDesc();
		if(license==null) {
			return 1;
		}
		int num = license.getNumber();
		num++;
		return num;
	}
}
