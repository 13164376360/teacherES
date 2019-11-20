package com.zzuli.system.service;

import com.zzuli.po.RoleAnthorityInfo;

import java.util.List;

/**
 * 权限变更的业务逻辑接口
 * @author mazg
 * 2019年10月17日
 *
 */
public interface AnthotychangeService {

	/**
	 * 添加角色权限信息
	 * @param roleId
	 * @param anthortyId
	 * @throws Exception
	 */
	public void add(Integer roleId, Integer[] anthortyId)throws Exception;
	
	/**
	 * 查询角色权限信息
	 * @param roleAnthorityInfo
	 * @return
	 */
	public List<RoleAnthorityInfo>  getRoleAnthorityList(RoleAnthorityInfo roleAnthorityInfo);
}
