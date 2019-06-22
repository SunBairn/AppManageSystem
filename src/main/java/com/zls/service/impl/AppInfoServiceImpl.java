package com.zls.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zls.constant.CommonCodeConstant;
import com.zls.dto.AppInfoDTO;
import com.zls.mapper.AppCategoryMapper;
import com.zls.mapper.AppInfoMapper;
import com.zls.mapper.DataDictionaryMapper;
import com.zls.pojo.AppCategory;
import com.zls.pojo.AppInfo;
import com.zls.pojo.DataDictionary;
import com.zls.pojo.DevUser;
import com.zls.service.AppInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Service("appInfoserviceImpl")
public class AppInfoServiceImpl implements AppInfoService {
    @Autowired
    private AppInfoMapper appInfoMapper;

    @Autowired
    private DataDictionaryMapper dataDictionaryMapper;

    @Autowired
    private AppCategoryMapper appCategoryMapper;
    @Override
    public PageInfo<AppInfo> queryByDevUserId(Long id, PageInfo pageInfo) {
        //去第几页，页码的大小
        PageHelper.startPage(pageInfo.getPageNum(),pageInfo.getPageSize());
        AppInfoDTO appInfoDTO=new AppInfoDTO();
        appInfoDTO.setDevUserId(id);
        List<AppInfo> appInfos = appInfoMapper.query(appInfoDTO);
        PageInfo<AppInfo> pageInfo1 = new PageInfo<>(appInfos);
        return pageInfo1;
}
        //查询所有APP状态
    @Override
    public List<DataDictionary> queryAllAppStatus() {
        List<DataDictionary> appStatus=dataDictionaryMapper.queryAllAppStatus();
        return appStatus;
    }
        //查询APP所属平台
    @Override
    public List<DataDictionary> queryAllFlatform() {
        List<DataDictionary> appFlatform=dataDictionaryMapper.queryAllFlatform();
        return appFlatform;
    }

        //查询一级分类
    @Override
    public List<AppCategory> queryAllCategoryLevel1() {
        List<AppCategory> level1= appCategoryMapper.queryAllCategoryLevel1();
        return level1;
    }

    @Override
    public PageInfo<AppInfo> query(AppInfoDTO appInfoDTO) {
        PageHelper.startPage(appInfoDTO.getPageNum(), CommonCodeConstant.PAGE_SIZE);
        List<AppInfo> appInfos= appInfoMapper.query(appInfoDTO);
        PageInfo<AppInfo> pageInfo = new PageInfo<>(appInfos);
        return pageInfo;
    }

    @Override
    public AppInfo queryOne(Long id) {
        AppInfo appInfo=appInfoMapper.queryOne(id);
        return appInfo;
    }

    @Override
    public Boolean deleteOne(Long id) {
        if (id!=null){
            int row=appInfoMapper.deleteOne(id);
            return row>0?true:false;
        }

        return false;
    }

    @Override
    public AppInfo queryById(Long id) {
        AppInfo appInfo=appInfoMapper.queryById(id);
        return appInfo;
    }

    @Override
    public Boolean updateById(Long appId,AppInfoDTO appInfoDTO) {
        if (appId!=null){
            int row=appInfoMapper.updateById(appId,appInfoDTO);
            return row>0?true:false;
        }
        return false;
    }

    @Override
    public Boolean addOne(AppInfo appInfo, HttpSession session) {
        Long userId = (Long) session.getAttribute("USER_ID");
        if (appInfo!=null) {
            appInfo.setCreationDate(new Date());

            DevUser devUser=new DevUser();
            devUser.setId(userId);
            appInfo.setDevUser(devUser);

            appInfo.setCreatedBy(userId);

            DataDictionary dataDictionary=new DataDictionary();
            dataDictionary.setValueId(CommonCodeConstant.APP_STATUS_AUDITED);
            appInfo.setAppStatus(dataDictionary);
            int row = appInfoMapper.addOne(appInfo);
            return row>0?true:false;
        }
        return false;
    }

}
