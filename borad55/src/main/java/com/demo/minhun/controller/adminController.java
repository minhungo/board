package com.demo.minhun.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import com.demo.minhun.Util.AdminChartUtil;
import com.demo.minhun.dao.*;
import com.demo.minhun.dto.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


//占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 
@Controller
public class adminController {

	@Autowired
	LikeDAO LikeDAO;

	@Autowired
	SignupDAO sigupDAO;
	
	@Autowired 
	IBoardDAO IBoardDAO;
	
	@Autowired
	IReplyDAO IReplyDAO;

	@Autowired
	CoinDAO coinDAO;

	@Autowired
	CountDAO countDAO;
	
	
	signupDTO user;
	
	public static List<signupDTO> userList=new ArrayList<signupDTO>();    
	
	
	
    //회占쏙옙占쏙옙 占쌜쇽옙占쏙옙 占쌉쏙옙占쏙옙 占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 
	 @RequestMapping(value = "/admin", method = RequestMethod.GET)
	   public String admin (Model model, @ModelAttribute("scri") SearchCriteria scri,
	   @RequestParam(value = "page", defaultValue = "1") String page ,@RequestParam(value = "bgno" ,defaultValue = "1")int bgno) throws Exception {
	      
	      List<BoardDTO> list = IBoardDAO.list(scri);
	      
	      model.addAttribute("list", IBoardDAO.list(scri));
	      PageMaker pageMaker = new PageMaker();
	      pageMaker.setCri(scri);
	      pageMaker.setTotalCount(IBoardDAO.listCount(scri));

	      model.addAttribute("pageMaker", pageMaker);

	      return "admin";
	   }

	@PostMapping("/getUserChargeRecord")
	@ResponseBody
	public Map<String, Object> getRecord() {
		 Map<String, Object> map = new HashMap<String, Object>();

		 // polarArea 에서 사용할 payAmount 통계값
		 List<getAllUserRecordDTO> allUserChargeRecord = coinDAO.AllUserChargeRecord();
		 AdminChartUtil adminChartUtil = new AdminChartUtil();
		 ArrayList<Integer> record = adminChartUtil.getRecord(allUserChargeRecord);
		 map.put("polarArea", record);

		 // 가입 경로 통계
		 List<getCountDTO> getSingupData = countDAO.getSingupData();
		 map.put("SingupData", getSingupData);

		 // 전체 사용자 중 글 또는 댓글을 한 번이라도 작성한 사용자 비율
		 getCountDTO getRatio = countDAO.RatioCalculator();
		 map.put("getRatio",getRatio);

		 // 최근 일주일 동안 생성된 글,댓글 수
		 List<getCountDTO> getBoardCount = countDAO.getSevenDaysBoardCount();
		 List<getCountDTO> getReplyCount = countDAO.getSevenDaysReplyCount();
		 map.put("getBoardCount",getBoardCount);
		 map.put("getReplyCount",getReplyCount);

		 return map;

	}

	@GetMapping("/getLookerStudio")
	public String getAdminReport(Model model){

		Map<String, Object> map = new HashMap<String, Object>();
		AdminChartUtil adminChartUtil = new AdminChartUtil();

		getCountDTO getTotalCount = countDAO.getTotalCount();
		map.put("getTotalCount",getTotalCount);

		List<getCountDTO> getSignupDataCnt = countDAO.getSignupDataCnt();
		map.put("getSignupDataCnt",getSignupDataCnt);

		List<getCountDTO> getSignupGradeCnt = countDAO.getSignupGradeCnt();
		map.put("getSignupGradeCnt",getSignupGradeCnt);

		List<getCountDTO> getViewCntOrderByHit = countDAO.getViewCntOrderByHit();
		map.put("getViewCntOrderByHit",getViewCntOrderByHit);

		// map에 있는 data를 csv 파일로 저장
		adminChartUtil.createCSV(map);

		return "getLookerStudio";
	}
	 
	 
	 
	 
	 
	 //占쏙옙占쏙옙占쏙옙 회占쏙옙 占쏙옙占�
     @RequestMapping(value = "/adminpro", method = RequestMethod.GET)
     public String adminpro (Model model, @ModelAttribute("scri") SearchCriteria scri,
     @RequestParam(value = "page", defaultValue = "1") String page) throws Exception {
        
        List<signupDTO> list = sigupDAO.signuplist(scri);
        
        model.addAttribute("signuplist", list);
        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(scri);
        pageMaker.setTotalCount(sigupDAO.signupCount(scri));
        model.addAttribute("pageMaker", pageMaker);
        
        return "adminpro";
     }

     
     
     
     
 	@RequestMapping(value = "/userInformation", method = RequestMethod.GET)
 	public String userInformation(@RequestParam("signup_num") String signup_num, @RequestParam("signup_id") String signup_id, Model model,
 			HttpServletRequest request, @RequestParam(value = "page", defaultValue = "1") String page,
 			@ModelAttribute("scri") SearchCriteria scri) {

 		scri.getKeyword();
 		model.addAttribute("page", page);

		String curCoin = String.valueOf((coinDAO.getMyCurrentCoinById(signup_id)/100));
		model.addAttribute("curCoin",curCoin);

 		signupDTO signup = sigupDAO.signupview(signup_num);
 		model.addAttribute("signup", signup);

 		return "userInformation";
 	}
 	
 	
 	
 	
 	
 	
 //占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 회占쏙옙 탈占쏙옙
	@RequestMapping("/deleteSignupaction")
	@ResponseBody
	public String deleteSignupaction(@RequestParam("signup_num") String signup_num, HttpServletRequest request,
			Model model, @ModelAttribute("scri") SearchCriteria scri,
			@RequestParam(value = "page", defaultValue = "1") String page) {

		sigupDAO.deleteSignup(signup_num);

		return "<script>alert('회占쏙옙占쏙옙 탈占쏙옙 占실억옙占쏙옙占싹댐옙'); location.href='/adminpro'; opener.parent.location=\"adminpro\"; window.close();</script>";
	}
		 
	
	
	
	
	
	
