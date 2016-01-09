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

import com.na.dao.UserinfoDao;
import com.na.entity.Userinfo;

@Repository("userinfoDao")
public class UserinfoDaoImp implements UserinfoDao {

	@Autowired
	@Qualifier("sessionFactory")
	SessionFactory sessionFactory;
	
	//插入
	@Override
	public boolean insert(Userinfo userinfo) {
		try {
			Session session = sessionFactory.getCurrentSession();
			Transaction ts = session.beginTransaction();
			session.saveOrUpdate(userinfo);
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
	@Override
	public boolean update(Userinfo userinfo) {
		try {
			Session session = sessionFactory.getCurrentSession();
			Transaction ts = session.beginTransaction();
			session.saveOrUpdate(userinfo);
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

	//删除
	@Override
	public boolean delete(Userinfo userinfo) {
		try {
			Session session = sessionFactory.getCurrentSession();
			Transaction ts = session.beginTransaction();		
			session.delete(userinfo);
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

	//查询HQL
	@Override
	public Object selectHql(String hql) {
		List<Userinfo> list = null;
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
	@Override
	public Object selectSql(String sql) {
		List<Userinfo> list = null;
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
	@Override
	public Userinfo getUserinfo(long uid) {
		Session session = sessionFactory.getCurrentSession();
		Userinfo userinfo = (Userinfo) session.get(Userinfo.class, uid);
		return userinfo;
	}

	//执行无查询HQL语句
	@Override
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
	@Override
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

}
