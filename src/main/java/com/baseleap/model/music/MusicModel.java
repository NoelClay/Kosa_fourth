package com.baseleap.model.music;

import lombok.Data;

@Data
public class MusicModel {

    Long id;
    String name;
    String path;
    boolean isActive;
    Long userId;
}
