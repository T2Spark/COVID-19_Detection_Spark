package com.team2.controller;

import java.util.HashMap;
import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller

public class HelloController {
   
	@RequestMapping("/hello")
   public ModelAndView home() {
	   ModelAndView modelandview=new ModelAndView();
		modelandview.setViewName("home");
		Map<String,long[]> m =new HashMap<>();
		m.put("Tamilnadu", new long[] {1081988,963251,13557,105180});
		m.put("Andhra Pradesh", new long[] {1033560,936143,7685,89732});
		m.put("Maharashtra", new long[] {42950273,14300507,195161,2810092});
		System.out.println(m.get("Tamilnadu")[0]);
		modelandview.addObject("map",m);
		return modelandview;
   }   
   
}