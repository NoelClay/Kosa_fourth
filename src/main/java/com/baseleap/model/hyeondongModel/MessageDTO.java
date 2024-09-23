package com.baseleap.model.hyeondongModel;

import lombok.Data;

import java.util.Date;

// 메세지를 만들기 위한 DTO.
@Data
public class MessageDTO {
    private int id;
    private int senderId;
    private int receiverId;
    private String content;
    private Date createdAt;
    private Date readAt;
}
