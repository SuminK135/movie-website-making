package com.er.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.er.domain.PageDTO;
import com.er.domain.Paging;
import com.er.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log4j
@AllArgsConstructor
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	private BoardService service;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	/*
	 * @RequestMapping(value = "/", method = RequestMethod.GET) public String
	 * home(Locale locale, Model model) {
	 * logger.info("Welcome home! The client locale is {}.", locale);
	 * 
	 * Date date = new Date(); DateFormat dateFormat =
	 * DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
	 * 
	 * String formattedDate = dateFormat.format(date);
	 * 
	 * model.addAttribute("serverTime", formattedDate );
	 * 
	 * return "home"; }
	 */
	
	@RequestMapping(value= {"/", "/index"})
	public String index(Paging pg, Model model) {
		
		log.info("index..........");
		
		int total = service.getBoardTotalCount(pg);

		model.addAttribute("pageMaker", new PageDTO(pg, total));
		
		return "index";
	}
	
	@RequestMapping("/popup")
	public String popup() {
		
		log.info("popup..........");
		
		return "popup";
	}
	
}
