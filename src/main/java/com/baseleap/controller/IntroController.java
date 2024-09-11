package com.baseleap.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/intro")
public class IntroController {
    @GetMapping("")
    public String intro() {
        return "intro";
    }
}
