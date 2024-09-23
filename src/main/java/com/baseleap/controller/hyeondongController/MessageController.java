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
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
@RequestMapping(value = "/message")
public class MessageController {
    @Autowired
    private MessageService messageService;

    @Autowired
    private AlarmService alarmService;

    @ResponseBody
    @PostMapping(value = "/send-message")
    public Map<String, String> sendMessage(
            HttpServletRequest request,
            @RequestBody HashMap<String, String> requestBody) {
        // 메세지 만들기.
        HttpSession session = request.getSession();
        String stringSenderId = (String) session.getAttribute("userId");
        String stringReceiverId = requestBody.get("receiverId");
        int senderId = Integer.parseInt(stringSenderId);
        int receiverId = Integer.parseInt(stringReceiverId);
        String content = (String) requestBody.get("content");
        messageService.createNewMessage(senderId, receiverId, content);

        // 알림 만들기.
        String alarmContent = "님이 보낸 새로운 메세지가 있습니다.";
        alarmService.createNewAlarm(senderId, receiverId, alarmContent);

        Map<String, String> responseBody = new HashMap<>();
        responseBody.put("status", "success");
        responseBody.put("message", "성공적으로 보냈습니다.");

        return responseBody;
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
