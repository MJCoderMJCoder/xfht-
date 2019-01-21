package com.cxgc.front.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/*import com.cxgc.front.model.CxMessageBoard;
import com.cxgc.front.model.CxNews;
import com.cxgc.front.model.CxTeam;
import com.cxgc.front.model.JcVoteSubtopic;
import com.cxgc.front.model.JcVoteTopic;
import com.cxgc.front.service.CxMessageBoardService;
import com.cxgc.front.service.CxNewsService;
import com.cxgc.front.service.CxTeamService;
import com.cxgc.front.service.CxVoteService;*/
import com.cxgc.front.util.StacticVariable;
import com.sun.image.codec.jpeg.ImageFormatException;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

import net.sf.json.JSONObject;

/**
 * Copy Right Information :  银河天鼎<br/>
 * Project                :  创新广场<br/>
 * Author                 :  <br/>
 * JDK version used       :  JDK 1.7
 * Description            :  吐槽模块控制层文件
 * @version  0.0.0.1
 */
@Controller
public class MessageBoardController {
	
	protected final Logger log = Logger.getLogger(MessageBoardController.class);	
	
/*	private CxNewsService sevices;

	private CxVoteService voteService;
	
	private CxMessageBoardService msgBoardService;
	
	private CxTeamService teamservice;// 团队推荐相关service

	@RequestMapping(value={"/tc_{pageIndex}"}) 
	public ModelAndView toTC(ModelMap model, HttpServletRequest request, HttpServletResponse res,@PathVariable int pageIndex){	
		if(pageIndex <=0){
			pageIndex = 1;
		}
		ModelAndView mv = new ModelAndView("tc/tc");
		mv = this.getLeftMV(mv);
		List<CxMessageBoard> list =msgBoardService.getleaveWordsByStatusDesc(pageIndex, 8);
		model.put("list", list);
		int iCount = msgBoardService.getAllMessageBoardByStatu();
		String pageBar = this.pageStr(iCount,StacticVariable.getCoursePageNumber(), pageIndex);
		model.put("pageBar", pageBar);

		CxNews cxmodel = new CxNews();// 查询赛事咨询
		cxmodel = sevices.getLatestNewsByChannel(75);
		model.put("cxmodel", cxmodel);
		return mv;
	}
	@RequestMapping(value={"/tc_add"})
	@ResponseBody
	public Map<String, Object> add(@RequestBody String model,HttpServletRequest request, HttpServletResponse res){	
		CxMessageBoard msg = new CxMessageBoard();
		JSONObject jsonObj = JSONObject.fromObject(model);
		Iterator<?> it = jsonObj.keys();
		while (it.hasNext()) {
			String key = (String) it.next();
			String value = jsonObj.getString(key);
			Method m;
			try {
				if("mbUsId".equals(key)){
					msg.setMbUsId(Integer.parseInt(value));
					continue;
				}
				m = msg.getClass().getMethod("set" + key, String.class);
				m.invoke(msg, value.trim());
			} catch (NoSuchMethodException | SecurityException | IllegalAccessException | IllegalArgumentException
					| InvocationTargetException e) {
				log.error("add: ex_" + e);
			}
		}
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			msgBoardService.addCxMessageBoard(msg);
			map.put("status", 1);
		} catch (Exception e) {
			map.put("status", 0);
		}
		return map;
	}
	
	
	@RequestMapping("/tc_research")
	public ModelAndView toTC_WJ(ModelMap model, HttpServletRequest request, HttpServletResponse res){		
		ModelAndView mv = new ModelAndView("tc/tc_research");
		mv = this.getLeftMV(mv);
		JcVoteTopic jcVote = voteService.getLastestVote();
		Set<JcVoteSubtopic> setJcVoteSubtopic=jcVote.getJcVoteSubtopics();
		List<JcVoteSubtopic> listtemp=new ArrayList<JcVoteSubtopic>();
		for(Iterator<JcVoteSubtopic> it=setJcVoteSubtopic.iterator();it.hasNext();){
			listtemp.add((JcVoteSubtopic) it.next());
		}
		model.put("listtemp", listtemp);
		return mv;
	}
	  @RequestMapping("/tc_save")
	    public @ResponseBody int saveTc(HttpServletRequest request, HttpServletResponse response){

		  JcVoteTopic jcVote = voteService.getLastestVote();
		  Date now = new Date();
		  
		  if(jcVote.getStartTime()!=null){
			  if(jcVote.getStartTime().getTime() > now.getTime()){
				  return 2;
			  }
		  }
		  if(jcVote.getEndTime()!=null){
			  if(jcVote.getEndTime().getTime() < now.getTime()){
				  return 3;
			  }
		  }
			
		  String checkedall=request.getParameter("checkedall");
		  String mapinput=request.getParameter("mapinput");
		  String [] temp=mapinput.split(",");//文本填写框
		  String [] sel=checkedall.split(",");//被选择的项
		  Map<Integer,String> map = new HashMap<Integer,String>();
		  Integer[] ff=  new Integer[sel.length];
			for(int i=0;i< sel.length;i++) {
				ff[i]=Integer.parseInt(sel[i]);
			}
			for(int j=0;j<temp.length;j++) 	{
				String [] tempafter=temp[j].split("__");
				int temp1=Integer.parseInt(tempafter[0].trim());
				String temp2=tempafter[1].trim();
				if(temp2!="") {
					map.put(temp1, temp2);
				}
			}
			voteService.mergeVote(2,ff,map,"127.0.0.1");
			return 1;
	  }*/
	
	
	@RequestMapping(value = "/tc_f")
	@ResponseBody
	public void toKcList(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("image/jpeg");  
        response.setHeader("Cache-Control", "no-cache");  
        response.setHeader("Pragma", "No-cache");  
        response.setDateHeader("Expires", 0L);  
        int width = 80;  
        int height = 30;  
        BufferedImage image = new BufferedImage(width, height, 1);  
        Graphics g = image.getGraphics();  
        Random random = new Random();  
        g.setColor(getRandColor(200, 250));  
        g.fillRect(0, 0, width, height);  
        g.setFont(new Font("Arial", 0, 25));  
        g.setColor(getRandColor(160, 200));  
        for (int i = 0; i < 155; i++) {  
            int x = random.nextInt(width + 100);  
            int y = random.nextInt(height + 100);  
            int xl = random.nextInt(10);  
            int yl = random.nextInt(12);  
            g.drawOval(x, y, x + xl, y + yl);  
        }  
        String code = request.getParameter("code");  
        String sRand = code;  
        for (int i = 0; i < sRand.length(); i++) {  
            String rand = sRand.substring(i, i + 1);  
            g.setColor(new Color(20 + random.nextInt(110), 20 + random  
                    .nextInt(110), 20 + random.nextInt(110)));  
            g.drawString(rand, 14 * i + 5, 25);  
        }  
        g.dispose();  
        javax.servlet.ServletOutputStream imageOut;
		try {
			imageOut = response.getOutputStream();
			JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(imageOut);  
			encoder.encode(image);
		} catch (ImageFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
	/*private ModelAndView getLeftMV(ModelAndView mv){
		CxNews cxnewmatch = sevices.getLatestNewsByChannel(75);// 查询赛事咨询
		CxTeam cxnewteam = teamservice.getLatestTeam();// 查询团队
		JcVoteTopic jcVote = voteService.getLastestVote();
		mv.addObject("cxnewmatch", cxnewmatch);
		mv.addObject("cxnewteam", cxnewteam);
		mv.addObject("jcVote", jcVote);
		return mv;
	}*/
	private Color getRandColor(int fc, int bc) {  
        Random random = new Random();  
        if (fc > 255)  
            fc = 255;  
        if (bc > 255)  
            bc = 255;  
        int r = fc + random.nextInt(bc - fc);  
        int g = fc + random.nextInt(bc - fc);  
        int b = fc + random.nextInt(bc - fc);  
        return new Color(r, g, b);  
    }  
	private String pageStr(int totalCount,int pageCountint,int pageIndex){
		StringBuffer pageBar = new StringBuffer("<a name=\"page_href_1\" href=\"tc_1\">首页</a>");
		if (pageIndex <= 1) {
			pageBar.append("<a name='page_href_none'  class='nostyle'>上一页</a>");
		} else {
			pageBar.append("<a name='page_href_" + (pageIndex - 1) + "' href=\"tc_" + (pageIndex - 1) + "\">上一页</a>");
		}
		int all = (totalCount % pageCountint==0) ? (totalCount / pageCountint): (totalCount / pageCountint + 1);
		for (int i = 0; i < all; i++) {
			if((i+1)==pageIndex){
				pageBar.append("<a name='page_href_" + (i + 1) + "'"
						+ " class='currentpage' href=\"tc_" + (i + 1) + "\" >" + (i + 1) + "</a>");
			}else{
				pageBar.append("<a name='page_href_" + (i + 1) + "'"
						+ " class='currentpagenone' href=\"tc_" + (i + 1) + "\">" + (i + 1) + "</a>");
			}
		}
		if (totalCount / pageCountint + 1 == pageIndex) {
			pageBar.append("<a name='page_href_none' class='nostyle'>下一页</a>");
		} else {
			pageBar.append("<a name='page_href_" + (pageIndex + 1) + "' href=\"tc_" + (pageIndex + 1) + "\">下一页</a>");
		}
		pageBar.append("<a name='page_href_" + (totalCount / pageCountint + 1) + "' href=\"tc_" + (totalCount / pageCountint + 1) + "\">末页</a>");
		return pageBar.toString();
	}

	
	/*public CxMessageBoardService getMsgBoardService() {
		return msgBoardService;
	}
	@Resource
	public void setMsgBoardService(CxMessageBoardService msgBoardService) {
		this.msgBoardService = msgBoardService;
	}
	public CxVoteService getVoteService() {
		return voteService;
	}
	@Resource
	public void setVoteService(CxVoteService voteService) {
		this.voteService = voteService;
	}
	public CxNewsService getSevices() {
		return sevices;
	}
	@Resource
	public void setSevices(CxNewsService sevices) {
		this.sevices = sevices;
	}
	public CxTeamService getTeamservice() {
		return teamservice;
	}
	@Resource
	public void setTeamservice(CxTeamService teamservice) {
		this.teamservice = teamservice;
	}*/
}
