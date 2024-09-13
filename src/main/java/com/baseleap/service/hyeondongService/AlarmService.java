package com.baseleap.service.hyeondongService;

import com.baseleap.model.hyeondongModel.AlarmUserDTO;

import java.util.List;

public interface AlarmService {
    void createNewAlarm(int senderId, int receiverId, String content);
    List<AlarmUserDTO> getAllAlarms(int receiverId); // 받은 사람 입장에서 가져와야 함.
    void readAlarm(int alarmId); // 내가 받은 모든 알람들 가져온 다음, 거기서 특정 알람을 읽음 처리(삭제).
}
