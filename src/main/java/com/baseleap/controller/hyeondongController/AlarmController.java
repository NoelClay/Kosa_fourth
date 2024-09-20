package com.baseleap.controller.hyeondongController;

import com.baseleap.model.hyeondongModel.AlarmDTO;
import com.baseleap.model.hyeondongModel.AlarmUserDTO;
import com.baseleap.service.hyeondongService.AlarmService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Slf4j
@Controller
@RequestMapping(value = "/alarm")
public class AlarmController {
    @Autowired
    private AlarmService alarmService;

    @GetMapping(value = "/get-list")
    public String getAllAlarms(
            HttpServletRequest request,
            Model model
    ) {
        HttpSession session = request.getSession();
        String stringUserId = (String) session.getAttribute("userId");
        int userId = Integer.parseInt(stringUserId);
        List<AlarmUserDTO> alarmUserDTOList = alarmService.getAllAlarms(userId);
        model.addAttribute("alarmUserDTOList", alarmUserDTOList);
        return "my-page/alarm-list";
    }

    @PostMapping(value = "/read")
    public String readAlarm(@RequestParam("alarmId") int alarmId) {
        alarmService.readAlarm(alarmId);
        return "redirect:/alarm/get-list";
    }
}
