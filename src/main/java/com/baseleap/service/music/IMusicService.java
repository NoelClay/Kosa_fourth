package com.baseleap.service.music;

import org.springframework.beans.factory.annotation.Autowired;

import com.baseleap.mapper.guestbook.GuestBookMapper;
import com.baseleap.model.guestbook.GuestBook;
import com.baseleap.model.music.MusicModel;

public interface IMusicService {

    
    @Autowired
    private Music guestBookMapper;

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
