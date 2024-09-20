package com.baseleap.model.post;

import lombok.Builder;
import lombok.Getter;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

@Getter
public class PostCreateModel {
    private final String title;
    private final String content;
    private final long userId;
    private final List<MultipartFile> image;


    @Builder
    public PostCreateModel(String title, String content, long userId, List<MultipartFile> image) {
        this.title = title;
        this.content = content;
        this.userId = userId;
        this.image = image;
    }

    public String getTitle() {
        return title;
    }

    public String getContent() {
        return content;
    }

    public long getUserId() {
        return userId;
    }

    public List<MultipartFile> getImage() {
        return image;
    }
}
