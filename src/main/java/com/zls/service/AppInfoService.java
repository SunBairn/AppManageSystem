package com.zls.service;


import com.github.pagehelper.PageInfo;
import com.sun.xml.internal.bind.v2.schemagen.xmlschema.Appinfo;
import com.zls.dto.AppInfoDTO;
import com.zls.pojo.AppCategory;
import com.zls.pojo.AppInfo;
import com.zls.pojo.DataDictionary;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface AppInfoService {
    public PageInfo<AppInfo> queryByDevUserId(Long id ,PageInfo pageInfo);

    public List<DataDictionary> queryAllAppStatus();

    public List<DataDictionary> queryAllFlatform();

    public List<AppCategory> queryAllCategoryLevel1();

    PageInfo<AppInfo> query(AppInfoDTO appInfoDTO);

    AppInfo queryOne(Long id);

    Boolean deleteOne(Long id);

    AppInfo queryById(Long id);

    Boolean updateById(Long appId, AppInfoDTO appInfoDTO);

    Boolean addOne(AppInfo appInfo, HttpSession session);
}
