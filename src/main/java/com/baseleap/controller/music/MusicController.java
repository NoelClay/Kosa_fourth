package com.baseleap.controller.music;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.baseleap.model.music.MusicModel;
import com.baseleap.service.music.IMusicService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
@Slf4j
@RequestMapping("/music")
public class MusicController {

    @Autowired
    private IMusicService musicService;

    // 1. 음악 등록 처리
    @PostMapping("/register")
    public String registerMusic(@RequestParam("musicName") String musicName,
            @RequestParam("musicFile") MultipartFile musicFile,
            HttpSession session) {

        Object tempObj = session.getAttribute("loginUserId");
        Long userId;
        if (tempObj instanceof Integer) {
            userId = ((Integer) tempObj).longValue();
        } else if (tempObj instanceof Long) {
            userId = (Long) tempObj;
        } else {
            // 예외 처리 (만약 올바른 타입이 아니라면)
            throw new IllegalArgumentException("Session attribute 'userId' is neither Integer nor Long.");
        }

        // 음악 등록 요청 (MusicService로 처리)
        musicService.requestRegisterMusic(musicName, musicFile, userId);

        // 성공 후 로그인된 사용자의 홈페이지로 리다이렉트
        return "redirect:/home/page?userId=" + userId;
    }

    // 2. 음악 리스트에서 선택한 음악 활성화 처리
    @PostMapping("/activate")
    public String activateMusic(@RequestParam("selectedMusic") String selectedMusic,
            HttpSession session) {
        // 세션에서 로그인한 사용자 ID 가져오기

        Object tempObj = session.getAttribute("loginUserId");
        Long loginUserId;
        if (tempObj instanceof Integer) {
            loginUserId = ((Integer) tempObj).longValue();
        } else if (tempObj instanceof Long) {
            loginUserId = (Long) tempObj;
        } else {
            // 예외 처리 (만약 올바른 타입이 아니라면)
            throw new IllegalArgumentException("Session attribute 'userId' is neither Integer nor Long.");
        }

        // 모든 음악을 비활성화한 후 선택된 음악만 활성화
        List<MusicModel> musicList = musicService.getMusicModelByOwnerID(loginUserId);
        for (MusicModel music : musicList) {
            boolean isActive = music.getName().equals(selectedMusic);
            musicService.setIsActiveMusic(music, isActive);
        }

        // 성공 후 로그인된 사용자의 홈페이지로 리다이렉트
        return "redirect:/home/page?userId=" + loginUserId;
    }

    @GetMapping("/{userId}/{fileName}")
    public ResponseEntity<Resource> serveMusicFile(@PathVariable Long userId, @PathVariable String fileName) {
        log.info("아니 들어는 왔어?");
        try {
            // 파일 경로
            Path filePath = Paths.get("custom/kosafourth/resources/music/" + userId + "/" + fileName);
            log.info(filePath.toString());
            Resource resource = new UrlResource(filePath.toUri());
            log.info(resource.toString());

            if (resource.exists() || resource.isReadable()) {
                return ResponseEntity.ok()
                        .contentType(MediaType.parseMediaType("audio/mpeg")) // 파일 타입 설정
                        .header(HttpHeaders.CONTENT_DISPOSITION, "inline; filename=\"" + resource.getFilename() + "\"")
                        .body(resource);
            } else {
                return ResponseEntity.notFound().build();
            }

        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

}
