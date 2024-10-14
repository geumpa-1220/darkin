package com.example.darkin.websocket;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.lang.NonNull;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.example.darkin.dto.AllChatDto;
import com.example.darkin.service.AllChatService;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;

@Component
public class AllChatSocketHandler extends TextWebSocketHandler{
	
	 // 현재 연결된 세션들을 관리하기 위한 맵입니다. 사용자명을 키로 사용합니다.
	private Map<String,WebSocketSession> sessions = new ConcurrentHashMap<>();
	
	// ObjectMapper 설정 변경
	private ObjectMapper objectMapper = new ObjectMapper()
	    .configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false)
	    .setDateFormat(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"));			
	
	 // 메시지 저장을 위한 서비스 클래스 (의존성 주입 필요)
	private final AllChatService allChatService;
	
    // 생성자를 통해 서비스 클래스 주입
    public AllChatSocketHandler(AllChatService allChatService) {
        this.allChatService = allChatService;
    }

	
	
	
	 // 클라이언트와의 연결이 성립되었을 때 호출되는 메서드입니다.(afterConnectionEstablished 연결 설정후)
	@Override
	public void afterConnectionEstablished(@NonNull WebSocketSession session) throws Exception{
		System.out.println("새로운 세션이 연결되었습니다:"+session.getId());

	}

	 // 클라이언트로부터 메시지를 수신했을 때 호출되는 메서드입니다.
	@Override
	protected void handleTextMessage(@NonNull WebSocketSession session,@NonNull TextMessage message) throws Exception{
        // 수신한 메시지를 콘솔에 출력합니다.
        System.out.println("수신한 메시지: " + message.getPayload());

        // 수신한 메시지를 JSON으로 파싱합니다.
        JsonNode node = objectMapper.readTree(message.getPayload());
        String mtype = node.get("mtype").asText();
        
       // 메시지 타입에 따라 처리를 분기합니다.
       if ("register".equals(mtype)) {
    	// 사용자를 등록하는 로직입니다.
    	   String username = node.get("username").asText();
    	// 사용자명을 세션에 저장합니다.
    	   session.getAttributes().put("username", username);
    	   // 사용자명을 키로 세션을 맵에 저장합니다.
    	   sessions.put(username, session);
    	   System.out.println("사용자 등록:"+username);
    	   
    	    // 여기에서 이전 메시지를 해당 세션에 전송합니다.
    	    List<AllChatDto> allChatDto = allChatService.selectAllMessage();
    	    String msg = objectMapper.writeValueAsString(allChatDto);
    	    if (session.isOpen()) {
    	        session.sendMessage(new TextMessage(msg));
    	    }
       }
       else if("message".equals(mtype)) {
    	// 채팅 메시지를 처리하는 로직입니다.
    	   String sender = node.get("sender").asText();
    	   String content = node.get("content").asText();
    	   
    	// AllChatDto 객체 생성 및 데이터 설정
    	   AllChatDto chatMessage = new AllChatDto();
    	   chatMessage.setSender(sender);
    	   chatMessage.setContent(content);
    	   chatMessage.setMessageTime(new Timestamp(System.currentTimeMillis()));
    	   // 메시지를 데이터베이스에 저장
    	   allChatService.saveMessage(chatMessage);
    	   
           // 저장된 메시지에 ID와 시간 정보가 추가되었으므로 다시 가져옴
           // JSON으로 변환하여 클라이언트에게 전송
    	   String msg = objectMapper.writeValueAsString(chatMessage);
    	// 전송 전에 메시지 내용을 로그로 출력
    	   System.out.println("전송할 메시지 내용: " + msg);

           // 모든 연결된 세션에 메시지를 브로드캐스트합니다.
           for (WebSocketSession s : sessions.values()) {
        	// 연결이 열려있는 경우에만 메시지를 전송합니다.
        	   if (s.isOpen()) {
        		   // 메시지를 JSON 형태로 생성합니다.
        		   s.sendMessage(new TextMessage(msg));
        	   }   
           }
       }
       else {
    	// 알 수 없는 메시지 타입인 경우 처리합니다.
    	   System.out.println("알 수 없는 메시지 타입 입니다."+ mtype);
       }    
	}
	
	 // 클라이언트와의 연결이 종료되었을 때 호출되는 메서드입니다.
	@Override
	public void afterConnectionClosed(@NonNull WebSocketSession session ,@NonNull CloseStatus status) throws Exception{
		// 세션에서 사용자명을 가져옵니다.
		String username = (String) session.getAttributes().get("username");
		// 맵에서 세션을 제거합니다.
		if (username != null) {
			sessions.remove(username);
			System.out.println("사용자 연결 종료:" + username);
		}
        // 연결 종료를 콘솔에 출력합니다.
        System.out.println("세션이 종료되었습니다: " + session.getId());
	}
	
	 // 통신 중 에러가 발생했을 때 호출되는 메서드입니다.
	@Override
	public void handleTransportError(@NonNull WebSocketSession session,@NonNull Throwable exception) throws Exception{
        // 에러 내용을 콘솔에 출력합니다.
        System.err.println("전송 중 오류가 발생했습니다: " + exception.getMessage());
	}
}


















