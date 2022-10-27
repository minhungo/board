package com.demo.minhun;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demo.minhun.dao.IBoardDAO;
import com.demo.minhun.dao.IReplyDAO;
import com.demo.minhun.dao.LikeDAO;
import com.demo.minhun.dao.SignupDAO;
import com.demo.minhun.dto.signupDTO;
import java.util.List;

//로그인 컨트롤러

@Controller
public class loginController {

	

	@Autowired
	LikeDAO LikeDAO;

	@Autowired
	SignupDAO sigupDAO;
	
	@Autowired 
	IBoardDAO IBoardDAO;
	
	@Autowired
	IReplyDAO IReplyDAO;
	
	
	signupDTO user;
	
	public static List<signupDTO> userList=new ArrayList<signupDTO>();    
	
	
	
	
	//로그인
	@GetMapping("/signin")
	public String t2() {
		return "signin";
	}
	

	@RequestMapping("/log_action") // 로그인 액션
    @ResponseBody
    public String 
             signin(
             @RequestParam("login_id") String signup_id, 
             @RequestParam("login_pw") String signup_pw,
             HttpServletRequest request,
             HttpServletResponse response ,
             HttpSession httpSession,
             String and_sanction, 
             String str_sanctions, 
             String ture_sanction, 
             String signup_num) {
		
      response.setContentType("text/html; charset=UTF-8");
      
          HttpSession session=request.getSession();
    
          user = sigupDAO.login(signup_id, signup_pw); // 모든 데이터 값을 가져옴 user는 singupDTO 타입 
               
         LocalDate localDate = LocalDate.now();
       
        System.out.println(localDate+"현재시간");
    
       try {
          
          if ("admin".equals(user.getSignup_id())) {
             
             user.setUserLogin(true);
          
             session.setMaxInactiveInterval(6000);
             session.setAttribute("profile", user);
             return "<script>let t = confirm(\"반갑습니다 관리자님!! 관리자 페이지로 이동하시겠습니까?\");" + 
                   "   if (t) {" + 
                   "      location.href='/admin';" + 
                   "   }else{"
                   + " location.href='/';}</script>";
          } 
                    
          
           if(user != null) {
        	   
        	 
        	   for(int i=0; i<userList.size(); i++) {                      
                   if(userList.get(i).getSignup_id().equals(user.getSignup_id())) {
                       userList.remove(i);                              
                   }  
               }
        	   
        	   
              session.setAttribute("profile", user);
              
               signupDTO usercheck = (signupDTO) session.getAttribute("profile");
               

                //계정 정지 마지막날
                LocalDate and = usercheck.getAnd_sanctions();
                
                //계정 정지 당한 날
                LocalDate str = usercheck.getStr_sanctions();
    
                
                System.out.println(and+""+"정지날짜");
                

                 if (localDate.isBefore(and)) {
                    
                     
                     request.setAttribute("msg_str", str);
                     request.setAttribute("msg_and", and);
                    request.setAttribute("url", "/signin");
   
            return "<script> location.href='/alert'; </script>";
                
                } 

           //시간이 지나면 계정이 자동 정지 해제 밑 접속자가 접속할때마다 현재시간으로 디폴트 업데이트
                 
           sigupDAO.sanctionsOnlock(str_sanctions,and_sanction,ture_sanction,signup_num);
 
            user.setUserLogin(true);
            session.setAttribute("profile", user);
            session.setMaxInactiveInterval(1200);
            userList.add(user);     
            
            for(int i=0; i<userList.size();i++) {
            	signupDTO a;
                for(int j=0; j<userList.size();j++) {
                   if(userList.get(i).getSignup_point()>userList.get(j).getSignup_point()) {
                      a=userList.get(i);   
                      userList.set(i,userList.get(j));
                      userList.set(j, a);
                   }   
                }
             }
            
            
            session.setAttribute("connectUser", userList);
                
             return "<script>alert('로그인 성공'); location.href='/board'; </script>";
             
           	}
        
          
             }catch(Exception e){
                e.printStackTrace();
             }
       			return "<script>alert('로그인 실패'); location.href='/signin'; </script>";
          	 }
          // log_action    
	
	
	
	
	
	
	
	//로그인 됬을때 정지유저 사유,기간을 표시하는 얼라창 컨트롤러
	
    @RequestMapping("alert")
    
    public String alert (HttpSession httpSession, HttpServletRequest request) {
       
       HttpSession session=request.getSession();
       session.setAttribute("profile", user);
        
        
         signupDTO usercheck = (signupDTO) session.getAttribute("profile");
       

           //계정 정지 마지막날
         LocalDate and = usercheck.getAnd_sanctions();
         
         //계정 정지 당한 날
         LocalDate str = usercheck.getStr_sanctions();
         
         //정지 사유
            String true_san =usercheck.getTrue_sanctions();
         
         System.out.println(and+""+"정지날짜");
         
       
        request.setAttribute("msg_str", str);
        request.setAttribute("msg_and", and);
        request.setAttribute("msg_san",true_san);
       request.setAttribute("url", "/signin");
       
       return "alert";
    }
 
	
}
