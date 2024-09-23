package com.baseleap.service.music;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.ssl.SslProperties.Bundles.Watch.File;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.baseleap.mapper.music.MusicMapper;
import com.baseleap.model.music.MusicModel;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MusicServiceImpl implements IMusicService {

    @Autowired
    public MusicMapper musicMapper;

    @Override
    public List<String> getStringListMusicByOwnerID(Long ownerId) {

        log.info(ownerId.toString());
        // 1. 홈페이지 오너 아이디와 활성화된 음악명 음악 파일패스 반환하기
        //오너 아이디로 음악 검색
        List<MusicModel> musicListOwnerId = musicMapper.selectMusicListByUserId(ownerId);
        log.info(musicListOwnerId.toString());
        // 결과를 저장할 리스트
        List<String> result = new ArrayList<>();

        // 음악 리스트 중에서 isActive == true 인 항목만 필터링
        for (MusicModel music : musicListOwnerId) {
            log.info("반복문 들어왔어");
            log.info(music.getName());
            log.info(music.getPath());
            if (music.isActive()) {
                // name 값을 마지막 언더스코어 기준으로 파싱
                String name = music.getName();
                String path = music.getPath();

                if (name.equals(null)) {
                    result.add("제목없음");
                } else {
                    result.add(name);
                }

                if (path.equals(null)) {
                    log.info("경로저장이상");
                } else {
                    result.add(path);
                }
                /*
                int lastUnderscoreIndex = name.lastIndexOf("_");

                // 음악명과 파일경로를 파싱하여 result 리스트에 추가
                if (lastUnderscoreIndex != -1) {
                    String musicName = name.substring(0, lastUnderscoreIndex);
                    String filePath = name.substring(lastUnderscoreIndex + 1);
                    result.add(musicName);
                    result.add(filePath);
                } else {
                    // 언더스코어가 없는 경우 전체 name을 그대로 사용
                    result.add("제목없음");
                    result.add(name);
                }
                */
            }
            else{
                log.info("거짓이라고?");
            }
        }
        return result;
    }

    @Override
    public void requestRegisterMusic(String musicName, MultipartFile musicFile, Long loginUserID) {
        //컨트롤러가 음악파일 생성을 위한 모든걸 전달해주면 음악파일을 생성한뒤에
        MusicModel mm = generateMusicModel(musicName, musicFile, loginUserID);
        //DB에 저장하게 된다.
        insertMusicByMusicModel(mm);
    }

    @Override
    public void insertMusicByMusicModel(MusicModel music) {
        //2. 음악 등록을 요청하면 데이터 베이스에 저장하기 이때 반드시 name은 저장할 음악이름_파일패스 이런식

        //그러기 위해선 뮤직 모델을 생성하는 로직 필요. 보통 등록 창을 클릭하면 등록 관련 폼이 나오고,
        //거기서 입력하는 곡명, file, 지금 편집하고 있는 loginID를 받아서 처리해주는 로직 필요.
        musicMapper.insertMusic(music);

    }

    public MusicModel generateMusicModel(String musicName, MultipartFile musicInput, Long loginUserID) {
        MusicModel result = new MusicModel();
        Map<String, String> resultMap = null;
        //데이터베이스에 등록하기 이전에 객체를 생성해주는건데 MultipartFile을 온전히 의도에 맞게 처리해주는 로직이 필요
        try {
            resultMap = copyPasteDirectory(musicInput, musicName, loginUserID);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        if (resultMap != null) {
            result.setActive(false);
            result.setName(resultMap.get("fileName"));
            result.setPath(resultMap.get("filePath"));
            result.setUserId(loginUserID);
            // PK는 null이어도 DB에서 자동 생성됩니다.
        } else {
            // resultMap이 null인 경우에 대한 처리
            // 예를 들어, 예외를 발생시키거나 기본 값을 설정합니다.
            throw new IllegalStateException("파일 저장에 실패하여 MusicModel을 생성할 수 없습니다.");
        }
        return result;
    }

    public Map<String, String> copyPasteDirectory(MultipartFile file, String customName, Long userId) throws IOException {
        // // 입력값 검증 및 특수문자 제거
        // String sanitizedCustomName = customName.replaceAll("[\\\\/:*?\"<>|]", "").trim();

        // 베이스 패스 설정 (환경에 맞게 수정)
        String basePath = "custom/kosafourth/resources/music/" + userId.toString();

        // 고유한 파일명 생성
        String uniqueId = UUID.randomUUID().toString();
        String fileExtension = getFileExtension(file.getOriginalFilename());
        String newFilename = uniqueId + "_" + customName + "." + fileExtension;

        // 디렉토리 생성
        Path directoryPath = Paths.get(basePath);
        Files.createDirectories(directoryPath);

        // 파일 저장 경로 설정
        Path filePath = directoryPath.resolve(newFilename);

        // 파일 저장
        try (InputStream inputStream = file.getInputStream()) {
            Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
        }

        // 결과 반환
        Map<String, String> resultMap = new HashMap<>();
        resultMap.put("fileName", newFilename);
        resultMap.put("filePath", "/music/" + userId.toString() + "/" + newFilename);

        return resultMap;
    }

    private String getFileExtension(String filename) {
        if (filename == null || filename.lastIndexOf(".") == -1) {
            return "";
        }
        return filename.substring(filename.lastIndexOf(".") + 1);
    }

    @Override
    public List<MusicModel> getMusicModelByOwnerID(Long ownerId) {
        // 3. 데이터 베이스에서 오너 아이디로 등록된 음악 리스트 전부 가져오기
        List<MusicModel> mmlist = null;

        mmlist = musicMapper.selectMusicListByUserId(ownerId);

        return mmlist;
    }

    @Override
    public void requestUpdateMusicState(String name, Long userId, boolean isActive) {
        MusicModel m = selectSpecificMusicByName(name, userId);
        setIsActiveMusic(m, isActive);
    }

    @Override
    public void setIsActiveMusic(MusicModel music, boolean isActive) {
        //4. 활성화 변경을 요청하면 업데이트로 활성화 상태 바꾸기
        music.setActive(isActive);
        //뮤직 모델을 가져와서 업데이트 상태를 바꿔야되는데... 특정 뮤직 모델을 픽하는 방식은 일단 이름으로    
        musicMapper.updateIsActiveByMusicModel(music);
    }

    public MusicModel selectSpecificMusicByName(String name, Long userId) {
        MusicModel result = null;
        List<MusicModel> mm = musicMapper.selectMusicListByUserId(userId);
        for (MusicModel m : mm) {
            if (m.getName() == name) {
                result = m;
            }
        }
        if (result == null) {
            log.info("이름이 일치하지 않네");
            return null;
        } else {
            return result;
        }
    }

}
