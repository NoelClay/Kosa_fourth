package com.baseleap.service.guestbook;

import java.util.List;

import com.baseleap.model.guestbook.GuestBook;

public interface IGuestBookService {
    
    List<GuestBook> getGuestBookListByOwnerId(Long ownerId);
    
    void insertGuestBook(GuestBook guestBook);
    
    void updateGuestBook(GuestBook guestBook);
    
    void deleteGuestBook(GuestBook guestBook);
    
    GuestBook getGuestBookByWriterAndOwner(Long ownerId, Long writerId);
}