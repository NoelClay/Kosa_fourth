package com.baseleap.controller.hyeondongController;

import com.baseleap.model.hyeondongModel.MessageUserDTO;
import com.baseleap.service.hyeondongService.AlarmService;
import com.baseleap.service.hyeondongService.MessageService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Slf4j
@Controller
@RequestMapping(value = "/message")
public class MessageController {
    @Autowired
    private MessageService messageService;

    @Autowired
    private AlarmService alarmService;

    @PostMapping(value = "/send-message")
    public String sendMessage(HttpServletRequest request) {
        // 메세지 만들기.
        HttpSession session = request.getSession();
        String content = request.getParameter("content");
        String stringSenderId = (String) session.getAttribute("userId");
        String stringReceiverId = request.getParameter("receiverId");
        int senderId = Integer.parseInt(stringSenderId);
        int receiverId = Integer.parseInt(stringReceiverId);
        messageService.createNewMessage(senderId, receiverId, content);

        // 알림 만들기.
        String alarmContent = "새로운 메세지";
        alarmService.createNewAlarm(senderId, receiverId, alarmContent);

        return "redirect:/my-page/search";
    }

    @GetMapping(value = "/new-messages")
    public String getNewMessages(
            Model model,
            HttpServletRequest request
    ) {
        // 읽지 않은 새 메세지들 가져오기.
        HttpSession session = request.getSession();
        String stringUserId = (String) session.getAttribute("userId");
        int userId = Integer.parseInt(stringUserId);
        List<MessageUserDTO> messageUserDTOList = messageService.getNotReadMessages(userId);
        model.addAttribute("messageUserDTOList", messageUserDTOList);

        return "message/new-messages";
    }

    @GetMapping(value = "/all-messages")
    public String getAllMessages(
            Model model,
            HttpServletRequest request
    ) {
        // 모든 메세지들 가져오기.
        HttpSession session = request.getSession();
        String stringUserId = (String) session.getAttribute("userId");
        int userId = Integer.parseInt(stringUserId);
        List<MessageUserDTO> messageUserDTOList = messageService.getAllMessages(userId);
        model.addAttribute("messageUserDTOList", messageUserDTOList);

        return "message/all-messages";
    }
    
    @PostMapping(value = "/read")
    public String readMessage(HttpServletRequest request) {
        String referer = request.getHeader("Referer");

        // referer가 null일 경우를 대비해 기본 페이지 설정 (선택 사항)
        if (referer == null || referer.isEmpty()) {
            referer = "/intro";  // 기본 리다이렉트 페이지 설정
        }

        String stringMessageId = request.getParameter("messageId");
        int messageId = Integer.parseInt(stringMessageId);
        messageService.readMessage(messageId);
        return "redirect:"+referer;
    }

    @PostMapping(value = "/delete")
    public String deleteMessage(HttpServletRequest request) {
        String referer = request.getHeader("Referer");

        // referer가 null일 경우를 대비해 기본 페이지 설정 (선택 사항)
        if (referer == null || referer.isEmpty()) {
            referer = "/intro";  // 기본 리다이렉트 페이지 설정
        }

        String stringMessageId = request.getParameter("messageId");
        int messageId = Integer.parseInt(stringMessageId);
        messageService.deleteMessage(messageId);
        return "redirect:"+referer;
    }
}
