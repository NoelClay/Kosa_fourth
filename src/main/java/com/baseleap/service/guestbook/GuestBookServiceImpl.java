package com.baseleap.service.guestbook;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baseleap.mapper.GuestBookMapper;
import com.baseleap.model.GuestBook;

@Service
public class GuestBookServiceImpl implements IGuestBookService {

    @Autowired
    private GuestBookMapper guestBookMapper;

    @Override
    public List<GuestBook> getGuestBookListByOwnerId(Long ownerId) {
        return guestBookMapper.selectGuestBookListByOwnerId(ownerId);
    }

    @Override
    public void insertGuestBook(GuestBook guestBook) {
        guestBookMapper.insertGuestBook(guestBook);
    }

    @Override
    public void updateGuestBook(GuestBook guestBook) {
        guestBookMapper.updateGuestBook(guestBook);
    }

    @Override
    public void deleteGuestBook(GuestBook guestBook) {
        guestBookMapper.deleteGuestBook(guestBook);
    }

    @Override
    public GuestBook getGuestBookByWriterAndOwner(Long ownerId, Long writerId) {
        return guestBookMapper.selectGuestBookByWriterOwnerId(ownerId, writerId);
    }
}
