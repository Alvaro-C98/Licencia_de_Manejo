package com.mvc.licmanejo.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.mvc.licmanejo.models.License;
import com.mvc.licmanejo.models.Person;
import com.mvc.licmanejo.services.MainService;

import jakarta.validation.Valid;

@Controller
public class MainController {
	@Autowired
	private MainService mainService;
	
	@GetMapping("/")
	public String home(Model viewModel) {
		List<Person> users = mainService.allPerson();
		viewModel.addAttribute("all", users);
		return "home.jsp";
	}
	
	@GetMapping("/persons/{id}")
	public String show(@PathVariable("id") Long id, Model model) {
		Person person = mainService.findPer(id);
		model.addAttribute("user",person);
		return "user.jsp";
	}
	
    @GetMapping("/persons/new")
    public String newPerson(@ModelAttribute("person") Person person) {
        return "person.jsp";
    }
  
    @PostMapping("/persons/new")
    public String createPer(@Valid @ModelAttribute("person") Person person, BindingResult result) {
        if (result.hasErrors()) {
            return "person.jsp";
        } else {
            mainService.createPer(person);
            return "redirect:/";
        }
    }
    
    @GetMapping("/licenses/new")
    public String newLicense(@ModelAttribute("license") License license, Model model) {
    	List<Person> users = mainService.findIDNull();
    	model.addAttribute("users",users);
    	return "license.jsp";
    }

    @PostMapping("/licenses/new")
    public String createLic(@Valid @ModelAttribute("license") License license, 
    		BindingResult result, Model model) {
        if (result.hasErrors()) {
        	model.addAttribute("users",mainService.findIDNull());
        	return "license.jsp";
        } else {
            mainService.createLic(license);
            return "redirect:/";
        }
    }
}
