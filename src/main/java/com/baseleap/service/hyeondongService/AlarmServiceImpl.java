package com.baseleap.service.hyeondongService;

import com.baseleap.mapper.hyeondongMapper.AlarmMapper;
import com.baseleap.model.hyeondongModel.AlarmUserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AlarmServiceImpl implements AlarmService {
    @Autowired
    private AlarmMapper alarmMapper;

    @Override
    public void createNewAlarm(int senderId, int receiverId, String content) {
        alarmMapper.createNewAlarm(senderId, receiverId, content);
    }

    @Override
    public List<AlarmUserDTO> getAllAlarms(int receiverId) {
        return alarmMapper.getAllAlarms(receiverId);
    }

    @Override
    public void readAlarm(int alarmId) {
        alarmMapper.readAlarm(alarmId);
    }
}
