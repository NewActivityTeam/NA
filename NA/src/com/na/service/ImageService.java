package com.na.service;

import java.util.List;

import com.na.entity.Image;

public interface ImageService {

	public int newImage(String address,long aid,int index);
	
	public int deleteImage(long id);
	
	public Image getImage(long id);
	
	public List<Image> getImagesByAID(long aid);
}
