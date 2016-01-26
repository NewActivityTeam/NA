package com.na.service;

import java.util.List;

import com.na.entity.Assess;

public interface AssessService {
	
	public int newAssess(long uid,long aid,float grade);
	
	public int updateGrade(long id,float newGrade);
	
	public int deleteAssess(long id);
	
	public int deleteAssess(long uid,long aid);
	
	public Assess getAssess(long id);
	
	public Assess getAssess(long uid,long aid);
	
	public List<Assess> getAssessesByAID(long aid);
	
	public float getAvgGradeByAID(long aid);
	
	public boolean deleteAllAssessByAID(long aid);
	
	public boolean deleteAllAssessByUID(long uid);
}
