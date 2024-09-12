package com.baseleap.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@Slf4j
public class DemoControlller {
	
	@GetMapping("/demo")
	public String demo() {
		log.info("demo()");
		return "demo";
	}
}
