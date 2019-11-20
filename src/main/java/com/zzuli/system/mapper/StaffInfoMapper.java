package com.zzuli.system.mapper;

import java.util.List;

import com.zzuli.po.StaffInfo;

public interface StaffInfoMapper {
    int deleteByPrimaryKey(Integer staffId);

    int insert(StaffInfo record);

    int insertSelective(StaffInfo record);

    StaffInfo selectByPrimaryKey(Integer staffId);

    int updateByPrimaryKeySelective(StaffInfo record);

    int updateByPrimaryKey(StaffInfo record);
    
    public List<StaffInfo> getStaffInfoList(StaffInfo record);
    
    public List<StaffInfo> getStaffList(StaffInfo record);
    
    
}