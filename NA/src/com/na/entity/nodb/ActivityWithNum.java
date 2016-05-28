package com.na.entity.nodb;

import com.na.entity.Activity;

public class ActivityWithNum {
	Activity activity;
	Integer number;
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	public ActivityWithNum(){
		
	}
	public ActivityWithNum(Activity activity,Integer number){
		this.activity = activity;
		this.number= number;
	}
	public Activity getActivity() {
		return activity;
	}
	public void setActivity(Activity activity) {
		this.activity = activity;
	}
	
}
