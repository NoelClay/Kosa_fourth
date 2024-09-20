package com.baseleap.service.homepage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baseleap.mapper.homepage.UserHomePageMapper;
import com.baseleap.model.UserModel;

@Service
public class HomePageServiceImpl implements IHomePageService {

    @Autowired
    private UserHomePageMapper umapper;

    @Override
    public String getUserNicknameByUserId(Long userId) {
        String result = "닉네임없음";

        UserModel umodel = umapper.getUserByKey(userId);
        
        if(umodel.getNickName().equals(null)){
            return result;
        }
        else{
            return umodel.getNickName();
        }
    }
    
    
}
