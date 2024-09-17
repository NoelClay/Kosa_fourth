package com.baseleap.model.music;

import lombok.Data;

@Data
public class MusicModel {

    Long id;
    String name;
    boolean is_active;
    Long user_id;
}
