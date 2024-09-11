package com.baseleap.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.baseleap.model.GuestBook;

@Mapper
public interface GuestBookMapper {

    List<GuestBook> findByOwnerId(Long ownerId);

    void insertGuestBook(GuestBook guestBook);
}