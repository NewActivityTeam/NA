package com.na.service;

import java.util.List;

import com.na.entity.Assess;

public interface AssessService {
	
	public int newAssess(long uid,long aid,float grade,String comment,String imageurl);
	
	public int newAssess(long uid,long aid,float grade,String comment);
	
	public int setImageURL(long uid,long aid,String newURL);
	
	public int updateGrade(long uid,long aid,float newGrade);
	
	public int updateComment(long uid,long aid,String newComment);
	
	public int deleteAssess(long id);
	
	public int deleteAssess(long uid,long aid);
	
	public Assess getAssess(long id);
	
	public Assess getAssess(long uid,long aid);
	
	public List<Assess> getAssessesByAID(long aid);
	
	public float getAvgGradeByAID(long aid);
	
	public boolean deleteAllAssessByAID(long aid);
	
	public boolean deleteAllAssessByUID(long uid);
}
