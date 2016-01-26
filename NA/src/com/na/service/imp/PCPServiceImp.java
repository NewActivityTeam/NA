package com.na.service.imp;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.na.dao.PCPDao;
import com.na.entity.PCP;
import com.na.service.PCPService;

@Service("pcpService")
public class PCPServiceImp implements PCPService {

	@Autowired
	@Qualifier("pcpDao")
	PCPDao pcpDao;

	//参与活动
	@Override
	public int newPCP(long uid, long aid) {

		int code = 14014;
		
		try {
			if (getPcp(uid, aid)!=null) {
				code = 14012;
			}
			else{
				PCP pcp = new PCP();
				pcp.setUid(uid);
				pcp.setAid(aid);
				pcp.setCreatetime(new Timestamp(new Date().getTime()));
				if (pcpDao.insert(pcp)) {
					return 14011;
				}
				else{
					return 14013;
				}
			}
			
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return code;
	}

	//退出活动
	@Override
	public int exitPCP(long id) {

		int code = 14024;
		
		try {
			PCP pcp = pcpDao.getPcp(id);
			if (pcp==null) {
				code = 14022;
			}
			if (pcpDao.delete(pcp)) {
				code = 14021;
			}
			else{
				code = 14023;
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return code;
	}

	//退出活动通过uid和aid
	@Override
	public int exitPCP(long uid, long aid) {
		int code = 14024;
		String hql = "delete PCP where uid="+uid+" and aid="+aid;
		try {
			if (getPcp(uid, aid)==null) {
				code = 14022;
			}
			else{
				if (pcpDao.otherHql(hql)==1) {
					code = 14021;
				}
				else{
					code = 14023;
				}
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return code;
	}
	
	//参加小组
	@Override
	public int joinGroup(long id, long gid) {

		int code = 14034;
		
		try {
			PCP pcp = pcpDao.getPcp(id);
			if(pcp.getGroupid()!=null){
				//若已有组
				code = 14032;
			}
			else {
				//没有加入组
				pcp.setGroupid(gid);
				if(pcpDao.update(pcp)){
					code = 14031;
				}
				else{
					code = 14033;
				}
			}
			
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return code;
	}

	//退出小组
	@Override
	public int exitGroup(long id) {
		
		int code = 14044;
		
		try {
			PCP pcp = pcpDao.getPcp(id);
			if (pcp.getGroupid()==null) {
				//没有小组
				code = 14042;
			}
			else{
				pcp.setGroupid(null);
				if (pcpDao.update(pcp)) {
					code = 14041;
				}
				else{
					code = 14043;
				}
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return code;
	}
	
	//获取某小组当前人数
	@Override
	public int getGroupCount(long gid) {
		String hql = "from PCP where gid="+gid;
		try{
			List<PCP> list = (List<PCP>) pcpDao.selectHql(hql);
			if (list!=null&&list.size()!=0) {
				return list.size();
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return -1;
	}
	
	//获取所有参与某活动的用户ID
	@Override
	public List<Long> getUIDsByAID(long aid) {
		
		String hql = "from PCP where aid="+aid;
		try {
			List<Long> list = new ArrayList<Long>();
			List<PCP> pcps = (List<PCP>) pcpDao.selectHql(hql);
			if (pcps!=null&&pcps.size()!=0) {
				for (PCP pcp : pcps) {
					list.add(pcp.getUid());
				}
				return list;
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		return null;
	}

	//获取某用户参与的所有活动ID
	@Override
	public List<Long> getAIDsByUID(long uid) {

		String hql = "from PCP where uid="+uid;
		try {
			List<Long> list = new ArrayList<Long>();
			List<PCP> pcps = (List<PCP>) pcpDao.selectHql(hql);
			if (pcps!=null&&pcps.size()!=0) {
				for (PCP pcp : pcps) {
					list.add(pcp.getAid());
				}
				return list;
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		return null;
	}

	//获取某小组全部成员ID
	@Override
	public List<Long> getUIDsByGID(long gid) {
		String hql = "from PCP where gid="+gid;
		try {
			List<Long> list = new ArrayList<Long>();
			List<PCP> pcps = (List<PCP>) pcpDao.selectHql(hql);
			if (pcps!=null&&pcps.size()!=0) {
				for (PCP pcp : pcps) {
					list.add(pcp.getUid());
				}
				return list;
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		return null;
	}

	//获取某活动所有未分组成员ID
	public List<Long> getUIDsByAIDNoGroup(long aid){
		String hql = "from PCP where aid = "+ aid +" and gid is null";
		try {
			List<Long> list = new ArrayList<Long>();
			List<PCP> pcps = (List<PCP>) pcpDao.selectHql(hql);
			if (pcps!=null&&pcps.size()!=0) {
				for (PCP pcp : pcps) {
					list.add(pcp.getUid());
				}
				return list;
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		return null;
	}
	

	//获取参与情况
	@Override
	public PCP getPcp(long id) {
		return pcpDao.getPcp(id);
	}

	//通过用户ID和活动ID获取参与情况
	@Override
	public PCP getPcp(long uid, long aid) {
		String hql = "from PCP where uid="+uid+" and aid="+aid;
		try {
			List<PCP> list = (List<PCP>) pcpDao.selectHql(hql);
			if (list!=null&&list.size()!=0) {
				PCP pcp = list.get(0);
				return pcp;
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	//获取用户所有参与情况
	@Override
	public List<PCP> getPcpByUID(long uid) {
		String hql = "from PCP where uid="+uid;
		try {
			List<PCP> list = (List<PCP>) pcpDao.selectHql(hql);
			if(list!=null&&list.size()!=0){
				return list;
			}
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		return null;
	}

	//获取活动所有参与情况
	@Override
	public List<PCP> getPcpByAID(long aid) {
		String hql = "from PCP where aid="+aid;
		try {
			List<PCP> list = (List<PCP>) pcpDao.selectHql(hql);
			if(list!=null&&list.size()!=0){
				return list;
			}
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		return null;
	}

	//获取某活动所有参与情况，以小组形式排列
	@Override
	public List<PCP> getPcpByAIDOrderGroup(long aid) {
		String hql = "from PCP where aid="+aid+" order by gid asc";
		try {
			List<PCP> list = (List<PCP>) pcpDao.selectHql(hql);
			if(list!=null&&list.size()!=0){
				return list;
			}
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		return null;
	}

	//主办方给参与活动的用户评分
	@Override
	public int setGrade(long id,float grade) {
		
		int code = 14054;
		try {
			PCP pcp = pcpDao.getPcp(id);
			pcp.setGrade(grade);
			if (pcpDao.update(pcp)) {
				code = 14051;
			}
			else{
				code = 14053;
			}
		
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return code;
	}

	//主办方批量给用户评分
	@Override
	public int setMutiUserGrade(long[] ids,float grade) {
		
		String hql = "update PCP pcp set pcp.grade="+grade+" where pcp.id in ("+ids+")";
		int code = 14054;
		
		try {
			if (pcpDao.otherHql(hql)==ids.length) {
				code = 14051;
			}
			else{
				code = 14053;
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return code;
	}
	
	//查看参与活动的用户评分
	@Override
	public float getGrade(long id) {
		
		try {
			PCP pcp = pcpDao.getPcp(id);
			if (pcp.getGrade()!=null) {
				return pcp.getGrade();
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return -1;
	}

	//获取用户往届参与所有活动的平均分
	@Override
	public float getAvgGradeByUID(long uid) {

		String hql = "from PCP where uid="+uid+"and grade is not null";
		try {
		
			List<PCP> list = (List<PCP>) pcpDao.selectHql(hql);
			if(list!=null&&list.size()!=0){
				float avg = 0;
				for (PCP pcp : list) {
					avg += pcp.getGrade();
				}
				avg /= list.size();
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}

		return -1;
	}

	//删除某活动所有参与情况
	@Override
	public int deletePCPsByAID(long aid) {
		String hql = "delete PCP where aid="+aid;
		int code = 14064;
		
		try {
			if (pcpDao.otherHql(hql)!=-1) {
				code = 14061;
			}
			else{
				code = 14063;
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return code;
	}

	//删除某用户所有参与情况
	@Override
	public int deletePCPsByUID(long uid) {
		String hql = "delete PCP where uid="+uid;
		int code = 14074;
		
		try {
			if (pcpDao.otherHql(hql)!=-1) {
				code = 14071;
			}
			else{
				code = 14073;
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return code;
	}

	//快速分组（nop表示每组人数上限）
	public int fastAllot(long[] ids, List<Long> groups, int nop) {

		int code = 14004;
		int idCount = ids.length;
		int groupCount = groups.size();
		//组数不够
		if ((groupCount*nop)<idCount) {
			code = 14002;
		}
		else{
			try {
				int gindex = -1;
				int success = 0;
				for (int i = 0; i < ids.length; i++) {
					PCP pcp = pcpDao.getPcp(ids[i]);
					//组满人则gindex+1，填入下一组 
					if (i%nop==0) {
						gindex++;
					}
					pcp.setGroupid(groups.get(gindex));
					if (pcpDao.update(pcp)) {
						success++;
					}
				}
				//所有分配均成功
				if (success==ids.length) {
					code = 14001;
				}
				else{
					code = 14003;
				}
			} 
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		return code;
	}


}
