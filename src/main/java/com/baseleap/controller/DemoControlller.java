package com.baseleap.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DemoControlller {
	
	@GetMapping("/demo")
	public String demo() {
		return "demo";
	}
}
