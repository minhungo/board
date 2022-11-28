package com.demo.minhun.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpHeaders;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import com.demo.minhun.controller.SocketHandler;


@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer{

	@Autowired
	SocketHandler socketHandler;
	
	//민우형이 만든 전체 채팅방
	
	/*
	 * @Override public void registerWebSocketHandlers(WebSocketHandlerRegistry
	 * registry) { registry.addHandler(socketHandler, "/chating"); } }
	 */
	//소켓 컨피겨 연결부분
   //내가만든 채팅방
	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(socketHandler, "/chating/{roomNumber}");
	}
	
	//----------민우형 코드
	//

	@Bean
	public RestTemplate restTemplate(){
		return new RestTemplate();
	}
	@Bean
	public HttpHeaders httpHeaders(){
		return new HttpHeaders();
	}
}