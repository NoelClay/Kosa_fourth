package com.baseleap.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.baseleap.model.GuestBook;

@Mapper
public interface GuestBookMapper {

    List<GuestBook> selectGuestBookListByOwnerId(Long ownerId);

    void insertGuestBook(GuestBook guestBook);

    void updateGuestBook(GuestBook guestBook);

    void deleteGuestBook(GuestBook guestBook);

    GuestBook selectGuestBookByWriterOwnerId(Long OwnerId, Long WriterId);

    
}