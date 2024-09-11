package com.baseleap.model;

import lombok.Data;
import java.util.Date;

@Data
public class UserDTO {
    private String id;
    private String email;
    private String password;
    private String nickname;
    private String profile_image;
    private String user_introduce;
    private Date created_time;
    private Date last_login_time;
    private String validation_quiz_question;
    private String validation_quiz_answer;
}
