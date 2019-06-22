package com.zls.service.impl;

import com.zls.mapper.AppCategoryMapper;
import com.zls.pojo.AppCategory;
import com.zls.service.AppCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service("appCategoryService")
public class AppCategoryServiceImpl implements AppCategoryService {
    @Autowired
    AppCategoryMapper appCategoryMapper;
    //二级分类
    @Override
    public List<AppCategory> queryLevelTwoByLevelOne(Long id) {
        List<AppCategory> levelTwo= appCategoryMapper.queryLevelTwoByLevelOne(id);
        return levelTwo;
    }
    //三级分类
    @Override
    public List<AppCategory> queryLevelThreeByLevelTwo(Long id) {
        List<AppCategory> levelThree= appCategoryMapper.queryLevelThreeByLevelTwo(id);
        return levelThree;
    }
}
