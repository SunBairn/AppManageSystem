package com.zls.mapper;

import com.zls.pojo.AppCategory;import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Set;

public interface AppCategoryMapper {
    //三级分类查询
    public List<AppCategory> queryAllCategoryLevel1();

    List<AppCategory> queryLevelTwoByLevelOne(@Param("id") Long id);

    List<AppCategory> queryLevelThreeByLevelTwo(@Param("id") Long id);




    /*public List<AppCategory> queryAllCategoryLevel2(@Param("parentId") Set<Long> parentId);

    public List<AppCategory> queryAllCategoryLevel3(@Param("parentId")Set<Long> parentId);
*/
}