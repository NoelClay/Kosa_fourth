package com.baseleap.model.hyeondongModel;

import lombok.Data;

@Data
public class AlarmUserDTO {
    private int alarmId;
    private String userProfileImage;
    private String userNickname;
    private String alarmContent;
}
