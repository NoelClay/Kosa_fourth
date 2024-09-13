package com.baseleap.model.hyeondongModel;

import lombok.Data;

import java.util.Date;

@Data
public class MessageUserDTO {
    private int id;
    private String profileImage;
    private String nickname;
    private String content;
    private Date createdAt;
    private Date readAt;
}
