package com.baseleap.model;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class GuestBook {
    private Long id;
    private Long writerId;
    private Long ownerId;
    private String comment;
    private LocalDateTime createdAt;

    // Getters and Setters
}

