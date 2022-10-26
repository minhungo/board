package com.demo.minhun.config;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.demo.minhun.Mycontoller;

@WebListener
public class LoginImpl  implements HttpSessionListener  {
    
    String id;
    String nickname;
    String sessionid;
    public static int loginUserCount=0;
         
     
    public LoginImpl() {
     
    }
     
    public LoginImpl(String id,String nickname, String sessionid) {
        this.id=id;
        this.nickname=nickname;
        this.sessionid=sessionid;
    }
     
     
     
    @Override
    public void sessionCreated(HttpSessionEvent se) {
        System.out.println("세션 생성");
        ++loginUserCount;
         
        System.out.printf("생성된 SESSIONID %s \n",  se.getSession().getId());
        System.out.printf("로그인된 사용자 수 : %d \n", loginUserCount);
    }
     
    
    
    
    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
       --loginUserCount;
       
       for(int i=0; i<Mycontoller.userList.size(); i++) {                      
           if(Mycontoller.userList.get(i).getSignup_id().equals(se.getSession().getId())) {
              Mycontoller.userList.remove(i);                              
           }
       }
       
        System.out.println("세션 소멸");        
        System.out.printf("세션 소멸된 아이디 SESSIONID %s \n",  se.getSession().getId());
    }
}