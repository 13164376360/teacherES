package com.zzuli.student.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zzuli.po.StudentWriteGrade;
import com.zzuli.student.mapper.StudentWriteGradeMapper;
import com.zzuli.student.service.StudentWriteGradeService;

@Service
public class StudentWriteGradeServiceImpl implements StudentWriteGradeService {

	@Resource(name="studentWriteGradeMapper")
	private StudentWriteGradeMapper studentWriteGradeMapper;
	

	
	@Override
	public boolean add(StudentWriteGrade info) {
		
		try {
			int i = studentWriteGradeMapper.insertSelective(info);
			if(i>0){
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return false;
	}

	@Override
	public boolean update(StudentWriteGrade info) {
		try {
			int i = studentWriteGradeMapper.updateByPrimaryKeySelective(info);
			if(i>0){
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean delete(Integer writeGradeId) {
		try {
			int i = studentWriteGradeMapper.deleteByPrimaryKey(writeGradeId);
			if(i>0){
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public StudentWriteGrade getStudentWriteGrade(Integer writeGradeId) {
		// TODO Auto-generated method stub
		return studentWriteGradeMapper.selectByPrimaryKey(writeGradeId);
	}

	@Override
	public List<StudentWriteGrade> getList(StudentWriteGrade info) {
		// TODO Auto-generated method stub
		return studentWriteGradeMapper.getStudentWriteGradeList(info);
	}

}
