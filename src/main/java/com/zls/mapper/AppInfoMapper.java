package com.zls.mapper;

import com.github.pagehelper.PageInfo;
import com.zls.dto.AppInfoDTO;
import com.zls.pojo.AppInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AppInfoMapper {

    /*这里使用了@Param注解，SQL语句哪里必须要和这里的名字相同*/
//    List<AppInfo> queryByDevUserId(@Param("devId") Long id);

    List<AppInfo> query(@Param("appInfoDTO")AppInfoDTO appInfoDTO);

    AppInfo queryOne(@Param("appId")Long id);

    int deleteOne(@Param("appId")Long id);

    AppInfo queryById(Long id);

    int updateById(@Param("appId") Long appId,@Param("appInfoDTO") AppInfoDTO appInfoDTO);

    int addOne(AppInfo appInfo);
}