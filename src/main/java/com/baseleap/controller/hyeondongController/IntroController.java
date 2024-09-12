package com.baseleap.controller.hyeondongController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IntroController {
    @GetMapping("")
    public String index() {
        return "redirect:/intro";
    }

    @GetMapping("/intro")
    public String intro() {
        return "intro";
    }
}
