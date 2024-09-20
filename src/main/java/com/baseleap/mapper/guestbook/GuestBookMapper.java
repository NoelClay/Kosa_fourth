package com.baseleap.mapper.guestbook;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.data.repository.query.Param;

import com.baseleap.model.guestbook.GuestBook;

@Mapper
public interface GuestBookMapper {

    List<GuestBook> selectGuestBookListByOwnerId(Long ownerId);

    void insertGuestBook(GuestBook guestBook);

    void updateGuestBook(GuestBook guestBook);

    void deleteGuestBook(GuestBook guestBook);

    GuestBook selectGuestBookByWriterOwnerId(@Param("ownerId") Long OwnerId, @Param("writerId")Long WriterId);

    
}