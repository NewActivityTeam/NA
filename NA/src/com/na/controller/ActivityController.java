package com.na.controller;




import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import com.na.entity.Activity;
import com.na.entity.Comment;
import com.na.entity.nodb.ActivityWithNum;
import com.na.service.ActivityService;
import com.na.service.CommentService;
import com.na.service.PCPService;
import com.na.tools.Pager;



@Controller
public class ActivityController extends BaseController{
	private final static int PAGE_SIZE = 12;
	private int currentPage = 1;
	@Autowired
	public ActivityService activityService;
	@Autowired
	public CommentService commentService;
	
	@Autowired
	PCPService pcpService;
	@ResponseBody
	@RequestMapping("upload")
	public void upload(HttpServletRequest request) throws IllegalStateException, IOException{
		CommonsMultipartResolver multipartResover = new CommonsMultipartResolver(request.getSession().getServletContext());
		if(multipartResover.isMultipart(request)){
			String imageURL = "";
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			Iterator<String> iter = multiRequest.getFileNames();
			int i = 0;
			while(iter.hasNext()){
				int pre = (int) System.currentTimeMillis();
				MultipartFile file = multiRequest.getFile(iter.next());
				if(file != null){
					String myFileName = file.getOriginalFilename();
					if(myFileName.trim() != ""){
						imageURL += (myFileName + ";");
						request.getSession().setAttribute("imageURL", imageURL);
						String fileName = file.getOriginalFilename();
						String path = request.getSession().getServletContext().getRealPath("/") + "/upload/" + fileName;
						File localFile = new File(path);
						file.transferTo(localFile);
					}
				}
				else {
					System.out.println("读不出来");
				}
			}
		}
	}
	@ResponseBody
	@RequestMapping("PublishActivity")
	public Map<String, Integer> publishActivityTest(){
		Map<String, Integer> map  = new HashMap<String, Integer>();
		int code = 12015;
		try{
			String title = request.getParameter("title");
			Timestamp starttime = Timestamp.valueOf(request.getParameter("startDate") + " " + request.getParameter("startTime") + ":00");
			Timestamp endtime = Timestamp.valueOf(request.getParameter("endDate") + " " + request.getParameter("endTime") + ":00");
			Timestamp endsigntime = Timestamp.valueOf(request.getParameter("endSignDate") + " " + request.getParameter("endSignTime") + ":00");
			String address = request.getParameter("address");
			String voteAddress = request.getParameter("voteaddress");
			String description = request.getParameter("content");
			String file = request.getParameter("file");
			String logo = request.getParameter("logo");
			long manager = Long.parseLong(request.getParameter("manager"));
			int number = 1;
			if (!request.getParameter("number").equals("")) {
				number = Integer.parseInt(request.getParameter("number"));
			}
			code = activityService.newActicity(title,logo, description, starttime, endtime, endsigntime, address, voteAddress, manager,number);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		map.put("code", code);
		return map;
	}
	@RequestMapping("GetActivities")
	public ModelAndView GetActivities(ModelMap map){
		currentPage = Integer.parseInt(request.getParameter("current"));
		request.setAttribute("current", currentPage);
		Timestamp start = null;
		Timestamp end = null;
		String title = null;
		if(request.getParameter("title") != ""){
			title = request.getParameter("title");
		}
		if(request.getParameter("startDate") != ""){
			start = Timestamp.valueOf(request.getParameter("startDate") + " 00:00:00");
		}
		if( request.getParameter("endDate") != ""){
			end = Timestamp.valueOf(request.getParameter("endDate") + " 23:59:59");
		}
		if(title == null && start == null && end == null){
			 return new ModelAndView("redirect:/GetAllActivities?current=" + currentPage + "&method=GetAllActivities");
		}
		else{
			int totalSize = getPartActivitiesNumber(title,start,end);
			Pager page = new Pager(currentPage,totalSize);
			request.setAttribute("current", currentPage);
			request.setAttribute("pageCount", page.getTotalPage());
			request.setAttribute("func", "GetActivities");
			request.setAttribute("title", title);
			request.setAttribute("start", request.getParameter("startDate"));
			request.setAttribute("end", request.getParameter("endDate"));
			List<Activity> list = activityService.getActivitiesByConditions(title,start,end,currentPage,page.getPageSize());
			map.addAttribute("activities",list);
			return new ModelAndView("/jsp/ManageActivityOfShow");
		}
	}
	@RequestMapping("GetAllActivities")
	public String GetAllActivities(ModelMap map){
		int totalSize = getAllActivitiesNumber();
		Pager page = new Pager(currentPage,totalSize);
		currentPage = Integer.parseInt(request.getParameter("current"));
		request.setAttribute("current", currentPage);
		request.setAttribute("pageCount", page.getTotalPage());
		request.setAttribute("func", "GetAllActivities");
		List<Activity> list = activityService.getAllActivitiesByPage(currentPage,page.getPageSize());
		map.addAttribute("activities", list);
		return "/jsp/ManageActivityOfShow";
	}
	@RequestMapping("DeleteActivity")
	public ModelAndView DeleteActivity(){
		currentPage = Integer.parseInt(request.getParameter("current"));
		String start = request.getParameter("startDate");
		String end = request.getParameter("endDate");
		String title = request.getParameter("title");
		Long id = (long) Integer.parseInt(request.getParameter("id"));
		activityService.deleteActivity(id);
		return new ModelAndView("redirect:/GetActivities?current=" + currentPage + "&title=" + title + "&startDate=" + start + "&endDate=" + end);
	}
	@RequestMapping("UpdateActivity")
	public ModelAndView UpdateActivity(){
		long id = Integer.parseInt(request.getParameter("id"));	
		Activity activity = activityService.getActicity(id);
		request.setAttribute("activity", activity);
		return new ModelAndView("/jsp/UpdateActivity");
	}
	@ResponseBody
	@RequestMapping("ChangeActivity")
	public Map<String, Integer> ChangeActivity(){
		Map<String, Integer> map  = new HashMap<String, Integer>();
		int code = 12015;
		try{
			Long id = Long.parseLong(request.getParameter("id"));
			String title = request.getParameter("title");
			Timestamp starttime = Timestamp.valueOf(request.getParameter("startDate") + " " + request.getParameter("startTime") + ":00");
			Timestamp endtime = Timestamp.valueOf(request.getParameter("endDate") + " " + request.getParameter("endTime") + ":00");
			Timestamp endsigntime = Timestamp.valueOf(request.getParameter("endSignDate") + " " + request.getParameter("endSignTime") + ":00");
			String address = request.getParameter("address");
			String voteAddress = request.getParameter("voteaddress");
			String description = request.getParameter("content");
			String logo = request.getParameter("logo");
			long manager = Long.parseLong(request.getParameter("manager"));
			int number = 1;
			if (!request.getParameter("number").equals("")) {
				number = Integer.parseInt(request.getParameter("number"));
			}
			code = activityService.updateActicity(id, title,logo, description, starttime, endtime, endsigntime, address, voteAddress, manager, number);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		map.put("code", code);
		return map;
	}
	@RequestMapping("getActivity")
	public String getActivity(HttpServletRequest request){
		long aid = Long.parseLong(request.getParameter("aid"));
		List<Comment> list = null;
		Activity activity = activityService.getActicity(aid);
		list = commentService.getAllCommentsByPage(aid,0,5);
		request.setAttribute("activity", activity);
		request.setAttribute("commentlist", list);
		return "jsp/pc/activity";
	}
	public int getActivitiesCount(int flag){
		return activityService.getAllActivityNumberByFlag(flag);
	}
	public int getActivitiesCountOfUser(long uid){
		return 0;
	}
	@ResponseBody
	@RequestMapping("getAllActivitiesOfPC")
	public Map<String,Object> getAllActivitiesOfPC(HttpServletRequest request){
		Map<String,Object> map = new HashMap<String,Object>();
		int page = Integer.parseInt(request.getParameter("page"));
		int flag = Integer.parseInt(request.getParameter("flag"));
		int total = 0;
		int pages = 0;
		List<Activity> list = activityService.getActivitiesByPageByFlag(flag,page, PAGE_SIZE);
		total = this.getActivitiesCount(flag);
		if(total % PAGE_SIZE == 0){
			pages = total / PAGE_SIZE;
		}else{
			pages = total / PAGE_SIZE + 1;
		}
		map.put("list", list);
		map.put("total", pages);
		return map;
	}
	@RequestMapping("DoWithImage")
	public void DoWithImage(){
		System.out.println("hello");
	}
	public int getAllActivitiesNumber(){
		return activityService.getAllActivityNumber();
	}
	public int getPartActivitiesNumber(String title,Timestamp start,Timestamp end){
		return activityService.getPartActivityNumber(title, start, end);
	}
	@RequestMapping("ManageActivity")
	public String ManageActivity()
	{
		long id = (long)Integer.parseInt(request.getParameter("id"));	
		request.setAttribute("id", id);
		return "jsp/GroupManage";
	}
	/***
	 * 活动列表
	 * @param request
	 * 
	 * 		display		展示方式：空或web为Web端；mobile为手机端
	 * 		state		活动状态：true为在进行中，false为结束
	 * @return
	 * 		code		返回结果值
	 * 		list		活动列表
	 */
	@RequestMapping("/activity/activity_list")
	public String listActivities(){
		int code = 90165;
		String display = request.getParameter("display");
		try{
			boolean state =  Boolean.parseBoolean(request.getParameter("state"));
			List<Activity> list = activityService.getAllActvityByState(state);
			List<ActivityWithNum> list1 = list.stream()
					.map(activity->new ActivityWithNum(activity,pcpService.getUIDsByAID(activity.getId()) == null ? 0 : pcpService.getUIDsByAID(activity.getId()).size()))
					.collect(Collectors.toList());
			list1.forEach(System.out::println);
			request.setAttribute("list", list1);
			code = 90161;
		}
		catch(Exception e){
			e.printStackTrace();
		}
		request.setAttribute("code", code);
		if(display!=null&&display.endsWith("mobile")){
			return "jsp/mobile/ActivityList";
		}
		return "jsp/ActivityList";
	}
	/***
	 * 展示活动详情
	 * @param request
	 * 		display		展示方式：空或web为Web端；mobile为手机端
	 * 		aid		活动id
	 * @return
	 * 		code		返回结果值
	 * 		activity	活动详情
	 */
	@RequestMapping("/activity/activity_show")
	public String showActivity(HttpServletRequest request){
		
		String display = request.getParameter("display");
		int code = 90215;
		try {
			long aid = Long.parseLong(request.getParameter("aid"));
			Activity activity = activityService.getActicity(aid);
			if (activity!=null) {
				request.setAttribute("activity", activity);
				code = 90211;
			}
			else{
				code = 90212;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("code", code);
		if (display!=null&&display.equals("mobile")) {
			return "jsp/mobile/ActivityShow";
		}
		return "jsp/ActivityContent";
	}
}
