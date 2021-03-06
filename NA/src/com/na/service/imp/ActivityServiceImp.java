package com.na.service.imp;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
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

	//新增活动
	@Override
	public int newActicity(String title, String logo, String description, Timestamp starttime,
			Timestamp endtime, Timestamp endsigntime,String address,String voteAddress,long manager,int number) {
		
		int code = 12014;
		
		try {
			Activity activity = new Activity();
			activity.setTitle(title);
			activity.setLogo(logo);
			activity.setDescription(description);
			activity.setManager(manager);
			activity.setEndsigntime(endsigntime);
			activity.setAddress(address);
			activity.setVoteaddress(voteAddress);
			Date date = new Date();
			activity.setCreatetime(new Timestamp(date.getTime()));
			activity.setStarttime(starttime);
			activity.setEndtime(endtime);
			activity.setNumber(number);
			if(activityDao.update(activity)){
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
	 * 		8	address			活动地址
	 * 		9	endsigntime		报名截止时间
	 * 		10	voteAddress		投票地址
	 */
	@Override
	public int updateActicity(long id,String title, String logo, String description, Timestamp starttime,
			Timestamp endtime, Timestamp endsigntime,String address,String voteAddress,long manager,int number) {
		
		int code = 12024;
		
		try {
			Activity activity = activityDao.getActivity(id);
			if (activity!=null) {
				activity.setTitle(title);
				activity.setLogo(logo);
				activity.setDescription(description);
				activity.setManager(manager);
				activity.setEndsigntime(endsigntime);
				activity.setAddress(address);
				activity.setVoteaddress(voteAddress);
				activity.setStarttime(starttime);
				activity.setEndtime(endtime);
				activity.setNumber(number);
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
	public int deleteActivity(long[] ids) {
		
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
	public List<Activity> getAllActivitiesByPage(int currentPage,int pageSize) {
		String hql = "from Activity where id>0";
		List<Activity> list = (List<Activity>) activityDao.selectHqlByPage(hql,currentPage,pageSize);
		if (list.size()!=0) {
			return list;
		}
		return null;

	}
	
	//获取所有活动,若为空返回null
	@Override
	public List<Activity> getActivitiesByPageByFlag(int flag,int currentPage,int pageSize) {
		String hql = null;
		/*SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String d =	df.format(date);*/
		Date date = new Date();
		Timestamp timestamp = new Timestamp(date.getTime()); //2013-01-14 22:45:36.484

		if(flag == 0) hql = "from Activity where id>0";
		else if(flag == 1) hql ="from Activity where id >0 and endtime >='"+timestamp+"'";
		else if(flag == 2) hql ="from Activity where id >0 and endtime < '"+timestamp+"'" ;
		List<Activity> list = (List<Activity>) activityDao.selectHqlByPage(hql,currentPage,pageSize);
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
	public int addActivity(Activity activity) {
		// TODO Auto-generated method stub
		activityDao.add(activity);
		return 0;
	}


	@Override
	public List<Activity> getActivitiesByConditions(String title,Timestamp start,Timestamp end,int currentPage,int pageSize) {
		// TODO Auto-generated method stub
		int count = 0;
		String hql = "from Activity where";
		if(title != null){
			if(count == 0){
				hql += " title like '%"+title+"%'";
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
				hql += " and endtime <= '"+end+"'";
			}
		}
		List<Activity> list = (List<Activity>) activityDao.selectHqlByPage(hql,currentPage,pageSize);
		if(list.size() > 0){
			return list;
		}
		return null;
	}

	@Override
	public int deleteActivity(long id) {
		// TODO Auto-generated method stub
		
		int code = 12034;
		String hql = "delete Activity a where a.id =" + id;
		try {
			if(activityDao.otherHql(hql)==1){
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


	@Override
	public int getAllActivityNumber() {
		// TODO Auto-generated method stub
		String hql = "from Activity";
		List<Activity> list = (List<Activity>) activityDao.selectHql(hql);
		return list.size();
	}
	
	@Override
	public int getAllActivityNumberByFlag(int flag) {
		// TODO Auto-generated method stub
		String hql = null;
		//SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		Timestamp timestamp = new Timestamp(date.getTime());		
		switch(flag){
		case 0: hql = "from Activity";break;
		case 1: hql = "from Activity where id >0 and  endtime >= '"+timestamp+"'";break;
		case 2: hql = "from Activity where id >0 and  endtime < '" +timestamp+"'";break;
		}
		List<Activity> list = (List<Activity>) activityDao.selectHql(hql);
		return list.size();
	}



	@Override
	public int getPartActivityNumber(String title,Timestamp start,Timestamp end) {
		// TODO Auto-generated method stub
		int count = 0;
		String hql = "from Activity where";
		if(title != null){
			if(count == 0){
				hql += " title like '%"+title+"%'";
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
				hql += " and endtime <= '"+end+"'";
			}
		}
		List<Activity> list = (List<Activity>) activityDao.selectHql(hql);
		return list.size();
	}


	//通过状态获取活动（暂未分页）,true为在进行中，false为结束
	@Override
	public List<Activity> getAllActvityByState(boolean state) {
		String hql = "from Activity where ";
		Timestamp now = new Timestamp(new Date().getTime());
		if (state) {
			
			hql+="endtime > '"+now +"' order by endsigntime asc";
			
		}else{
			
			hql+="endtime < '"+now +"' order by endtime desc";
			
		}
		List<Activity> list = (List<Activity>) activityDao.selectHql(hql);
		if (list!=null&&list.size()!=0) {
			return list;
		}

		return null;
	}

	//添加快速分组个数
	@Override
	public void addFastGroupedCount(long aid,int fgc) {
		Activity activity = activityDao.getActivity(aid);
		if(activity.getFgc()==null||activity.getFgc()==0){
			activity.setFgc(fgc);
		}
		else{
			activity.setFgc(activity.getFgc()+fgc);
		}
		activityDao.update(activity);
	}

	@Override
	public List<Activity> getNewestActivities() {
		// TODO Auto-generated method stub
		String hql = "from Activity order by createtime";
		List<Activity> list = (List<Activity>) activityDao.selectHql(hql);
		return list;
	}

	@Override
	public List<Activity> getScoreActivities() {
		// TODO Auto-generated method stub
		String sql = "";
		return null;
	}


	
}
