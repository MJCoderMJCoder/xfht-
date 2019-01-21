package com.cxgc.front.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.net.URL;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.namespace.QName;
import javax.xml.rpc.ParameterMode;

import org.apache.axis.client.Call;
import org.apache.axis.client.Service;
import org.apache.axis.encoding.XMLType;
import org.apache.axis.encoding.ser.BeanDeserializerFactory;
import org.apache.axis.encoding.ser.BeanSerializerFactory;
import org.apache.poi.ss.formula.functions.T;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cxgc.front.model.LoginReturn;
import com.cxgc.front.model.Person;
import com.cxgc.front.model.RoleModular;
import com.cxgc.front.model.User;
import com.cxgc.front.service.GuestbookService;
import com.cxgc.front.service.IOAService;
import com.cxgc.front.service.PersonService;
import com.cxgc.front.service.UserService;
import com.cxgc.front.util.DateUtils;
import com.cxgc.front.util.Md5PwdEncoder;
import com.cxgc.front.util.ResponseUtils;

import Decoder.BASE64Decoder;
import net.sf.json.JSONObject;
@Controller
public class LoginController {

	@Autowired
	private IOAService<?> ioservice;
	 
	@Autowired
	private UserService userService;
	
	@Autowired
	private PersonService<T> personService;
	
	@Autowired
	private GuestbookService<?> guestbookservice;
	 
	private static SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");  
 
 
	@RequestMapping("/")
	public String GoinsterPage(ModelMap model,HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		return "login";
	}
	
	@RequestMapping("/login")
	public String Login(ModelMap model,HttpServletRequest request, HttpServletResponse response, HttpSession session,RedirectAttributes attr) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String newPassword = Md5PwdEncoder.encodePassword(password,"");
		List<Object[]> objList = userService.loginCheck(username, newPassword);
		if (objList == null || objList.size() == 0) {
			attr.addFlashAttribute("sulogin","noone");
			return "redirect:/";
		}
		
		Object[] obj = objList.get(0);
		User user = (User)obj[0];
		//账户是否启用true(1):启用,false(0):禁用
		if (!user.getEnabled()) {
			attr.addFlashAttribute("sulogin","unable");
			return "redirect:/";
		}

