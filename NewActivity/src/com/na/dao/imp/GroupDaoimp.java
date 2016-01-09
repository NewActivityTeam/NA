package com.na.dao.imp;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.na.dao.GroupDao;
import com.na.entity.Group;

@Repository("groupDao")
public class GroupDaoimp implements GroupDao {

	@Autowired
	@Qualifier("sessionFactory")
	SessionFactory sessionFactory;
	
	@Override
	public boolean insert(Group group) {
		try {
			Session session = sessionFactory.getCurrentSession();
			Transaction ts = session.beginTransaction();
			session.saveOrUpdate(group);
			ts.commit();
			session.flush(); 
			session.clear(); 
			//session.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean update(Group group) {
		try {
			Session session = sessionFactory.getCurrentSession();
			Transaction ts = session.beginTransaction();
			session.saveOrUpdate(group);
			ts.commit();
			session.flush(); 
			session.clear(); 
			session.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean delete(Group group) {
		try {
			Session session = sessionFactory.getCurrentSession();
			Transaction ts = session.beginTransaction();		
			session.delete(group);
			ts.commit();
			session.flush(); 
			session.clear();
			session.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	//查询hql
	public Object selectHql(String hql) {
		List<Group> list = null;
		try {
			Session session = sessionFactory.getCurrentSession();
			Query query =  session.createQuery(hql);
			list = query.list();
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		return list;
	}

	//查询SQL
	public Object selectSql(String sql) {
		List<Group> list = null;
		try {
			Session session = sessionFactory.getCurrentSession();
			SQLQuery query =  session.createSQLQuery(sql);
			list = query.list();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}

	//执行无查询HQL语句
	public boolean otherHql(String hql) {
		try {
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery(hql);
			if (query.executeUpdate()!=0) {
				return true;
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}

	//执行无查询SQL语句
	public boolean otherSql(String sql) {
		try {
			Session session = sessionFactory.getCurrentSession();
			SQLQuery query = session.createSQLQuery(sql);
			if (query.executeUpdate()!=0) {
				return true;
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public Group getGroup(long id) {
		Session session = sessionFactory.getCurrentSession();
		Group group = (Group) session.get(Group.class, id);
		return group;
	}
}
