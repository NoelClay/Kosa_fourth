package com.baseleap.model.hyeondongModel;

import lombok.Data;

import java.util.Date;

@Data
public class MessageDTO {
    private int id;
    private int senderId;
    private int receiverId;
    private String content;
    private Date createdAt;
    private Date readAt;
}
