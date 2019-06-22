package com.zls.mapper;

import com.zls.pojo.DataDictionary;

import java.util.List;

public interface DataDictionaryMapper {

    public List<DataDictionary> queryAllAppStatus();

    public List<DataDictionary> queryAllFlatform();
}