package com.zzuli.classinfo.service;

import java.util.List;

import com.zzuli.po.DisciplineInfo;

/**
 * 学科信息业务逻辑接口
 * @author mazg
 * 2019年10月29日
 *
 */
public interface DisciplineInfoService {

	/**
	 * 添加学科信息
	 * @param info
	 * @return
	 */
	public boolean addDisciplineInfo(DisciplineInfo info);
	
	/**
	 * 根据提条件查询学科信息
	 * @param info 查询条件
	 * @return
	 */
	public List<DisciplineInfo> getList(DisciplineInfo info);
	
	
	/**
	 * 根据编号查询学科信息
	 * @param disciplineId
	 * @return
	 */
	public DisciplineInfo getDisciplineInfo(Integer disciplineId);

	/**
	 * 修改学科信息
	 * @param info
	 * @return
	 */
	public boolean updateDisciplineInfo(DisciplineInfo info);

	

}
