package com.baseleap.model.hyeondongModel;

import lombok.Data;
import java.util.Date;

@Data
public class UserDTO {
    private String id;
    private String email;
    private String password;
    private String nickname;
    private String profileImage;
    private String userIntroduce;
    private Date createdTime;
    private Date lastLoginTime;
    private String validationQuizQuestion;
    private String validationQuizAnswer;
}
