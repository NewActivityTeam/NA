package com.na.tools;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;

public class HttpWebTools {

	//GET方式访问
	public static String getURLContentByGET(String urlAddress) {
		
		//网络的url地址 
		URL url = null;
		
		//http连接 
		HttpURLConnection httpConn = null;
		
		//输入流 
		BufferedReader in = null;
		StringBuffer stringBuffer = new StringBuffer();
		try {
			url = new URL(urlAddress);
			in = new BufferedReader(new InputStreamReader(url.openStream(),"UTF-8"));
			
			String string = null;
			while ((string = in.readLine()) != null) {
				stringBuffer.append(string);
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		} 
		finally {
			try {
				if (in != null) {
					in.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		String result = stringBuffer.toString();
		return result;
	}
	
	//POST方式访问
	public static String getURLByPost(String urlAddress, String params)
			throws Exception {

		URL url = new URL(urlAddress);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		
		conn.setRequestMethod("POST");
		conn.setDoOutput(true);
		conn.setDoInput(true);
		
		PrintWriter printWriter = new PrintWriter(conn.getOutputStream());
		printWriter.write(params);
		printWriter.flush();
		BufferedReader bufferedReader = null;
		StringBuilder stringBuffer = new StringBuilder();
		try {
			bufferedReader = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			String string = null;
			while ((string = bufferedReader.readLine()) != null) {
				stringBuffer.append(string);
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		} 
		finally {
			try {
				conn.disconnect();
				if (bufferedReader != null) {
					bufferedReader.close();
				}
				if (printWriter != null) {
					printWriter.close();
				}
			} catch (IOException ex) {
				throw ex;
			}
		}
		
		return stringBuffer.toString();
	}
}
