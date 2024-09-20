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
	// ================================
	// 테스트 화면 이동
	// ================================
	@GetMapping("/test-main")
	public String testMain() {
		log.info("testMain()");
		return "test-main";
	}
}
