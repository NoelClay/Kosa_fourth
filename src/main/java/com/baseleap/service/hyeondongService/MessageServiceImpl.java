package com.baseleap.service.hyeondongService;

import com.baseleap.mapper.hyeondongMapper.MessageMapper;
import com.baseleap.model.hyeondongModel.MessageUserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MessageServiceImpl implements MessageService {
    @Autowired
    private MessageMapper messageMapper;

    @Override
    public void createNewMessage(int senderId, int receiverId, String content) {
        messageMapper.createNewMessage(senderId, receiverId, content);
    }

    @Override
    public List<MessageUserDTO> getAllMessages(int receiverId) {
        return messageMapper.getAllMessages(receiverId);
    }

    @Override
    public List<MessageUserDTO> getNotReadMessages(int receiverId) {
        return messageMapper.getNotReadMessages(receiverId);
    }

    @Override
    public void readMessage(int messageId) {
        messageMapper.readMessage(messageId);
    }

    @Override
    public void deleteMessage(int messageId) {
        messageMapper.deleteMessage(messageId);
    }
}
