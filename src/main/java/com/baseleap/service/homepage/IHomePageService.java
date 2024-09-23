package com.baseleap.service.homepage;


public interface IHomePageService {

    String getUserNicknameByUserId(Long userId);

    String getUserProfileImgPath(Long userId);

    public String getUserProfileSelfInfo(Long userId);

}
