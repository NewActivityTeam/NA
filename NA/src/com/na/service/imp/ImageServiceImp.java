package com.na.service.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.na.dao.ImageDao;
import com.na.entity.Image;
import com.na.service.ImageService;

@Service("imageService")
public class ImageServiceImp implements ImageService {
	
	@Autowired
	@Qualifier("imageDao")
	ImageDao imageDao;

	//新图片
	@Override
	public int newImage(String address, long aid, int index) {

		int code = 17014;
		
		try {
			Image image = new Image();
			image.setAid(aid);
			image.setAddress(address);
			image.setIndex(index);
			if (imageDao.insert(image)) {
				code = 17011;
			}
			else{
				code = 17013;
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return code;
	}

	//删除图片
	@Override
	public int deleteImage(long id) {

		int code = 17024;
		
		try {
			Image image = imageDao.getImage(id);
			if (imageDao.delete(image)) {
				code = 17021;
			}
			else{
				code = 17023;
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return code;
	}

	//获取图片
	@Override
	public Image getImage(long id) {
		return imageDao.getImage(id);
	}

	//获取活动的所有图片
	@Override
	public List<Image> getImagesByAID(long aid) {

		String hql = "from Image where aid="+aid;
		try {
			List<Image> list = (List<Image>) imageDao.selectHql(hql);
			if (list!=null&&list.size()!=0) {
				return list;
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
