package com.zzuli.student.mapper;

import java.util.List;

import com.zzuli.po.StudentWriteGrade;

public interface StudentWriteGradeMapper {
    int deleteByPrimaryKey(Integer writeGradeId);

    int insert(StudentWriteGrade record);

    int insertSelective(StudentWriteGrade record);

    StudentWriteGrade selectByPrimaryKey(Integer writeGradeId);

    int updateByPrimaryKeySelective(StudentWriteGrade record);

    int updateByPrimaryKey(StudentWriteGrade record);

    public List<StudentWriteGrade> getStudentWriteGradeList(StudentWriteGrade info);
}