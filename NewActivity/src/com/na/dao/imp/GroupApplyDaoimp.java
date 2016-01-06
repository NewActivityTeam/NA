package com.na.dao.imp;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.na.dao.GroupApplyDao;
import com.na.entity.GroupApply;

public class GroupApplyDaoimp implements GroupApplyDao {

	SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public boolean insert(GroupApply groupApply) {
		try {
			Session session = sessionFactory.getCurrentSession();
			Transaction ts = session.beginTransaction();
			session.saveOrUpdate(groupApply);
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
	public boolean update(GroupApply groupApply) {
		try {
			Session session = sessionFactory.getCurrentSession();
			Transaction ts = session.beginTransaction();
			session.saveOrUpdate(groupApply);
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
	public boolean delete(GroupApply groupApply) {
		try {
			Session session = sessionFactory.getCurrentSession();
			Transaction ts = session.beginTransaction();		
			session.delete(groupApply);
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
		List<GroupApply> list = null;
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
		List<GroupApply> list = null;
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
	public GroupApply getGroupApply(long id) {
		Session session = sessionFactory.getCurrentSession();
		GroupApply groupApply = (GroupApply) session.get(GroupApply.class, id);
		return groupApply;
	}
}
