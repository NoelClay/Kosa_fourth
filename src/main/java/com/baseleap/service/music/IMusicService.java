package com.baseleap.service.music;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.baseleap.model.music.MusicModel;

public interface IMusicService {

    // 1. 홈페이지 오너 아이디와 활성화된 음악명 음악 파일패스 반환하기
    public List<String> getStringListMusicByOwnerID(Long ownerId);

    //2. 음악 등록을 요청하면 데이터 베이스에 저장하기 이때 반드시 name은 저장할 음악이름_파일패스 이런식
    public void requestRegisterMusic (String musicName, MultipartFile musicFile, Long loginUserID);
    public void insertMusicByMusicModel(MusicModel music);

    // 3. 데이터 베이스에서 오너 아이디로 등록된 음악 리스트 전부 가져오기
    public List<MusicModel> getMusicModelByOwnerID(Long ownerId);

    //4. 활성화 변경을 요청하면 업데이트로 활성화 상태 바꾸기
    public void requestUpdateMusicState(String name, Long userId, boolean isActive);
    public void setIsActiveMusic(MusicModel music, boolean isActive);
}
