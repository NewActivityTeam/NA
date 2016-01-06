package com.na.service;

import java.util.List;

import com.na.entity.PCP;

public interface PCPService {

	public int newPCP(long uid,long aid);
	
	public List<Long> getUIDsByAID(long aid);
	
	public List<Long> getAIDsByUID(long uid);
	
	public List<Long> getUIDsByGID(long gid);
	
	public PCP getPcp(long id);
	
	public PCP getPcpByUID(long uid);
	
	public PCP getPcpByAID(long aid);
	
	public float getAvgGradeByUID(long uid);
	
	public int deletePCPsByAID(long aid);
	
	public int deletePCPsByUID(long uid);
	
	public int exitPCP(long id);
	
	public int exitPCP(long uid,long aid);
	
}
