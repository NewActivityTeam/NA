package com.na.service.imp;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.na.dao.ActivityDao;
import com.na.entity.Activity;
import com.na.service.ActivityService;

@Service("activityService")
public class ActivityServiceImp implements ActivityService {
	
	@Autowired
	@Qualifier("activityDao")
	private ActivityDao activityDao;

	@Override
	public int addActivity(Activity activity) {
		// TODO Auto-generated method stub
		activityDao.insert(activity);
		return 0;
	}
	
	//新增活动
	@Override
	public int newActicity(String title, String content, long starttime,
			long endtime, long endsigntime, String voteaddress,long manager) {
		
		int code = 12014;
		
		try {
			Activity activity = new Activity();
			activity.setTitle(title);
			activity.setContent(content);
			activity.setManager(manager);
			Date date = new Date();
			activity.setCreatetime(new Timestamp(date.getTime()));
			activity.setStarttime(new Timestamp(starttime));
			activity.setEndtime(new Timestamp(endtime));
			if(activityDao.insert(activity)){
				code = 12011;
			}
			else{
				code = 12013;
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return code;
	}

	/***
	 * 更新活动信息
	 * subject:
	 * 		1	title			标题
	 * 		2	description		内容描述
	 * 		3	starttime		开始时间
	 * 		4	endtime			结束时间
	 * 		5	manager			管理员id
	 * 		6	web_address		Web端地址
	 * 		7	mobile_address	手机端地址
	 * 		8	voteddress		投票地址
	 * 		9	endsigntime		报名截止时间
	 */
	@Override
	public int updateActicity(long id, int subject, Object newcontent) {
		
		int code = 12024;
		
		try {
			Activity activity = activityDao.getActivity(id);
			boolean change = false;
			String content = newcontent.toString();
			
			switch (subject) {
			case 1:
				activity.setTitle(content);
				change = true;
				break;
			case 2:
				activity.setContent(content);
				change = true;
				break;
			case 3:
				long starttime = Long.parseLong(content);
				activity.setStarttime(new Timestamp(starttime));
				change = true;
				break;
			case 4:
				long endtime = Long.parseLong(content);
				activity.setEndtime(new Timestamp(endtime));
				change = true;
				break;
			case 5:
				long uid = Long.parseLong(content);
				activity.setManager(uid);;
				change = true;
				break;
			case 6:
				activity.setMobileAddress(content);
				change = true;
				break;
			case 7:
				activity.setWebAddress(content);
				change = true;
				break;
			case 8:
				activity.setVoteaddress(content);
				change = true;
				break;
			case 9:
				long endsigntime = Long.parseLong(content);
				activity.setEndsigntime(new Timestamp(endsigntime));
				change = true;
				break;
			default:
				break;
			}
			
			if (change) {
				if (activityDao.update(activity)) {
					code = 12021;
				}
				else{
					code = 12023;
				}
			}
			else{
				code = 12022;
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return code;
	}

	//删除活动
	@Override
	public int deleteActicity(long[] ids) {
		
		int code = 12034;
		String hql = "delete Acitcity a where a.id in (" + ids+")";
		try {
			if(activityDao.otherHql(hql)==ids.length){
				code = 12031;
			}
			else{
				code = 12033;
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return code;
	}

	//获取活动
	@Override
	public Activity getActicity(long id) {
		return activityDao.getActivity(id);
	}

	//获取所有活动,若为空返回null
	@Override
	public List<Activity> getAllActivities() {
		String hql = "from Activity where id>0";
		List<Activity> list = (List<Activity>) activityDao.selectHql(hql);
		if (list.size()!=0) {
			return list;
		}
		return null;

	}

	//通过管理员ID获取活动（适用于管理员查看自己的活动）,若为空返回null
	@Override
	public List<Activity> getActivitiesByManager(long uid) {
		String hql = "from Activity where manager="+uid;
		List<Activity> list = (List<Activity>) activityDao.selectHql(hql);
		if (list.size()!=0) {
			return list;
		}
		return null;
	}

	//获取指定ID数组的活动列表，若为空返回null
	@Override
	public List<Activity> getActivitiesByIds(long[] ids) {
		List<Activity> list = new ArrayList<Activity>();
		for (long id : ids) {
			Activity activity = activityDao.getActivity(id);
			if (activity!=null) {
				list.add(activity);
			}
		}
		if (list.size()!=0) {
			return list;
		}
		return null;
	}
	
	@Override
	public List<Activity> getActivitiesByConditions(String title,Timestamp start,Timestamp end) {
		// TODO Auto-generated method stub
		int count = 0;
		String hql = "from Activity where";
		if(title != null){
			if(count == 0){
				hql += " title = '"+title+"'";
				count++;
			}	
		}
		if(start != null){
			if(count == 0){
				hql += " starttime >= '"+start+"'";
				count++;
			}else{
				hql += " and starttime >= '"+start+"'";
			}
		}
		if(end != null){
			if(count == 0){
				hql += " endtime <= '"+end+"'";
				count++;
			}else{
				System.out.println("------");
				hql += " and endtime <= '"+end+"'";
			}
		}
		List<Activity> list = (List<Activity>) activityDao.selectHql(hql);
		if(list.size() > 0){
			return list;
		}
		return null;
	}
}