	 // 관리자 페이지 신고자당한 유저 명단 리스트
	 @RequestMapping(value = "/userReportlist", method = RequestMethod.GET)
	 public String userReportlist(
			 		 Model model, 
			 		 @ModelAttribute("scri") SearchCriteria scri,
	                 @RequestParam(value = "page", defaultValue = "1") String page)throws Exception {
	      
	       	List<signupDTO> list = sigupDAO.userReportlist(scri);
	        model.addAttribute("list", list);
	        PageMaker pageMaker = new PageMaker();
	        pageMaker.setCri(scri);
	        pageMaker.setTotalCount(IBoardDAO.reportCount(scri));
	        model.addAttribute("pageMaker", pageMaker);
	     
	      return "userReportlist";
	   }
	 
	 
	 //占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占신곤옙占� 占쌉시뱄옙 占쏙옙占쏙옙트 占쏙옙트占싼뤄옙
	 @RequestMapping(value = "/adminreport", method = RequestMethod.GET)
     public String adminreport (Model model, @ModelAttribute("scri") SearchCriteria scri,
     @RequestParam(value = "page", defaultValue = "1") String page,@RequestParam(value = "bgno" ,defaultValue = "0")int bgno) throws Exception {
        
        List<BoardDTO> list = IBoardDAO.reportlist(scri);
        model.addAttribute("list", list);
        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(scri);
        pageMaker.setTotalCount(IBoardDAO.reportCount(scri));
        model.addAttribute("pageMaker", pageMaker);
        return "adminreport";
	 }
	 
	 
	 
	 
	 
	 
	 //占쏙옙占쏙옙 占쏙옙占쏙옙창 占쏙옙트占싼뤄옙
	 @RequestMapping(value = "sanctions" ,method = RequestMethod.GET)
	   public String sanctions(Model model, @RequestParam("signup_num")int signup_num) {
	      //占쏙옙占쏙옙 占시곤옙
	      
	      Calendar cal = Calendar.getInstance();
	      cal.setTime(new Date());
	   
	      //占쏙옙占쏙옙챨占� 占쏙옙占쏙옙 3占쏙옙 ,7占쏙옙 ,30占쏙옙 占쏙옙 占쏙옙占싹댐옙 占쌉쇽옙
	      Calendar cal3 = Calendar.getInstance();
	      Calendar cal7 = Calendar.getInstance();
	      Calendar cal30 = Calendar.getInstance();
	      
	      
	      cal.add(Calendar.DATE, 0);
	      cal3.add(Calendar.DATE, 3);
	      cal7.add(Calendar.DATE, 7);
	      cal30.add(Calendar.DATE, 30);
	      
	      DateFormat df0 = new SimpleDateFormat("yyyy/MM/dd");
	      DateFormat df3 = new SimpleDateFormat("yyyy/MM/dd");
	      DateFormat df7 = new SimpleDateFormat("yyyy/MM/dd");
	      DateFormat df30 = new SimpleDateFormat("yyyy/MM/dd");
	      
	      String strDate0 = df0.format(cal.getTime());
	      String strDate3 = df3.format(cal3.getTime());   
	      String strDate7 = df7.format(cal7.getTime());
	      String strDate30 = df30.format(cal30.getTime());
	   
	   
	      model.addAttribute("strDate3",strDate3);
	      model.addAttribute("strDate7",strDate7);
	      model.addAttribute("strDate30",strDate30);
	      System.err.println(strDate3);
	      System.err.println(strDate7);
	      System.err.println(strDate30);
	   
	      model.addAttribute("signup_num",signup_num);

	      return "sanctions";
	   }
	 
	 
	 
	 
	 
	 
	 //占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙트占싼뤄옙
	  @RequestMapping(value = "sanctionsAction",method = RequestMethod.POST)
	  @ResponseBody
	   public String sanctionsAction(
			   @RequestParam("str_sanctions") String str_sanctions,
			   @RequestParam("and_sanctions")String and_sanctions,
			   @RequestParam("signup_num") String signup_num,
			   @RequestParam("true_sanctions")String true_sanctions) {
	      
	      System.out.println(signup_num);
	      System.out.println(str_sanctions);
	      System.out.println(and_sanctions);
	      System.out.println(true_sanctions);

	      sigupDAO.sanctionsDTO(str_sanctions,and_sanctions,true_sanctions,signup_num);

	      return "<script>alert('占쏙옙占쏙옙 占실억옙占쏙옙占싹댐옙');window.close();</script>";
	   }
	 
	  

	  
	  //제제된 유저들 명단 리스트 컨트롤러
	  @RequestMapping(value = "/sanctionslist", method = RequestMethod.GET)
	     public String sanctionslist (Model model, @ModelAttribute("scri") SearchCriteria scri,
	     @RequestParam(value = "page", defaultValue = "1") String page) throws Exception {
	        
	        List<signupDTO> list = sigupDAO.sanctionslist(scri);
	        model.addAttribute("list", list);
	        PageMaker pageMaker = new PageMaker();
	        pageMaker.setCri(scri);
	        model.addAttribute(page);
	        pageMaker.setTotalCount(sigupDAO.signupCount2(scri));
	        model.addAttribute("pageMaker", pageMaker);
	        return "sanctionslist";
	        
	
	    }
	 
	 
	 
 		 
  

}
