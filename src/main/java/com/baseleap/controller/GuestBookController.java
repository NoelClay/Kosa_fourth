package com.baseleap.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.baseleap.model.GuestBook;
import com.baseleap.service.GuestBookService;

import java.util.List;

@Controller
public class GuestBookController {

    @Autowired
    private GuestBookService guestBookService;

    // 방명록 페이지를 띄움, ownerId로 방명록 항목을 검색
    @GetMapping("/guestbook")
    public String guestBook(@RequestParam Long ownerId, Model model) {
        List<GuestBook> guestBooks = guestBookService.getGuestBooksByOwnerId(ownerId);
        model.addAttribute("guestBooks", guestBooks);
        return "guestbook";
    }
}

