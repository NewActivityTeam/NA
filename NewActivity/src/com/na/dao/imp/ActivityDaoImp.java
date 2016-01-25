package com.na.dao.imp;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.na.dao.ActivityDao;
import com.na.entity.Activity;

@Repository("activityDao")
public class ActivityDaoImp implements ActivityDao {

	@Autowired
	@Qualifier("sessionFactory")
	SessionFactory sessionFactory;

	//插入
	public boolean insert(Activity activity) {
		try {
			Session session = sessionFactory.getCurrentSession();
			Transaction ts = session.beginTransaction();
			session.saveOrUpdate(activity);
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

	//修改
	public boolean update(Activity activity) {
		try {
			Session session = sessionFactory.getCurrentSession();
			Transaction ts = session.beginTransaction();
			session.saveOrUpdate(activity);
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

	//删除
	public boolean delete(Activity activity) {
		try {
			Session session = sessionFactory.getCurrentSession();
			Transaction ts = session.beginTransaction();		
			session.delete(activity);
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
		List<Activity> list = null;
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
		List<Activity> list = null;
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

	//通过ID获取
	public Activity getActivity(long id) {
		Session session = sessionFactory.getCurrentSession();
		Activity activity = (Activity) session.get(Activity.class, id);
		return activity;
	}

	//执行无查询HQL语句
	public int otherHql(String hql) {
		try {
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery(hql);
			return query.executeUpdate();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return -1;
	}

	//执行无查询SQL语句
	public int otherSql(String sql) {
		try {
			Session session = sessionFactory.getCurrentSession();
			SQLQuery query = session.createSQLQuery(sql);
			return query.executeUpdate();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return -1;
	}
}
