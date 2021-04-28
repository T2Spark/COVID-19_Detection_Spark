package com.team2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team2.dao.getData;

@Controller

public class HelloController {
   
	@RequestMapping("/hello")
   public ModelAndView home() {
	   ModelAndView modelandview=new ModelAndView();
		modelandview.setViewName("home");		
		String s=getData.getProbab();
		modelandview.addObject("states",s);
		return modelandview;
   }   
   
}