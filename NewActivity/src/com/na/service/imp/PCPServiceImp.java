package com.na.service.imp;

import java.util.List;

import com.na.dao.PCPDao;
import com.na.entity.PCP;
import com.na.service.PCPService;

public class PCPServiceImp implements PCPService {

	PCPDao pcpDao;

	public PCPDao getPcpDao() {
		return pcpDao;
	}

	public void setPcpDao(PCPDao pcpDao) {
		this.pcpDao = pcpDao;
	}

	@Override
	public int newPCP(long uid, long aid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Long> getUIDsByAID(long aid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Long> getAIDsByUID(long uid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Long> getUIDsByGID(long gid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PCP getPcp(long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PCP getPcp(long uid, long aid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PCP> getPcpByUID(long uid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PCP> getPcpByAID(long aid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PCP> getPcpByAIDOrderGroup(long aid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public float setGrade(long id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public float getGrade(long id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public float getAvgGradeByUID(long uid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deletePCPsByAID(long aid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deletePCPsByUID(long uid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int exitPCP(long id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int fastAllot(long[] ids, List<Long> groups, int nop) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
