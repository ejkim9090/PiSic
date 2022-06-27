package kh.spring.pisic.chart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/chart")
public class ChartController {
	
	@GetMapping("/chartMain") 
	public String MainPage() { 

		return "chart/chartMain"; 
	}

}