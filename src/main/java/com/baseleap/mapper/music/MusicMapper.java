package com.baseleap.mapper.music;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.baseleap.model.music.MusicModel;

@Mapper
public interface MusicMapper {
    //crud
    public void insertMusic( MusicModel music );

    public List<MusicModel> selectMusicListByUserId ( Long userId );

    public void updateIsActiveByMusicModel ( MusicModel music );

    public void deleteMusicByMusicModel (MusicModel music );
}
