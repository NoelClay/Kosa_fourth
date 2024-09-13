package com.baseleap.service.hyeondongService;

import com.baseleap.model.hyeondongModel.MessageDTO;
import com.baseleap.model.hyeondongModel.MessageUserDTO;

import java.util.List;

public interface MessageService {
    void createNewMessage(int senderId, int receiverId, String content);
    List<MessageUserDTO> getAllMessages(int receiverId); // 받은 사람 입장에서 가져와야 함.
    List<MessageUserDTO> getNotReadMessages(int receiverId); // 읽지 않은 메세지만 가져오기.
    void readMessage(int messageId);
    void deleteMessage(int messageId);
}
