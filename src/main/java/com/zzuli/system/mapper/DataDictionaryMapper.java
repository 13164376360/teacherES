package com.zzuli.system.mapper;

import java.util.List;

import com.zzuli.po.DataDictionary;

public interface DataDictionaryMapper {
    int deleteByPrimaryKey(Integer dataId);

    int insert(DataDictionary record);

    int insertSelective(DataDictionary record);

    DataDictionary selectByPrimaryKey(Integer dataId);

    int updateByPrimaryKeySelective(DataDictionary record);

    int updateByPrimaryKey(DataDictionary record);
    
    /**
     * 根据提交查询数据字典信息
     * @param record
     * @return
     */
    public List<DataDictionary> getDataList(DataDictionary record);
}