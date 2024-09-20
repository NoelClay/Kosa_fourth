package com.baseleap.model.post;

import lombok.Builder;
import lombok.Getter;

@Getter
public class PostListModel {
    private final Long id;
    private final String title;
    private final String thmbnail;
    private final String userNickName;
    private final int commentCount;

    @Builder
    public PostListModel(Long id, String title, String thmbnail, String userNickName, int commentCount) {
        this.id = id;
        this.title = title;
        this.thmbnail = thmbnail;
        this.userNickName = userNickName;
        this.commentCount = commentCount;
    }
}
