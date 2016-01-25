package com.na.service;

import java.sql.Timestamp;
import java.util.List;

import com.na.entity.Activity;

public interface ActivityService {

	public int newActicity(String title, String content, long starttime,
			long endtime, long endsigntime, String voteaddress,long manager);
	
	/*
	 * 陈豪 2016-1-16
	 * 添加活动
	 */
	public int addActivity(Activity activity);
	
	public int updateActicity(long id,int subject,Object newcontent);
	
	public int deleteActicity(long []ids);
	
	public Activity getActicity(long id);
	
	public List<Activity> getAllActivities();
	
	public List<Activity> getActivitiesByManager(long uid);
	
	public List<Activity> getActivitiesByIds(long[] ids);
	
	public List<Activity> getActivitiesByConditions(String title,Timestamp start,Timestamp end);

}
