package com.zls.service;

import com.zls.pojo.AppCategory;

import java.util.List;

public interface AppCategoryService {
    List<AppCategory> queryLevelTwoByLevelOne(Long id);

    List<AppCategory> queryLevelThreeByLevelTwo(Long id);
}
