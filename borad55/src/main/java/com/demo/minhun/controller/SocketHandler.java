package com.demo.minhun.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;


@Component
public class SocketHandler extends TextWebSocketHandler{
	/*
	 * HashMap<String, WebSocketSession> sessionMap = new HashMap<>(); //웹소켓 세션을 담아둘
	 * 맵
	 */	
	List<HashMap<String, Object>> rls = new ArrayList<>();
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) {
		//메시지 발송
		String msg = message.getPayload();
		JSONObject obj = jsonToObjectParser(msg);
		
		String rN = (String) obj.get("roomNumber");
		HashMap<String, Object> temp = new HashMap<String, Object>();
		if(rls.size() > 0) {
			for(int i=0; i<rls.size(); i++) {
				String roomNumber = (String) rls.get(i).get("roomNumber"); //세션리스트의 저장된 방번호를 가져와서
				if(roomNumber.equals(rN)) { //같은값의 방이 존재한다면
					temp = rls.get(i); //해당 방번호의 세션리스트의 존재하는 모든 object값을 가져온다.
					break;
				}
			}
			
			//해당 방의 세션들만 찾아서 메시지를 발송해준다.
			for(String k : temp.keySet()) { 
				if(k.equals("roomNumber")) { //다만 방번호일 경우에는 건너뛴다.
					continue;
				}
				
				WebSocketSession wss = (WebSocketSession) temp.get(k);
				if(wss != null) {
					try {
						wss.sendMessage(new TextMessage(obj.toJSONString()));
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
	}
	//@SuppressWarnings은경고를 제외시킬 때 사용함
	@SuppressWarnings("unchecked")
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//소켓 연결
		super.afterConnectionEstablished(session);
		boolean flag = false;
		String url = session.getUri().toString();
		System.out.println(url);
		String roomNumber = url.split("/chating/")[1];
		int idx = rls.size(); //방의 사이즈를 조사한다.
		if(rls.size() > 0) {
			for(int i=0; i<rls.size(); i++) {
				String rN = (String) rls.get(i).get("roomNumber");
				if(rN.equals(roomNumber)) {
					flag = true;
					idx = i;
					break;
				}
			}
		}
		
		if(flag) { //존재하는 방이라면 세션만 추가한다.
			HashMap<String, Object> map = rls.get(idx);
			map.put(session.getId(), session);
			
		}else { //최초 생성하는 방이라면 방번호와 세션을 추가한다.
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("roomNumber", roomNumber);
			map.put(session.getId(), session);
			rls.add(map);
		}
		
		//세션등록이 끝나면 발급받은 세션ID값의 메시지를 발송한다.
		JSONObject obj = new JSONObject();
		obj.put("type", "getId");
		obj.put("sessionId", session.getId());
		session.sendMessage(new TextMessage(obj.toJSONString()));
	}

	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		//소켓 종료
		if(rls.size() > 0) { //소켓이 종료되면 해당 세션값들을 찾아서 지운다.
			for(int i=0; i<rls.size(); i++) {
				rls.get(i).remove(session.getId());
			}
		}
		super.afterConnectionClosed(session, status);
	}
	
	private static JSONObject jsonToObjectParser(String jsonStr) {
		JSONParser parser = new JSONParser();
		JSONObject obj = null;
		try {
			obj = (JSONObject) parser.parse(jsonStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return obj;
	}
}

/*1. 세션을 관리하던 map객체에서 list, hashmap형태로 변경되었습니다. hashmap의 value자료형도 WebSocketSession에서 Object형으로 변경되었습니다.

2. 세션을 저장할때, 현재 접근한 방의 정보가 있는지 체크하고 존재하지 않으면 방의 번호를 입력 후 세션들을 담아주는 로직으로 변경됨.

3. 마찬가지로 종료시에도 list컬랙션을 순회하면서 해당 키값의 세션들을 삭제하도록 변경됨.

4. 메시지를 발송하는 handleTextMessage메소드에서는 현재의 방번호를 가져오고 
방정보+세션정보를 관리하는 rls리스트 컬랙션에서 데이터를 조회한 후에
 해당 Hashmap을 임시 맵에 파싱하여 roomNumber의 키값을 제외한 모든 세션키값들을 웹소켓을 통해 메시지를 보내줌.*/

 
