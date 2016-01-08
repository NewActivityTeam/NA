package com.na.service.imp;

import java.util.List;

import com.na.dao.AssessDao;
import com.na.entity.Assess;
import com.na.service.AssessService;

public class AssessServiceImp implements AssessService {

	AssessDao assessDao;

	public AssessDao getAssessDao() {
		return assessDao;
	}

	public void setAssessDao(AssessDao assessDao) {
		this.assessDao = assessDao;
	}

	//新的评分
	@Override
	public int newAssess(long uid, long aid, float grade) {
		// TODO Auto-generated method stub
		return 0;
	}

	//更新评分
	@Override
	public int updateGrade(long id, float newGrade) {
		// TODO Auto-generated method stub
		return 0;
	}

	//删除评分
	@Override
	public int deleteGrade(long id) {
		// TODO Auto-generated method stub
		return 0;
	}

	//获取评分
	@Override
	public Assess getAssess(long id) {
		// TODO Auto-generated method stub
		return null;
	}

	//通过用户名和活动名获取指定评分
	@Override
	public Assess getAssess(long uid, long aid) {
		// TODO Auto-generated method stub
		return null;
	}

	//获取某活动的所有评分
	@Override
	public List<Assess> getAssessesByAID(long aid) {
		// TODO Auto-generated method stub
		return null;
	}

	//获取活动的平均评分
	@Override
	public float getAvgGradeByAID(long aid) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
}
