package com.na.controller;




import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import com.na.service.ActivityService;
import com.na.service.CommentService;
import com.na.tools.Pager;



@Controller
public class ActivityController extends BaseController{
	private final static int PAGE_SIZE = 4;
	private int currentPage = 1;
	@Autowired
	public ActivityService activityService;
	@Autowired
	public CommentService commentService;
	
	/*@RequestMapping("PublishActivity")
	public String publishActivity() throws ParseException{
		Activity activity = new Activity();
		activity.setTitle(request.getParameter("title"));
		activity.setStarttime(Timestamp.valueOf(request.getParameter("startDate") + " " + request.getParameter("startTime") + ":00"));
		activity.setEndtime(Timestamp.valueOf(request.getParameter("endDate") + " " + request.getParameter("endTime") + ":00"));
		activity.setEndsigntime(Timestamp.valueOf(request.getParameter("endSignDate") + " " + request.getParameter("endSignTime") + ":00"));
		activity.setCreatetime(Timestamp.valueOf(request.getParameter("createDate") + " " + request.getParameter("createTime") + ":00"));
		activity.setAddress(request.getParameter("address"));
		activity.setWebAddress(request.getParameter("voteaddress"));
		activity.setDescription(request.getParameter("content"));
		activity.setManager((long)Integer.parseInt(request.getParameter("manager")));
		activityService.addActivity(activity);
		return "/jsp/PublishActivity";
	}*/
	
	/*@RequestMapping("PublishActivity")
	public String publishActivity() throws ParseException{
		
		String title = request.getParameter("title");
		Timestamp starttime = Timestamp.valueOf(request.getParameter("startDate") + " " + request.getParameter("startTime") + ":00");
		Timestamp endtime = Timestamp.valueOf(request.getParameter("endDate") + " " + request.getParameter("endTime") + ":00");
		Timestamp endsigntime = Timestamp.valueOf(request.getParameter("endSignDate") + " " + request.getParameter("endSignTime") + ":00");
		Timestamp createtime = Timestamp.valueOf(request.getParameter("createDate") + " " + request.getParameter("createTime") + ":00");
		String address = request.getParameter("address");
		String voteAddress = request.getParameter("voteaddress");
		String description = request.getParameter("content");
		long manager = Long.parseLong(request.getParameter("manager"));
		if(activityService.newActicity(title, description, starttime, endtime, endsigntime, address, voteAddress, manager)==12011){
			System.out.print("成功");
		}
		return "/jsp/PublishActivity";
	}*/
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
			long manager = Long.parseLong(request.getParameter("manager"));
			int number = 1;
			if (!request.getParameter("number").equals("")) {
				number = Integer.parseInt(request.getParameter("number"));
			}
			code = activityService.newActicity(title, description, starttime, endtime, endsigntime, address, voteAddress, manager,number);
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
			System.out.println("description:" + description);
			long manager = Long.parseLong(request.getParameter("manager"));
			int number = 1;
			System.out.println("number:" + request.getParameter("number"));
			if (!request.getParameter("number").equals("")) {
				number = Integer.parseInt(request.getParameter("number"));
			}
			System.out.println(title + " " + starttime + " " + endtime + " " + endsigntime + " " + voteAddress + " " + description);
			code = activityService.updateActicity(id, title, description, starttime, endtime, endsigntime, address, voteAddress, manager, number);
			System.out.println("code:" + code);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		map.put("code", code);
		return map;
	}
	/*
	 
	@RequestMapping(value="/album/uploadImage/{albumId}",method= RequestMethod.POST)
    @ResponseBody
    public Object uploadImage(@RequestParam(value="file", required=false) MultipartFile file,@PathVariable Integer albumId){
        Map result_map = new HashMap();
        try{
            byte[] bytes = file.getBytes();
            String uploadDir = request.getSession().getServletContext().getRealPath("/upload");//request.getContextPath()+"/upload";
            File dirPath = new File(uploadDir);
            if (!dirPath.exists()) {
                dirPath.mkdirs();
            }
            String sep = System.getProperty("file.separator");
            String fileName = UUID.randomUUID().toString() + "." + getSuffix(file.getOriginalFilename());
            File uploadedFile = new File(uploadDir + sep + fileName);
            FileCopyUtils.copy(bytes, uploadedFile);

            //上传到又拍云
            String filePath = uploadDir + "/" + fileName;
            Map<String, Object> map = UpYunUtil.writeFile(fileName, filePath, true);
            String url = (String) map.get("detail");
            new File(filePath).delete();//上传到又拍云后删除

            //保存照片Url到image表
            storeService.saveImage(albumId,url);
            result_map.put("url",url);
            return result_map;
        }catch (IOException e){
            result_map.put("url","");
            return result_map;
        }
    }
	*/
	
	@RequestMapping("getActivity")
	public String getActivity(HttpServletRequest request){
		//long id = Long.parseLong(request.getParameter("id"));
		long aid = Long.parseLong(request.getParameter("aid"));
		List<Comment> list = null;
		System.out.println("+++++");
		Activity activity = activityService.getActicity(aid);
		list = commentService.getAllCommentsByPage(aid,0,5);
		System.out.println("=====");
		request.setAttribute("activity", activity);
		request.setAttribute("commentlist", list);
		System.out.println(activity.getTitle());
		return "jsp/pc/activity";
	}
	
	public int getActivitiesCount(int flag){
		System.out.println("flag ======"+flag);
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
		//List<Activity> list = activityService.getAllActivitiesByPage(page, PAGE_SIZE);
		List<Activity> list = activityService.getActivitiesByPageByFlag(flag,page, PAGE_SIZE);
		total = this.getActivitiesCount(flag);
		
		if(total % PAGE_SIZE == 0){
			pages = total / PAGE_SIZE;
		}else{
			pages = total / PAGE_SIZE + 1;
		}
		System.out.println("total = " + total + "," + "pages = " + pages);
		if(list != null){
			System.out.println("第" + page + "页内容！");
			for(Activity activity : list){
				System.out.println(activity.getTitle());
			}
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
		System.out.println("manageactivity , id = "+id);
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
			request.setAttribute("list", list);
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
				System.out.print(activity.getDescription());
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
