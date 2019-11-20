package com.zzuli.student.service;

import java.util.List;

import com.zzuli.po.CommunicateInfo;

/**
 * 沟通记录的业务逻辑层
 * @author mazg
 * 2019年11月30日
 *
 */
public interface CommunicateInfoService {

	/**
	 * 添加信息
	 * @param info
	 * @return
	 */
	public boolean add(CommunicateInfo info);
	
	/**
	 * 修改信息
	 * @param info
	 * @return
	 */
	public boolean update(CommunicateInfo info);
	
	/**
	 * 删除信息
	 * @param info
	 * @return
	 */
	public boolean delete(Integer communicateId);
	
	/**
	 * 根据编号查询沟通记录信息
	 * @param communicateId
	 * @return
	 */
	public CommunicateInfo getCommunicateInfo(Integer communicateId);
	
	/**
	 * 根据条件查询沟通记录信息
	 * @param info
	 * @return
	 */
	public List<CommunicateInfo> getList(CommunicateInfo info);
	
}
