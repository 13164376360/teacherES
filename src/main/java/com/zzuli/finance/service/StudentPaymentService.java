package com.zzuli.finance.service;

import java.util.List;

import com.zzuli.po.StudentPayment;

/**
 * 学员缴费的业务逻辑
 * @author mazg
 * 2019年11月2日
 *
 */
public interface StudentPaymentService {

	/**
	 * 添加缴费信息
	 * @param info
	 * @return
	 */
	public boolean add(StudentPayment info);
	
	/**
	 * 查询缴费信息
	 * @param info
	 * @return
	 */
	public List<StudentPayment> getList(StudentPayment info);
	
	/**
	 * 删除缴费信息
	 * @param paymentId
	 * @return
	 */
	public boolean delete(Integer paymentId);
}
