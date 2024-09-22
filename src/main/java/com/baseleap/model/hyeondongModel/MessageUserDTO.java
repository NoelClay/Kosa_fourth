package com.baseleap.model.hyeondongModel;

import lombok.Data;

import java.util.Date;

// 메세지를 가져오고 처리하기 위한 DTO.
@Data
public class MessageUserDTO {
    private int id;
    private String profileImage;
    private String nickname;
    private String content;
    private String createdAt;
    private String readAt;
}
