/*
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
        System.out.println("�꽭�뀡 �깮�꽦");
        ++loginUserCount;
         
        System.out.printf("�깮�꽦�맂 SESSIONID %s \n",  se.getSession().getId());
        System.out.printf("濡쒓렇�씤�맂 �궗�슜�옄 �닔 : %d \n", loginUserCount);
    }
     
    
    
    
    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
       --loginUserCount;
       
       for(int i=0; i<Mycontoller.userList.size(); i++) {                      
           if(Mycontoller.userList.get(i).getSignup_id().equals(se.getSession().getId())) {
              Mycontoller.userList.remove(i);                              
           }
       }
       
        System.out.println("�꽭�뀡 �냼硫�");        
        System.out.printf("�꽭�뀡 �냼硫몃맂 �븘�씠�뵒 SESSIONID %s \n",  se.getSession().getId());
    }
}
*/