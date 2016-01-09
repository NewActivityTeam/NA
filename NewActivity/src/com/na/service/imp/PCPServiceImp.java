package com.na.service.imp;

import java.util.List;

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
		// TODO Auto-generated method stub
		return 0;
	}

	//获取所有参与某活动的用户ID
	@Override
	public List<Long> getUIDsByAID(long aid) {
		// TODO Auto-generated method stub
		return null;
	}

	//获取某用户参与的所有活动ID
	@Override
	public List<Long> getAIDsByUID(long uid) {
		// TODO Auto-generated method stub
		return null;
	}

	//获取某小组全部成员ID
	@Override
	public List<Long> getUIDsByGID(long gid) {
		// TODO Auto-generated method stub
		return null;
	}

	//获取参与情况
	@Override
	public PCP getPcp(long id) {
		// TODO Auto-generated method stub
		return null;
	}

	//通过用户ID和活动ID获取参与情况
	@Override
	public PCP getPcp(long uid, long aid) {
		// TODO Auto-generated method stub
		return null;
	}

	//获取用户所有参与情况
	@Override
	public List<PCP> getPcpByUID(long uid) {
		// TODO Auto-generated method stub
		return null;
	}

	//获取活动所有参与情况
	@Override
	public List<PCP> getPcpByAID(long aid) {
		// TODO Auto-generated method stub
		return null;
	}

	//获取某活动所有参与情况，以小组形式排列
	@Override
	public List<PCP> getPcpByAIDOrderGroup(long aid) {
		// TODO Auto-generated method stub
		return null;
	}

	//主办方给参与活动的用户评分
	@Override
	public float setGrade(long id) {
		// TODO Auto-generated method stub
		return 0;
	}

	//查看参与活动的用户评分
	@Override
	public float getGrade(long id) {
		// TODO Auto-generated method stub
		return 0;
	}

	//获取用户往届参与所有活动的平均分
	@Override
	public float getAvgGradeByUID(long uid) {
		// TODO Auto-generated method stub
		return 0;
	}

	//删除某活动所有参与情况
	@Override
	public int deletePCPsByAID(long aid) {
		// TODO Auto-generated method stub
		return 0;
	}

	//删除某用户所有参与情况
	@Override
	public int deletePCPsByUID(long uid) {
		// TODO Auto-generated method stub
		return 0;
	}

	//退出活动
	@Override
	public int exitPCP(long id) {
		// TODO Auto-generated method stub
		return 0;
	}

	//快速分组（nop表示每组人数上限）
	@Override
	public int fastAllot(long[] ids, List<Long> groups, int nop) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
