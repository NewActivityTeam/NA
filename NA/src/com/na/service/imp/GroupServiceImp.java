package com.na.service.imp;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.hql.internal.ast.HqlASTFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.na.dao.ActivityDao;
import com.na.dao.GroupDao;
import com.na.dao.UserinfoDao;
import com.na.entity.Activity;
import com.na.entity.Group;
import com.na.entity.Userinfo;
import com.na.entity.nodb.ReturnMyGroup;
import com.na.service.GroupService;

@Service("groupService")
public class GroupServiceImp implements GroupService {

	@Autowired
	@Qualifier("groupDao")
	GroupDao groupDao;
	@Autowired
	@Qualifier("activityDao")
	ActivityDao activityDao;

	@Autowired
	@Qualifier("userinfoDao")
	UserinfoDao userinfoDao;

	// 创建新的小组
	@Override
	public int createGroup(long aid, String groupname, String description,
			int maxcount) {

		int code = 15014;

		try {
			Group group = new Group();
			group.setAid(aid);
			group.setGroupname(groupname);
			group.setDescription(description);
			group.setMaxcount(maxcount);
			if (groupDao.insert(group)) {
				code = 15011;
			} else {
				code = 15013;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return code;
	}

	// 创建新的小组
	public int createGroup(long aid, long leader, String groupname,
			String description, int maxcount) {

		int code = 15014;

		try {
			Group group = new Group();
			group.setAid(aid);
			group.setGroupname(groupname);
			group.setDescription(description);
			group.setMaxcount(maxcount);
			group.setLeader(leader);
			if (groupDao.insert(group)) {
				code = 15011;
			} else {
				code = 15013;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return code;
	}

	// 更新小组信息
	@Override
	public int updateGroup(long id, String groupname, String description,
			int maxcount) {

		int code = 15024;

		try {
			Group group = groupDao.getGroup(id);
			group.setGroupname(groupname);
			group.setDescription(description);
			group.setMaxcount(maxcount);
			if (groupDao.update(group)) {
				code = 15021;
			} else {
				code = 15023;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return code;
	}

	// 删除小组
	@Override
	public int deleteGroip(long id) {

		int code = 15034;

		try {
			Group group = groupDao.getGroup(id);
			if (groupDao.delete(group)) {
				code = 15031;
			} else {
				code = 15033;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return code;
	}

	// 获取小组
	@Override
	public Group getGroup(long id) {
		return groupDao.getGroup(id);
	}

	// 获取某活动的所有小组
	@Override
	public List<Group> getGroupsByAID(long aid) {

		String hql = "from Group where aid=" + aid;

		try {
			List<Group> list = (List<Group>) groupDao.selectHql(hql);
			if (list != null && list.size() != 0) {
				return list;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	// 获取某人参加的所有小组（适用于不同活动）
	@Override
	public List<Group> getGroupsByUID(long uid) {

		String hql = "from Group where uid=" + uid;

		try {
			List<Group> list = (List<Group>) groupDao.selectHql(hql);
			if (list != null && list.size() != 0) {
				return list;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	/***
	 * 快速创建多个小组，返回小组ID列表 aid 活动id count 代分人数 nop 每组人数
	 */
	@Override
	public List<Long> fastCreateGroups(long aid, int count, int nop) {

		try {
			int groupCount = 0;
			int success = 0;
			// 确定分组数量
			if (count % nop == 0) {
				groupCount = count / nop;
			} else {
				groupCount = count / nop + 1;
			}
			for (int i = 0; i < groupCount; i++) {
				Group group = new Group();
				group.setAid(aid);
				group.setMaxcount(nop);
				if (groupDao.insert(group)) {
					success++;
				}
			}
			// 分配成功
			if (success == groupCount) {
				String hql = "from Group where aid=" + aid
						+ " and groupname is null";
				List<Group> groups = (List<Group>) groupDao.selectHql(hql);
				if (groups != null && groups.size() == groupCount) {
					List<Long> list = new ArrayList<Long>();
					for (Group group : groups) {
						list.add(group.getId());
					}
					if (list.size() == groupCount) {
						return list;
					}
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/***
	 * 处理快速分组业务逻辑结果
	 * 
	 * @param aid
	 *            活动id
	 * @param result
	 *            true 快速分组成功，为已分组命名 false 快速分组失败，删除创建组
	 */
	@Override
	public int fastGroupResultHandle(long aid, boolean result, int fgc) {
		int code = 15004;

		try {
			if (result) {
				int success = 0;
				int index = fgc + 1;
				String hql = "from Group where aid=" + aid
						+ " and groupname is null";
				List<Group> groups = (List<Group>) groupDao.selectHql(hql);
				if (groups != null && groups.size() != 0) {
					for (Group group : groups) {
						group.setGroupname("GROUP" + index);
						index++;
						if (groupDao.update(group)) {
							success++;
						}
					}
					if (success == groups.size()) {
						code = 15001;
					} else {
						code = 15003;
					}
				}
			} else {
				String hql = "delete from Group g where g.aid=" + aid
						+ " and g.groupname is null";
				if (groupDao.otherHql(hql) != -1) {
					code = 15041;
				} else {
					code = 15043;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return code;
	}

	// 获取通过AID和Leader获取组
	@Override
	public Group getGroupByAIDAndLeader(long aid, long leader) {
		try {
			String hql = "from Group where aid= " + aid + " and leader= "
					+ leader;
			List<Group> list = (List<Group>) groupDao.selectHql(hql);
			if (list != null && list.size() != 0) {
				return list.get(0);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// 改变（设置）组长
	public int updateGroupLeader(long gid, long newleader) {
		int code = 90004;
		try {
			Group group = groupDao.getGroup(gid);
			group.setLeader(newleader);
			if (groupDao.update(group)) {
				code = 90001;
			} else {
				code = 90003;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return code;
	}

	// 通过组长id获取
	@Override
	public List<Group> getGroupsByLeader(long leader) {

		String hql = "from Group where leader=" + leader;

		try {
			List<Group> list = (List<Group>) groupDao.selectHql(hql);
			if (list != null && list.size() != 0) {
				return list;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public List<ReturnMyGroup> getGroupsByGID(long ids[]) {
		// TODO Auto-generated method stub
		List<ReturnMyGroup> list = new ArrayList<ReturnMyGroup>();
		for (long id : ids) {
			// list.add(groupDao.getGroup(id));
			if (id != 0) {
				ReturnMyGroup myGroup = new ReturnMyGroup();
				Group group = groupDao.getGroup(id);
				if(group != null){
					Activity activity = activityDao.getActivity(group.getAid());
					if(activity != null){
						Userinfo user = userinfoDao.getUserinfo(group.getLeader());
						myGroup.setGroupname(group.getGroupname());
						myGroup.setLeader(user.getName());
						myGroup.setTitle(activity.getTitle());
						myGroup.setNumber(group.getMaxcount());
						myGroup.setId(group.getId());
						list.add(myGroup);
					}
				}
			}
		}
		return list;
	}

	@Override
	public List<ReturnMyGroup> getPCGroupsByAID(long aid) {
		// TODO Auto-generated method stub
		String hql = "from Group where aid=" + aid;
		List<ReturnMyGroup> grouplist = new ArrayList<ReturnMyGroup>();
		try {
			List<Group> list = (List<Group>) groupDao.selectHql(hql);
			for(Group group : list){
				Activity activity = activityDao.getActivity(group.getAid());
				Userinfo user = userinfoDao.getUserinfo(group.getLeader());
				ReturnMyGroup mygroup = new ReturnMyGroup();
				mygroup.setLeader(user.getName());
				mygroup.setTitle(activity.getTitle());
				mygroup.setNumber(group.getMaxcount());
				mygroup.setGroupname(group.getGroupname());
				mygroup.setId(group.getId());
				grouplist.add(mygroup);
			}
			if (list != null && list.size() != 0) {
				return grouplist;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}
}
