package com.na.service;

import java.sql.Timestamp;
import java.util.List;

import com.na.entity.Activity;

public interface ActivityService {

	public int newActicity(String title, String description, Timestamp starttime,
			Timestamp endtime, Timestamp endsigntime,String address,String voteAddress,long manager);
	
	/*
	 * 陈豪 2016-1-16
	 * 添加活动
	 */
	public int addActivity(Activity activity);
	public int updateActicity(long id,int subject,Object newcontent);
	
	public int deleteActivity(long []ids);
	public int deleteActivity(long id);
	public Activity getActicity(long id);
	
	public List<Activity> getAllActivitiesByPage(int currentPage,int pageSize);
	
	public List<Activity> getActivitiesByManager(long uid);
	
	public List<Activity> getActivitiesByIds(long[] ids);
	
	public List<Activity> getActivitiesByConditions(String title,Timestamp start,Timestamp end,int currentPage,int pageSize);
}
