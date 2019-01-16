package edu.spring.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

	private final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping(value = "/main", method = RequestMethod.POST)
	public String main(Locale locale, Model model) {
		logger.info("Main Start", locale);
		
		return "main";
	}
	
	@RequestMapping(value = "/web/tech")
	public String tech() {
		return "/web/tech";
	}
	
	@RequestMapping(value = "/web/fasion")
	public String fasion() {
		return "/web/fasion";
	}
	
	@RequestMapping(value = "/web/design")
	public String design() {
		return "/web/design";
	}
	
	@RequestMapping(value = "/web/animal")
	public String animal() {
		return "/web/animal";
	}
	
	@RequestMapping(value = "/web/hobby")
	public String hobby() {
		return "/web/hobby";
	}
	
	@RequestMapping(value = "/web/social")
	public String social() {
		return "/web/social";
	}
	
	@RequestMapping(value = "/web/description")
	public String description() {
		return "/web/description";
	}
	
	@RequestMapping(value = "/user/point-charge")
	public String charge() {
		return "/user/point-charge";
	}
}
