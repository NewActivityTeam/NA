package com.na.service.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.na.dao.AssessDao;
import com.na.entity.Assess;
import com.na.service.AssessService;

@Service("assessService")
public class AssessServiceImp implements AssessService {

	@Autowired
	@Qualifier("assessDao")
	AssessDao assessDao;


	//新的评分
	@Override
	public int newAssess(long uid, long aid, float grade) {
		
		int code = 13114;
		
		try {
			Assess assess = new Assess();
			assess.setUid(uid);
			assess.setAid(aid);
			assess.setGrade(grade);
			if (assessDao.insert(assess)) {
				code = 13111;
			}
			else{
				code = 13113;
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return code;
	}

	//更新评分
	@Override
	public int updateGrade(long id, float newGrade) {
		
		int code = 13124;
		
		try {
			Assess assess = assessDao.getAssess(id);
			assess.setGrade(newGrade);
			if (assessDao.update(assess)) {
				code = 13121;
			}
			else{
				code = 13123;
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return code;
	}

	//删除评分
	@Override
	public int deleteAssess(long id) {
		
		int code = 13134;
		
		try {
			Assess assess = assessDao.getAssess(id);
			if (assessDao.delete(assess)) {
				code = 13131;
			}
			else {
				code = 13133;
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return code;
	}

	//删除评分,通过uid和aid
	public int deleteAssess(long uid,long aid){
		int code = 13134;
		String hql = "delete Assess where uid="+uid+" and aid="+aid;
		try {
			if (assessDao.otherHql(hql)==1) {
				code = 13131;
			}
			else {
				code = 13133;
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return code;
	}
	//获取评分
	@Override
	public Assess getAssess(long id) {
		return assessDao.getAssess(id);
	}

	//通过用户名和活动名获取指定评分
	@Override
	public Assess getAssess(long uid, long aid) {

		String hql = "from Assess where uid="+uid+" and aid="+aid;
		try {
			List<Assess> list = (List<Assess>) assessDao.selectHql(hql);
			if (list!=null&&list.size()!=0) {
				return list.get(0);
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	//获取某活动的所有评分
	@Override
	public List<Assess> getAssessesByAID(long aid) {
		
		String hql = "from Assess where aid="+aid;
		try {
			List<Assess> list = (List<Assess>) assessDao.selectHql(hql);
			if (list!=null&&list.size()!=0) {
				return list;
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	//获取活动的平均评分,错误返回-1
	@Override
	public float getAvgGradeByAID(long aid) {

		String hql = "from Assess where aid="+aid;
		try {
			List<Assess> list = (List<Assess>) assessDao.selectHql(hql);
			float avg = 0;
			if (list!=null&&list.size()!=0) {
				for (Assess assess : list) {
					avg += assess.getGrade();
				}
				avg = avg/list.size();
				return avg;
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	//删除某活动所有评分
	@Override
	public boolean deleteAllAssessByAID(long aid) {

		String hql = "delete Assess where aid="+aid;
		
		try {
			if(assessDao.otherHql(hql)!=-1){
				return true;
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}

	//删除某用户所有评分
	@Override
	public boolean deleteAllAssessByUID(long uid) {

		String hql = "delete Assess where uid="+uid;
		
		try {
			if(assessDao.otherHql(hql)!=-1){
				return true;
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	
}
