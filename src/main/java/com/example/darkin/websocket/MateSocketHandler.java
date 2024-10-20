package com.example.darkin.websocket;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.lang.NonNull;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.example.darkin.dto.MyMateDto;
import com.example.darkin.service.MyMateService;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Component
public class MateSocketHandler extends TextWebSocketHandler {
	
	private final Map<String, WebSocketSession> activeSessions = new ConcurrentHashMap<>();
	private final ObjectMapper objectMapper = new ObjectMapper();
	private final MyMateService myMateService; // 메시지 저장을 위한 서비스 클래스

	// 생성자를 통해 서비스 클래스 주입
	public MateSocketHandler(MyMateService myMateService) {
		this.myMateService = myMateService;
	}
	
	@Override
	public void afterConnectionEstablished(@NonNull WebSocketSession session) throws Exception {
		// 연결이 열렸을 때 사용자 이름을 맵에 저장한다.
		System.out.println("새로운 세션이 연결되었습니다: " + session.getId());
	}
	
	// 클라이언트로부터 메시지를 수신했을 때 호출되는 메서드입니다.
	@Override
	protected void handleTextMessage(@NonNull WebSocketSession session, @NonNull TextMessage message) throws Exception {
	    try {
	        JsonNode node = objectMapper.readTree(message.getPayload());
	        String type = node.get("type").asText();
	        String sender = node.get("sender").asText();

	        if ("register".equals(type)) {
	            session.getAttributes().put("username", sender);
	            activeSessions.put(sender, session);
	            System.out.println("사용자 등록: " + sender);
	        } else if ("message".equals(type)) {
	            int roomId = node.get("roomId").asInt();
	            String mate = node.get("mate").asText();
	            String content = node.get("content").asText();

	            MyMateDto mateDto = new MyMateDto();
	            mateDto.setRoomId(roomId);
	            mateDto.setSender(sender);
	            mateDto.setMate(mate);
	            mateDto.setContent(content);

	            myMateService.insertMessage(mateDto);

	            // 상대방 사용자에게 메시지 전송
	            WebSocketSession mateSession = activeSessions.get(mate);
	            if (mateSession != null && mateSession.isOpen()) {
	                mateSession.sendMessage(new TextMessage(objectMapper.writeValueAsString(mateDto)));
	            } else {
	                System.out.println("상대방 사용자가 현재 접속해 있지 않습니다: " + mate);
	            }

	            if (myMateService.selectMateRoom(mate, sender) == null) {
	                myMateService.insertMateRoom(mate, sender);
	            }


	            // 발신자에게도 메시지 전송 (본인 확인용)
	            session.sendMessage(new TextMessage(objectMapper.writeValueAsString(mateDto)));
	        } else {
	            System.err.println("알 수 없는 메시지 타입: " + type);
	        }
	    } catch (Exception e) {
	        System.err.println("메시지 처리 중 오류 발생: " + e.getMessage());
	        e.printStackTrace();
	    }
	}

    @Override
    public void afterConnectionClosed(@NonNull WebSocketSession session, @NonNull CloseStatus status) throws Exception {
        // 연결이 닫혔을 때 해당 세션을 맵에서 제거합니다.
        String sender = (String) session.getAttributes().get("username");
        if (sender != null) {
            activeSessions.remove(sender);
            System.out.println("세션이 제거되었습니다: " + sender);
        } else {
            System.out.println("세션 제거 중 키가 null입니다.");
        }
    }
}



















