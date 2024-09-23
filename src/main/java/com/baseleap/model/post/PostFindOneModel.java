package com.baseleap.model.post;

import lombok.Builder;
import lombok.Getter;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Getter
public class PostFindOneModel {
    private final Long id;
    private final String title;
    private final String content;
    private final String createdAt;
    private final String updateedAt;
    private final String nickName;
    private final String image1;
    private final String image2;
    private final String image3;
    private final int likeCount;
    private final int userCheck;

    @Builder
    public PostFindOneModel(Long id, String title, String content, String createdAt, String updateedAt, String nickName, String image1, String image2, String image3, int likeCount, int userCheck) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.createdAt = createdAt;
        this.updateedAt = updateedAt;
        this.nickName = nickName;
        this.image1 = image1;
        this.image2 = image2;
        this.image3 = image3;
        this.likeCount = likeCount;
        this.userCheck = userCheck;
    }
}
