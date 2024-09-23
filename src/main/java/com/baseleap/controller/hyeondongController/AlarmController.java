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
import org.springframework.web.bind.annotation.*;

import java.sql.SQLSyntaxErrorException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@Slf4j
@Controller
@RequestMapping(value = "/alarm")
public class AlarmController {
    @Autowired
    private AlarmService alarmService;

    @ResponseBody
    @GetMapping(value = "/get-list")
    public Map<String, Object> getAllAlarms(
            HttpServletRequest request
    ) {
        HttpSession session = request.getSession();
        String stringUserId = (String) session.getAttribute("userId");
        int userId = Integer.parseInt(stringUserId);
        List<AlarmUserDTO> alarmUserDTOList = alarmService.getAllAlarms(userId);
        Map<String, Object> responseBody = new HashMap<>();
        responseBody.put("status", "success");
        responseBody.put("message", "알림 리스트 가져오기 성공.");
        responseBody.put("data", alarmUserDTOList);
        return responseBody;
    }

    @ResponseBody
    @DeleteMapping(value = "/read")
    public Map<String, String> readAlarm(
            @RequestBody HashMap<String, Integer> requestBody) {
        int alarmId = requestBody.get("alarmId");
        Map<String, String> responseBody = new HashMap<>();
        alarmService.readAlarm(alarmId);
        responseBody.put("status", "success");
        responseBody.put("message", "읽음 처리 완료...");
        return responseBody;
    }
}
