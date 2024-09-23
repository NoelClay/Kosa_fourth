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
    private final List<MultipartFile> image;


    @Builder
    public PostCreateModel(String title, String content, List<MultipartFile> image) {
        this.title = title;
        this.content = content;
        this.image = image;
    }

}
