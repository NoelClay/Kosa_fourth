package com.baseleap.mapper.music;

import org.apache.ibatis.annotations.Mapper;

import com.baseleap.model.music.MusicModel;

@Mapper
public interface MusicMapper {
    //crud
    public void insertMusic( String filePath, Long userId);

    public MusicModel selectMusicByUserId ( Long userId );

    public MusicModel updateIsActiveByMusicModel (boolean isTrue, Long musicPk);

    public void deleteMusicByUserId (Long userId);
}
