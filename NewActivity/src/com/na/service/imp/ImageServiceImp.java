package com.na.service.imp;

import java.util.List;

import com.na.dao.ImageDao;
import com.na.entity.Image;
import com.na.service.ImageService;

public class ImageServiceImp implements ImageService {
	ImageDao imageDao;

	public ImageDao getImageDao() {
		return imageDao;
	}

	public void setImageDao(ImageDao imageDao) {
		this.imageDao = imageDao;
	}

	@Override
	public int newImage(String address, long aid, int index) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteImage(long id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Image getImage(long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Image> getImagesByAID(long aid) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
