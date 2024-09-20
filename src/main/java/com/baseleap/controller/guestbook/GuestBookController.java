package com.baseleap.controller.guestbook;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.baseleap.model.guestbook.GuestBook;
import com.baseleap.service.guestbook.IGuestBookService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/guestbook")
@Slf4j
public class GuestBookController {

    @Autowired
    private IGuestBookService guestBookService;

    // 특정 사용자의 방명록 리스트를 가져오는 메서드
    @GetMapping("/{ownerId}")
    public String getGuestBookList(@PathVariable("ownerId") Long ownerId, Model model, HttpSession session) {
        List<GuestBook> guestBooks = guestBookService.getGuestBookListByOwnerId(ownerId);
        for(GuestBook obj : guestBooks){
            log.info(Long.toString(obj.getId()));
            log.info(Long.toString(obj.getWriterId()));
            log.info(Long.toString(obj.getOwnerId()));
            log.info(obj.getComment());
            log.info(obj.getCreatedAt().toString());

        }
        log.info("방명록 사이즈" + guestBooks.size());
        model.addAttribute("guestBooks", guestBooks);
        model.addAttribute("ownerId", ownerId);
        model.addAttribute("loginUserId", session.getAttribute("loginUserId"));
        return "guestbook"; // JSP 파일 이름 (guestbook.jsp)
    }

    // 방명록 항목을 추가하는 메서드
    @PostMapping("/add")
    public String addGuestBookEntry(@RequestParam Long writerId,
                                    @RequestParam Long ownerId,
                                    @RequestParam String noteComment) {
        GuestBook guestBook = new GuestBook();

        guestBook.setWriterId(writerId);
        log.info(Long.toString(writerId));
        guestBook.setOwnerId(ownerId);
        log.info(Long.toString(ownerId));
        guestBook.setComment(noteComment);
        log.info(noteComment);
        guestBookService.insertGuestBook(guestBook);
        return "redirect:/guestbook/" + ownerId; // 방명록 리스트 페이지로 리다이렉트
    }

    // 방명록 항목을 업데이트하는 메서드
    @PostMapping("/update")
    public String updateGuestBookEntry(@RequestParam Long id,
                                       @RequestParam Long ownerId,
                                       @RequestParam String comment) {
        GuestBook guestBook = new GuestBook();
        guestBook.setId(id);
        guestBook.setComment(comment);
        guestBookService.updateGuestBook(guestBook);
        return "redirect:/guestbook/" + ownerId; // 방명록 리스트 페이지로 리다이렉트
    }

    // 방명록 항목을 삭제하는 메서드
    @PostMapping("/delete")
    public String deleteGuestBookEntry(@RequestParam Long id, @RequestParam Long ownerId) {
        GuestBook guestBook = new GuestBook();
        guestBook.setId(id);
        guestBookService.deleteGuestBook(guestBook);
        return "redirect:/guestbook/" + ownerId; // 방명록 리스트 페이지로 리다이렉트
    }

    // 특정 writerId와 ownerId로 방명록 항목을 가져오는 메서드
    @GetMapping("/entry")
    public String getGuestBookEntry(@RequestParam Long ownerId,
                                    @RequestParam Long writerId,
                                    Model model) {
        GuestBook guestBook = guestBookService.getGuestBookByWriterAndOwner(ownerId, writerId);
        model.addAttribute("guestBook", guestBook);
        return "guestbook_entry"; // JSP 파일 이름 (guestbook_entry.jsp)
    }
}