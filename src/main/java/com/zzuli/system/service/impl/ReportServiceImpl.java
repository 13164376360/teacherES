package com.zzuli.system.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zzuli.system.dto.ReportInfo;
import com.zzuli.system.mapper.ReportMapper;
import com.zzuli.system.service.ReportService;

@Service
public class ReportServiceImpl implements ReportService {

	@Resource(name="reportMapper")
	private ReportMapper reportMapper;
	
	@Override
	public ReportInfo getReportInfo() {
		ReportInfo info = new ReportInfo();
		
		//学员意向状态的报表
		info.setStudentSateList(reportMapper.getStudentSateList());
		
		//学员类型状态的报表
		info.setStudentMarkList(reportMapper.getStudentMarkList());
		
		info.setStudentProList(reportMapper.getStudentProList());
		
		info.setStudentList(reportMapper.getStudentList());
		
		return info;
	}

}
