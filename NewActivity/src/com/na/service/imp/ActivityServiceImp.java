package com.na.service.imp;

import java.util.List;

import com.na.dao.ActivityDao;
import com.na.entity.Activity;
import com.na.service.ActivityService;

public class ActivityServiceImp implements ActivityService {
	ActivityDao activityDao;

	public ActivityDao getActivityDao() {
		return activityDao;
	}

	public void setActivityDao(ActivityDao activityDao) {
		this.activityDao = activityDao;
	}

	@Override
	public int newActicity(String title, String description, long starttime,
			long endtime, long manager) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateActicity(long id, int subject, Object newcontent) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteActicity(long[] ids) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Activity getActicity(long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Activity> getAllActivities() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Activity> getActivitiesByManager(long uid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Activity> getActivitiesByIds(long[] ids) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
