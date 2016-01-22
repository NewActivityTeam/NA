package com.na.service;

import java.util.List;

import com.na.entity.Activity;

public interface ActivityService {

	public int newActicity(String title,String description,long starttime,long endtime,long endsigntime, String voteaddress,long manager);
	
	public int updateActicity(long id,int subject,Object newcontent);
	
	public int deleteActicity(long []ids);
	
	public Activity getActicity(long id);
	
	public List<Activity> getAllActivities();
	
	public List<Activity> getActivitiesByManager(long uid);
	
	public List<Activity> getActivitiesByIds(long[] ids);
}
