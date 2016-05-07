package com.na.service;

import java.sql.Timestamp;
import java.util.List;

import com.na.entity.Activity;

public interface ActivityService {

	public int newActicity(String title,String logo, String description, Timestamp starttime,
			Timestamp endtime, Timestamp endsigntime,String address,String voteAddress,long manager,int number);
	
	public int addActivity(Activity activity);
	public int updateActicity(long id,String title,String logo,  String description, Timestamp starttime,
			Timestamp endtime, Timestamp endsigntime,String address,String voteAddress,long manager,int number);
	
	public int deleteActivity(long []ids);
	public int deleteActivity(long id);
	public Activity getActicity(long id);
	
	public List<Activity> getAllActivitiesByPage(int currentPage,int pageSize);
	public List<Activity> getActivitiesByPageByFlag(int flag,int currentPage,int pageSize);
	
	public List<Activity> getActivitiesByManager(long uid);
	
	public List<Activity> getActivitiesByIds(long[] ids);
	
	public List<Activity> getAllActvityByState(boolean state);
	
	public List<Activity> getActivitiesByConditions(String title,Timestamp start,Timestamp end,int currentPage,int pageSize);
	
	public int getAllActivityNumber();
	public int getAllActivityNumberByFlag(int flag);

	public int getPartActivityNumber(String title,Timestamp start,Timestamp end);

	public void addFastGroupedCount(long aid,int fgc);
	
	public List<Activity> getNewestActivities();
	
	public List<Activity> getScoreActivities();

}
