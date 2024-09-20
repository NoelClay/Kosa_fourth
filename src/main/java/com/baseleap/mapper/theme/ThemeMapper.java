package com.baseleap.mapper.theme;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.baseleap.model.theme.ThemeModel;

@Mapper
public interface ThemeMapper {
    //crud
    public void insertTheme(ThemeModel  theme);

    public List<ThemeModel> selectListByUserId (Long userId);

    // public ThemeModel selectByUserIdIsActive (Long userId)

    public void updateIsActiveByThemeModel(ThemeModel theme, boolean isActive);

    public void deleteThemeModel(ThemeModel theme);

}