		session.setAttribute("username", username); 
		session.setAttribute("password", password); 
		session.setAttribute("userid", user.getId()); 
		session.setAttribute("user", user); 
		//动态生成top、left
		session.setAttribute("rolePermissions", user.getRole().getRolePermissions());
		return "redirect:cm_index";//直接跳转到高危人员防控
		 
	}
	
	/**
	 * 用户名密码登录
	 * @param model
	 * @param request
	 * @param response
	 * @param session
	 */
	@RequestMapping(value="logon", method=RequestMethod.POST)
	public void logon(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		JSONObject json = new JSONObject();
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String newPassword = Md5PwdEncoder.encodePassword(password,"");
		List<Object[]> objList = userService.loginCheck(username, newPassword);
		if (objList == null || objList.size() == 0) {
			json.put("status", 1);
		}else{
			Object[] obj = objList.get(0);
			User user = (User)obj[0];
    		session.setAttribute("userid", user.getId()); 
    		session.setAttribute("user", user); 
			json.put("userId", user.getId());
			json.put("status", 0);
		}
		ResponseUtils.renderJson(response, json.toString());
		
	}
	
	
	@RequestMapping("/cm_logout")
	public String cm_logout(ModelMap model,HttpServletRequest request, HttpServletResponse response, HttpSession session,RedirectAttributes attr) {
		
        // 获取用户对象
        User user = (User)session.getAttribute("user");
        // 判断用户是否有效
        if(user != null){
            // 将用户对象逐出session
            session.setAttribute("user", null);
            session.setAttribute("userid", null);
        }
        return "redirect:login"; 
    }
	
	/**
	 * 人像登录
	 * @param model
	 * @param request
	 * @param response
	 * @param session
	 */
	@RequestMapping(value="logonImage", method=RequestMethod.POST)
	public void logonImage(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		JSONObject json = new JSONObject();

		Integer personId = request.getParameter("personId") != null && !"".equals(request.getParameter("personId").trim()) ? Integer.parseInt(request.getParameter("personId")) : null;
		String Imagedata = request.getParameter("Imagedata");
		Person person = personService.findById(personId);
		try {  
			BASE64Decoder decoder = new BASE64Decoder();
			 
			// Base64解码
			byte[] bytes = decoder.decodeBuffer(Imagedata);
			for (int i = 0; i < bytes.length; ++i) {
				if (bytes[i] < 0) {// 调整异常数据
					bytes[i] += 256;
				}
			}
			String imageUrl = "/static/upload/loginPortraitImages/" + DateUtils.getDate2Str(new Date()) + "/";
		    String imagePath = request.getSession().getServletContext().getRealPath("/") + imageUrl; 
		    if (!new File(imagePath).exists()) {
				new File(imagePath).mkdirs();
			}
		    String imgName = String.valueOf(System.currentTimeMillis()) + ".jpg";
		    String img = imagePath + imgName;
			// 生成jpeg图片
			OutputStream out = new FileOutputStream(img);
			out.write(bytes);
			out.flush();
			out.close();
			
			// 标识Web Service的具体路径
            String url = "http://172.31.0.57:8089/login?wsdl";
            // 创建 Service实例
            Service service = new Service();
            // 通过Service实例创建Call的实例
            Call call = (Call)service.createCall();
            // 将Web Service的服务路径加入到call实例之中.
            call.setTargetEndpointAddress(new URL(url));
            // 第一个参数名字空间URI，第二个参数本地部分
            QName qn = new QName("urn:login-return", "LoginReturn");
            call.registerTypeMapping(LoginReturn.class, qn,
            		 // 序列化
            	     new BeanSerializerFactory(LoginReturn.class, qn),
            	     new BeanDeserializerFactory(LoginReturn.class, qn));
            // WSDL里面描述的接口名称
            call.setOperationName(new QName("urn:login", "login"));
            // 设置参数类型
            call.addParameter("picture-name", XMLType.XSD_INT, ParameterMode.IN);
            call.addParameter("picture-path", XMLType.XSD_INT, ParameterMode.IN);
            call.addParameter("person-path", XMLType.XSD_INT, ParameterMode.IN);
            call.addParameter("result", qn, ParameterMode.INOUT);
            // 设置返回类型
            call.setReturnClass(LoginReturn.class);
            // 调用Web Service,传入参数
            LoginReturn logRet = new LoginReturn(null, null);
            // 这里传递给service的是一个对象
            LoginReturn result = (LoginReturn) call.invoke(new Object[]{"123456",img,"123123", logRet});
            if(result.getCode() == null ){
    			json.put("status", 1);
    			ResponseUtils.renderJson(response, json.toString());
            	return ;
            }
            if(result.getCode() == 1){
            	User user = userService.findById(personId);
        		session.setAttribute("userid", user.getId()); 
        		session.setAttribute("user", user); 
    			json.put("status", 0);
            	
            }else if(result.getCode() == 0){
    			json.put("status", 2);
            	
            }else if(result.getCode() == -1){
    			json.put("status", 1);
            	
            }
		} catch (Exception e) {  
			json.put("status", 1);
            e.printStackTrace();  
        }  
		ResponseUtils.renderJson(response, json.toString());
		
	}
	
	@RequestMapping("/cm_index")
	public String goIndex(ModelMap model,HttpServletRequest request, HttpServletResponse response, HttpSession session,RedirectAttributes attr) {
		
		Integer personId = request.getParameter("personId") != null && !"".equals(request.getParameter("personId").trim()) ? Integer.parseInt(request.getParameter("personId")) : null;
		
		if(personId!=null){
			User user = userService.getUserById(new Long(personId));
			if(user!=null){
				if(user.getRole().getId()==1){
					//代表超级管理员
					try {
						getAdminInfo(model);
						return "index";
					} catch (RuntimeException e) {
						e.printStackTrace();
						attr.addFlashAttribute("sulogin", "noone");
						return "redirect:login";
					} 
				}else{
					//代表其他无最高权限的登陆者
					try {
						getTypistInfo(model, personId);
						return "index2";
					} catch (RuntimeException e) {
						e.printStackTrace();
						attr.addFlashAttribute("sulogin", "noone");
						return "redirect:login";
					} 
				}
			}else{
				return "redirect:login";
			}
			
		}else{
			return "redirect:login";
		}
		
	}
	
	/**
	 * 管理员首页
	 * @param model
	 */
	public void getAdminInfo(ModelMap model){
		
		StringBuffer ctgsql=new StringBuffer();
		ctgsql.append(" select guestbookctg_id ,ctg_name from jc_guestbook_ctg ORDER BY guestbookctg_id ");
		List<Object[]> ctgls=guestbookservice.getList(ctgsql.toString());
		
		//待录入
		StringBuffer prepareTyping=new StringBuffer();
		prepareTyping.append(" select  c.ctg_name, COUNT(1)  from jc_guestbook a LEFT JOIN jc_guestbook_ext b on  a.guestbook_id=b.guestbook_id  LEFT JOIN jc_guestbook_ctg c on a.guestbookctg_id=c.guestbookctg_id where a.`status`=1 and b.matterCategory is not null  ");
		prepareTyping.append(" GROUP BY  c.guestbookctg_id "); 
		List<Object[]> tableTyping=guestbookservice.getList(prepareTyping.toString());
		StringBuffer typing=new StringBuffer();
		
		//-------饼状图---------//
		if(tableTyping==null||tableTyping.size()==0) {
			List<Object[]> tablenull=new ArrayList<Object[]>(); 
			String con = "";
				for(int i=0;i<ctgls.size();i++) { 
					tablenull.add(new Object[]{ ""+ctgls.get(i)[1]+"",0 }); 
					typing.append(con + "['"+ctgls.get(i)[1]+"',"+0+"]");
					con = ",";
				}   
				model.put("picTyping", tablenull);
		}else{
			
			String con = "";
			
			for(int i=0;i<tableTyping.size();i++){
				typing.append(con + "['"+tableTyping.get(i)[0]+"',"+tableTyping.get(i)[1]+"]");
				con = ",";
			}
			for(int i=0;i<ctgls.size();i++) { 
				int count=0;
				for(int y=0;y<tableTyping.size();y++){ 
					if(ctgls.get(i)[1].equals(tableTyping.get(y)[0])) {
						count++;
					} 
				}
				if(count==0) {
					typing.append(con + "['"+ctgls.get(i)[1]+"',"+0+"]");
					tableTyping.add(new Object[]{ctgls.get(i)[1], 0}); 
					con = ",";
				} 
			} 
			model.put("picTyping", tableTyping);
			
		}
		
		//待分流
		StringBuffer preparePass=new StringBuffer();
		preparePass.append(" select  c.ctg_name, COUNT(1)  from jc_guestbook a LEFT JOIN jc_guestbook_ext b on  a.guestbook_id=b.guestbook_id  LEFT JOIN jc_guestbook_ctg c on a.guestbookctg_id=c.guestbookctg_id where a.`status`=3 and b.matterCategory is not null  ");
		preparePass.append(" GROUP BY  c.guestbookctg_id "); 
		List<Object[]> tablePass=guestbookservice.getList(preparePass.toString());
		StringBuffer pass=new StringBuffer();
		
		//-------饼状图---------//
		if(tablePass==null||tablePass.size()==0) {
			List<Object[]> tablenull=new ArrayList<Object[]>(); 
			String con = "";
				for(int i=0;i<ctgls.size();i++) { 
					tablenull.add(new Object[]{ ""+ctgls.get(i)[1]+"",0 }); 
					pass.append(con + "['"+ctgls.get(i)[1]+"',"+0+"]");
					con = ",";
				}   
				model.put("picPass", tablenull);
		}else{
			
			String con = "";
			
			for(int i=0;i<tablePass.size();i++){
				pass.append(con + "['"+tablePass.get(i)[0]+"',"+tablePass.get(i)[1]+"]");
				con = ",";
			}
			for(int i=0;i<ctgls.size();i++) { 
				int count=0;
				for(int y=0;y<tablePass.size();y++){ 
					if(ctgls.get(i)[1].equals(tablePass.get(y)[0])) {
						count++;
					} 
				}
				if(count==0) {
					pass.append(con + "['"+ctgls.get(i)[1]+"',"+0+"]");
					tablePass.add(new Object[]{ctgls.get(i)[1], 0}); 
					con = ",";
				} 
			} 
			model.put("picPass", tablePass);
			
		}
		model.put("prepareTyping", "["+typing.toString()+"]");
		model.put("preparePass", "["+pass.toString()+"]");
		
		//主页上方数量
		StringBuilder s = new StringBuilder();
		s.append(" select (select count(1) from jc_guestbook where status is not NULL ),(select count(1) from jc_guestbook where status <> 9) from jc_guestbook limit 1 ");
		List<Object[]> count = guestbookservice.getList(s.toString());
		String all="0";
		String notFinish="0";
		if(count!=null && count.size()>0){
			all=count.get(0)[0]+"";
			notFinish=count.get(0)[1]+"";
		}
		model.put("all", all);
		model.put("notFinish", notFinish);
		//折线图
		StringBuffer sqlzxt=new StringBuffer();
		
		sqlzxt.append(" SELECT ctg.ctg_name, ");
		sqlzxt.append(" sum(CASE WHEN YEAR(gb.create_time)=YEAR(date_sub(now(),interval 4 year)) and gb.status  is not null THEN 1 ELSE 0 END ), ");
		sqlzxt.append(" sum(CASE WHEN YEAR(gb.create_time)=YEAR(date_sub(now(),interval 3 year)) and gb.status  is not null THEN 1 ELSE 0 END ), ");
		sqlzxt.append(" sum(CASE WHEN YEAR(gb.create_time)=YEAR(date_sub(now(),interval 2 year)) and gb.status  is not null THEN 1 ELSE 0 END ), ");
		sqlzxt.append(" sum(CASE WHEN YEAR(gb.create_time)=YEAR(date_sub(now(),interval 1 year)) and gb.status  is not null THEN 1 ELSE 0 END ), ");
		sqlzxt.append(" sum(CASE WHEN YEAR(gb.create_time)=YEAR(NOW()) and gb.status  is not null THEN 1 ELSE 0 END ) ");
		sqlzxt.append(" FROM jc_guestbook gb LEFT JOIN jc_guestbook_ctg ctg ON ctg.guestbookctg_id = gb.guestbookctg_id ");
		sqlzxt.append(" GROUP BY gb.guestbookctg_id ORDER BY gb.guestbookctg_id ASC ");
		
		List<Object[]> linechart=guestbookservice.getList(sqlzxt.toString());
		
		StringBuilder jsonjst = new StringBuilder();
		String conzxt="";
		if(linechart!=null && linechart.size()>0){
			for (int j = 0; j < linechart.size(); j++) {
				String name=linechart.get(j)[0].toString(); 
				jsonjst.append(conzxt + "{ name: '"+name+"', data:[ " ); 
				jsonjst.append(linechart.get(j)[1].toString()+","+linechart.get(j)[2].toString()+","+linechart.get(j)[3].toString()+","+linechart.get(j)[4].toString()+","+linechart.get(j)[5].toString());
				jsonjst.append("] }" );
				conzxt = ","; 
			}
			
		}else{
			for (int j = 0; j < ctgls.size(); j++) {
				String name=ctgls.get(j)[1].toString(); 
				jsonjst.append(conzxt + "{ name: '"+name+"', data:[ " ); 
				jsonjst.append("0,0,0,0,0");
				jsonjst.append("] }" );
				conzxt = ","; 
			}
		}
		model.put("pic", "123");
		model.put("zxt", "["+jsonjst+"]");
		
		Calendar date = Calendar.getInstance();
        Integer year = date.get(Calendar.YEAR);
        model.put("pointEnd", year);
        model.put("pointStart", year-4);
	}
	
	public void getTypistInfo(ModelMap model,Integer userId){
		//本地待提交
		StringBuilder sb = new StringBuilder();
		sb.append(" SELECT ctg.ctg_name,sum(CASE WHEN gb.status =1 and gb.user_id="+userId+" THEN 1 ELSE 0 END ) ");
		sb.append(" FROM jc_guestbook gb ");
		sb.append(" LEFT JOIN jc_guestbook_ctg ctg ON ctg.guestbookctg_id = gb.guestbookctg_id ");
		sb.append(" GROUP BY gb.guestbookctg_id ");
		sb.append(" ORDER BY gb.guestbookctg_id ASC  ");
		
		List<Object[]> list = guestbookservice.getList(sb.toString());
		Integer passCount=0;
		if(list!=null && list.size()>0){
			for (Object[] info : list) {
				String temp = info[1].toString();
				passCount+=Integer.valueOf(temp);
			}
		}
		//本地已处理
		StringBuilder handle = new StringBuilder();
		handle.append(" SELECT ctg.ctg_name,sum(CASE WHEN gb.status is not null and gb.status <>0 and gb.status <> 1 and gb.user_id="+userId+" THEN 1 ELSE 0 END ) ");
		handle.append(" FROM jc_guestbook gb ");
		handle.append(" LEFT JOIN jc_guestbook_ctg ctg ON ctg.guestbookctg_id = gb.guestbookctg_id ");
		handle.append(" GROUP BY gb.guestbookctg_id ");
		handle.append(" ORDER BY gb.guestbookctg_id ASC  ");
		List<Object[]> list2 = guestbookservice.getList(handle.toString());
		Integer handleCount=0;
		if(list2!=null && list.size()>0){
			for (Object[] info : list2) {
				String temp = info[1].toString();
				handleCount+=Integer.valueOf(temp);
			}
		}
		
		model.put("waitToPass", list);
		model.put("handle", list2);
		model.put("passCount", passCount);
		model.put("handleCount", handleCount);
		
	}
	
	
	
	@RequestMapping("/gettotle")
	@ResponseBody
	public void getUserList(HttpServletRequest request,HttpServletResponse response,@RequestBody String model) {
		//查询近一周的告警统计图
		String totlesql="select (select count(1) from t_alarm where  alarm_type='2' "
				+ "and YEARWEEK(date_format(create_date,'%Y%m%d')) = YEARWEEK(now())-1)  count111 , "
				+ "DATE_FORMAT(create_date,'%m%d') days,count(1) count from t_alarm where  alarm_type='2' "
				+ "and YEARWEEK(date_format(create_date,'%Y%m%d')) = YEARWEEK(now())-1 group by days;";
		List temp=ioservice.do_sql(totlesql);	
		JSONObject jsonObject =new JSONObject();
		if(temp==null||temp.size()==0)
		{
			jsonObject.put("ltt", new JSONObject());
		}
		else
		{
			DecimalFormat df = new DecimalFormat("0.00");
			jsonObject.put("ltt", temp);
			List<Object[]> yxtotle=new ArrayList<Object[]>();
			for(int i=0;i<temp.size();i++)
			{
				Object[] a=(Object[]) temp.get(i);
				Object[] newlist={a[1], df.format(Integer.valueOf(a[2].toString())*1.00/Integer.valueOf(a[0].toString()) *10000/100.00)};
				yxtotle.add(newlist);
			}
			jsonObject.put("ltt1", yxtotle);
			
		}
		ResponseUtils.renderJson(response, jsonObject.toString());
	}
	
	
	
	@RequestMapping("/go_edit_userpass")
	public String goEditUser(ModelMap model,HttpServletRequest request, HttpServletResponse response, HttpSession session,RedirectAttributes attr) {
		if(session.getAttribute("username")!=null) {
		 String pass=(String) session.getAttribute("password");
		model.put("pass", pass)	;
		return "main/editpass";
		}
		else{
			attr.addFlashAttribute("sulogin","out");
			return "redirect:/";
		}
	}
	
	@RequestMapping("/edit_user")
	public String editUser(ModelMap model,HttpServletRequest request, HttpServletResponse response, HttpSession session,RedirectAttributes attr) {
		if(session.getAttribute("username")!=null) {
			 String pass=request.getParameter("xmm");
			 String ssss= Md5PwdEncoder.encodePassword(pass,"");
			 String sql="UPDATE t_user SET `password` = '"+ssss+"' WHERE username='"+session.getAttribute("username")+"'";
			 int result=ioservice.do_update(sql);
			 if(result>0) {
				 attr.addFlashAttribute("sulogin","edit");
					return "redirect:/";
			 }
			 else  {
				 attr.addFlashAttribute("sulogin","f");
				 return "redirect:go_edit_userpass";
			 } 
			}
			else{
				attr.addFlashAttribute("sulogin","out");
				return "redirect:/";
			}
	}
	
}
