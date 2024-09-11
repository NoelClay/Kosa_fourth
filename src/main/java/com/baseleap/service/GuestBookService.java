package com.baseleap.service;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baseleap.mapper.GuestBookMapper;
import com.baseleap.model.GuestBook;

import java.util.List;

@Service
public class GuestBookService {

    @Autowired
    private GuestBookMapper guestBookMapper;

    public List<GuestBook> getGuestBooksByOwnerId(Long ownerId) {
        return guestBookMapper.findByOwnerId(ownerId);
    }

    public void addGuestBookEntry(Long writerId, Long ownerId, String comment) {
        GuestBook guestBook = new GuestBook();
        guestBook.setWriterId(writerId);
        guestBook.setOwnerId(ownerId);
        guestBook.setComment(comment);
        guestBook.setCreatedAt(LocalDateTime.now());
        guestBookMapper.insertGuestBook(guestBook);
    }
}
