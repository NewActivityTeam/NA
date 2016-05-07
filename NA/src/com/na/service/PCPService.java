package com.na.service;

import java.util.List;

import com.na.entity.PCP;

public interface PCPService {

	public int newPCP(long uid,long aid);
	
	public int exitPCP(long id);
	
	public int exitPCP(long uid,long aid);
	
	public int joinGroup(long id,long gid);
	
	public int exitGroup(long id);
	
	public int getGroupCount(long gid);
	
	public List<Long> getUIDsByAID(long aid);
	
	public List<Long> getAIDsByUID(long uid);
	
	public List<Long> getUIDsByGID(long gid);
	
	public List<Long> getUIDsByAIDNoGroup(long aid);
	
	public List<Long> getPCPIDsByAIDNoGroup(long aid);
	
	public PCP getPcp(long id);
	
	public PCP getPcp(long uid,long aid);
	
	public List<PCP> getPcpByUID(long uid);
	
	public List<PCP> getPcpByAID(long aid);
	
	public List<PCP> getPcpByAIDOrderGroup(long aid);
	
	public int setGrade(long id,float grade);
	
	public int setMutiUserGrade(long ids[],float grade);
	
	public float getGrade(long id);
	
	public float getAvgGradeByUID(long uid);
	
	public int deletePCPsByAID(long aid);
	
	public int deletePCPsByUID(long uid);
	
	public int fastAllot(List<Long> pcpids,List<Long> groups,int nop);
	
	public int setGroup(long pid,long gid);
	
	public int setGroup(long aid, long uid,long gid);
	
	public boolean testGroupIsFull(long gid,int count);
}
