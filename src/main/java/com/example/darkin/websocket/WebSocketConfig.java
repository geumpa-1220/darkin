package com.example.darkin.websocket;

import org.springframework.context.annotation.Configuration;
import org.springframework.lang.NonNull;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer{
	
	// AllChatSocketHandler를 주입받기 위한 필드입니다.
	private final AllChatSocketHandler allChatSocketHandler;
	private final MateSocketHandler mateSocketHandler;
	private final GroupChatHandler groupChatHandler;
	// 생성자를 통해 AllChatSocketHandler를 주입받습니다.
	public WebSocketConfig(AllChatSocketHandler allChatSocketHandler , MateSocketHandler mateSocketHankler , GroupChatHandler groupChatHandler) {
		this.allChatSocketHandler=allChatSocketHandler;
		this.mateSocketHandler=mateSocketHankler;
		this.groupChatHandler=groupChatHandler;
	}
	
	// WebSocket 핸들러를 등록하는 메서드입니다.
	@Override
	public void registerWebSocketHandlers(@NonNull WebSocketHandlerRegistry registry) {
		// "/allChat" 경로로 들어오는 WebSocket 요청을 AllChatSocketHandler로 처리하도록 등록합니다.
		registry.addHandler(allChatSocketHandler, "/allChat")
		// 모든 도메인에서의 요청을 허용합니다.
		.setAllowedOrigins("*");
		
        // "/myMate" 경로로 들어온 WebSocket 요청을 MateSocketHandler로 처리하도록 등록합니다.
        registry.addHandler(mateSocketHandler, "/myMate")
                .setAllowedOrigins("*");
        
        //"groupChat" 경로로 들어온 WebSocket 요청을 GroupChatHandler로 처리.
        registry.addHandler(groupChatHandler, "/groupChat")
                .setAllowedOrigins("*");
	}
	
	

}
