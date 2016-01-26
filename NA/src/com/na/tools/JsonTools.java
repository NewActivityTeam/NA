package com.na.tools;

import java.util.Map;

import net.sf.json.JSONObject;

public class JsonTools {
	
	//Json字符串转换成Map
    public static Map<String,Object> jsonToMap(String jsonString){

        try {	
	    	JSONObject jsonObject = JSONObject.fromObject(jsonString);
	    	Map<String,Object> result = (Map<String,Object>)jsonObject;
	        return result;
        } 
        catch (Exception e) {
        	System.out.print("转换出错");
			e.printStackTrace();
		}
        return null;
        
    }
    
    //Map转换成Json字符串
    public static String mapToJson(Map<String, Object> map){
    	
    	try{
	    	JSONObject jsonObject = JSONObject.fromObject(map);
	    	return jsonObject.toString();
    	}
    	catch(Exception e){
    		System.out.print("转换出错");
			e.printStackTrace();
    	}
    	return null;
    	
    }

}
