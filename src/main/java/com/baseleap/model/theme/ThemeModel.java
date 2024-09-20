package com.baseleap.model.theme;

import lombok.Data;

@Data
public class ThemeModel {

    private Long id;
    String name;
    String path;
    boolean isActive;
    Long userId;

}
