package com.baseleap.service;


import com.baseleap.mapper.PasswordFindMapper;
import com.baseleap.model.UserModel;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class PasswordFindServiceImpl  implements  PasswordFindService{

    @Autowired
    private PasswordFindMapper passwordFindMapper;

    @Override
    public UserModel findUserPassword(String email, String validationQuizQuestion, String validationQuizAnswer) {

        log.info("findUserPassword() :: email = {} | QuizQuestion = {} | QuizAnswer = {} ",email,validationQuizQuestion,validationQuizAnswer);

        return passwordFindMapper.findUserPassword(email,validationQuizQuestion,validationQuizAnswer);
    }
}
