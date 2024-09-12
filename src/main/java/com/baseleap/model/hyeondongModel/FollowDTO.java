package com.baseleap.model.hyeondongModel;

import lombok.Data;

import java.util.Date;

@Data
public class FollowDTO {
    private int id;
    private int userId;
    private int targetId;
    private Date createdAt;
}
