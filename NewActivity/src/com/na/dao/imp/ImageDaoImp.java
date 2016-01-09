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

import com.na.dao.ImageDao;
import com.na.entity.Image;

@Repository("imageDao")
public class ImageDaoImp implements ImageDao {

	@Autowired
	@Qualifier("sessionFactory")
	SessionFactory sessionFactory;
	
	//插入
	@Override
	public boolean insert(Image image) {
		try {
			Session session = sessionFactory.getCurrentSession();
			Transaction ts = session.beginTransaction();
			session.saveOrUpdate(image);
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
	public boolean update(Image image) {
		try {
			Session session = sessionFactory.getCurrentSession();
			Transaction ts = session.beginTransaction();
			session.saveOrUpdate(image);
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
	public boolean delete(Image image) {
		try {
			Session session = sessionFactory.getCurrentSession();
			Transaction ts = session.beginTransaction();		
			session.delete(image);
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
		List<Image> list = null;
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
		List<Image> list = null;
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

	@Override
	public Image getImage(long id) {
		Session session = sessionFactory.getCurrentSession();
		Image image = (Image) session.get(Image.class, id);
		return image;
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
