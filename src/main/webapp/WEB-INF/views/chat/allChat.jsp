<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>allChat</title>
<style>
    /* 기존 스타일 코드 */

    * {
        margin: 1px;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        background-color: #2b2b2b;
        color: #333;
        display: flex;
        flex-direction: column;
        justify-content: center; 
        background-image: url('/background.png');
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        background-attachment: fixed;
        min-height:100vh;
    }

    .container {
        display: flex;
        justify-content: flex-start; 
        flex-direction: column;
        width: 90%;
        margin: 2rem auto;
        background-color: rgba(0, 0, 0, 0.5 );
        backdrop-filter: blur(3px);
        border-radius: 10px;
        box-shadow: 0 0 8px rgba(255, 255, 255, 1);
        padding: 1rem;
        border: 1px solid rgba(255, 255, 255, 0.3);
        flex-grow: 1;
    }

    .title {
        font-size: 2rem;
        margin: 0 auto 1rem;
        width: 50%;
        color: white;
        padding: 0.5rem 1rem;
        border-top: 1px solid rgba(255, 255, 255, 0.5);
        border-bottom: 1px solid rgba(255, 255, 255, 0.5);
        cursor: pointer;
        border-left: none;
        border-right: none;
        border-radius: 5px;
        background-color: rgba(0, 0, 0, 0.3);
        text-shadow: 0 0 10px rgba(243, 156, 18, 1);
        display: flex;
        justify-content: center; 
        flex-direction: column;
        align-items: center;
    }

    hr {
        border: none;
        width: 100%;
        margin: 2rem 0;
        background: linear-gradient(to right, rgba(255, 255, 255, 0), rgba(255, 255, 255, 0.5), rgba(255, 255, 255, 0));
        height: 2px;
    }

    #chat-box {
        position: relative;
        border: 1px solid rgba(255, 255, 255, 0.3);
        width: 90%;
        height: 400px;
        padding: 10px;
        background-color: rgba(255, 255, 255, 0.2);
        color: #fff;
        margin-bottom: 1rem;
        border-radius: 5px;
        overflow-y: scroll;
        display: flex;
        flex-direction: column;
    }

    #chat-box::-webkit-scrollbar {
        width: 8px;
    }

    #chat-box::-webkit-scrollbar-thumb {
        background-color: rgba(243, 156, 18, 0.8);
        border-radius: 4px;
    }

    #chat-box::-webkit-scrollbar-track {
        background-color: rgba(255, 255, 255, 0.1);
    }

    .message {
        margin-bottom: 1rem;
        display: flex;
        flex-direction: column;
        max-width: 70%;
        word-wrap: break-word; /* 기존 */
        word-break: break-word; /* 추가 */
        white-space: pre-wrap; /* 추가 */
        position: relative;
    }

    .user {
        align-self: flex-end;
    }

    .other {
        align-self: flex-start;
    }

    .sender {
        font-weight: bold;
        color: #f39c12;
        margin-bottom: 5px;
        position: absolute;
        top: -20px;
    }

    .user .sender {
        right: 0;
        text-align: right;
    }

    .other .sender {
        left: 0;
        text-align: left;
    }

    .content {
        padding: 10px;
        color: #fff;
        border-radius: 10px;
        word-wrap: break-word; /* 기존 */
        word-break: break-word; /* 추가 */
        white-space: pre-wrap; /* 추가 */
    }

    .user .content {
        background-color: rgba(0, 0, 0, 0.5);        
        margin-right: 20px; /* 삼각형 너비만큼 마진 추가 */
        box-shadow: 2px 2px 0px rgba(255, 255, 255, 0.5);
        text-shadow: 0 0 10px rgba(243, 156, 18, 1);
    }

    .other .content {
        background-color: rgba(0, 0, 0, 0.5);        
        margin-right: 20px; /* 삼각형 너비만큼 마진 추가 */
        box-shadow: -2px 2px 0px rgba(255, 255, 255, 0.5);
        text-shadow: 0 0 10px rgba(0, 123, 255, 1);
    }
  
    .time {
        font-size: 0.8rem;
        color: #ccc;
        margin-top: 5px;
        margin-bottom: 15px;
    }

    .user .time {
        text-align: right;
        margin-right: 10px;
    }

    .other .time {
        text-align: left;
        margin-left: 10px;
    }

    .chat-input {	    
        width: 90%;
        display: flex;
    }

    .chat-input textarea {
        flex: 1;
        padding: 10px;
        border: 1px solid rgba(255, 255, 255, 0.3);
        border-radius: 5px 0 0 5px;
        background-color: rgba(255, 255, 255, 0.1);
        color: #fff;
        resize: none;
        overflow: hidden;
        white-space: pre-wrap;
    }

    .chat-input button {
        padding: 10px 20px;
        border: none;
        background-color: rgba(100, 100, 100, 0.3);
        box-shadow: 0 0 2px rgba(255, 255, 255, 1);
        text-shadow: 0 0 10px rgba(243, 156, 18, 1);
        color: white;
        border-radius: 0 5px 5px 0;
        cursor: pointer;
    }

    .chat-input button:hover {
        background-color: #e67e22;
    }

</style>
</head>
<body>
   <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <!-- 메인 컨텐츠 -->

<div class="container">

    <div class="title">전국 실시간 채팅</div>
    <hr>
    <div id="chat-box"></div>
    <div class="chat-input">
        <textarea placeholder="메시지를 입력하세요" id="message-input" rows="1"></textarea>
        <button type="button" id="send-btn">전송</button>
    </div>

<script>
	// WebSocket 객체를 선언한다.
	let socket;
	let reconnectAttempts = 0; // 재연결 시도 횟수

	// 페이지가 로드되면 WebSocket 연결을 설정한다.
	window.onload = function() {
	    connectWebSocket();
	};

	function connectWebSocket() {
	    // WebSocket이 이미 열려 있는지 확인 후 연결을 설정한다.
	    if (!socket || socket.readyState === WebSocket.CLOSED || socket.readyState === WebSocket.CLOSING) {
	        socket = new WebSocket("ws://localhost:8081/allChat");
	        socket.onopen = handleOpen;
	        socket.onmessage = handleMessage;
	        socket.onclose = handleClose;
	        socket.onerror = handleError;
	    }
	}

	// 연결이 열렸을 때 호출되는 이벤트 핸들러
	function handleOpen(event) {
	    console.log("WebSocket 연결이 열렸습니다.");
	    reconnectAttempts = 0; // 성공적인 연결 시도 이후 시도 횟수 초기화

	    // 세션에서 사용자 이름을 서버로 전송.
	    const username = "${sessionScope.username}";
	    if (username) {
	        socket.send(JSON.stringify({ mtype: "register", username: username }));
	    } else {
	        console.error("username을 사용할 수 없습니다.");
	    }
	}

	// 메시지 수신 핸들러
	function handleMessage(event) {
	    const data = JSON.parse(event.data);

	    // 수신한 데이터가 배열인지 확인
	    if (Array.isArray(data)) {
	        // 배열인 경우 - 초기 메시지 목록
	        data.forEach(function(message) {
	            displayMessage(message);
	        });
	    } else {
	        // 단일 메시지인 경우
	        displayMessage(data);
	    }

	    // 스크롤을 최신 메시지로 이동
	    const chatBox = document.getElementById("chat-box");
	    chatBox.scrollTop = chatBox.scrollHeight;
	}

	// 메시지를 화면에 표시하는 함수
	function displayMessage(message) {
	    const chatBox = document.getElementById("chat-box");

	    // 메시지 전체를 감싸는 div 생성
	    const messageDiv = document.createElement("div");
	    messageDiv.className = "message";

	    // 메시지의 발신자가 현재 사용자인지 상대방인지에 따라 스타일 적용
	    if (message.sender === "${sessionScope.username}") {
	        messageDiv.classList.add("user"); // 본인 메시지
	    } else {
	        messageDiv.classList.add("other"); // 상대방 메시지
	    }

	    // 발신자 이름 표시
	    const senderDiv = document.createElement("div");
	    senderDiv.className = "sender";
	    senderDiv.textContent = message.sender;

	    // 메시지 내용
	    const contentDiv = document.createElement("div");
	    contentDiv.className = "content";
	    contentDiv.textContent = message.content;

	    // 시간 표시
	    const timeDiv = document.createElement("div");
	    timeDiv.className = "time";
	    timeDiv.textContent = message.messageTime;

	    // 메시지Div에 요소들 추가
	    messageDiv.appendChild(senderDiv);
	    messageDiv.appendChild(contentDiv);
	    messageDiv.appendChild(timeDiv);

	    chatBox.appendChild(messageDiv);
	}

	// WebSocket 연결이 닫혔을 때
	function handleClose(event) {
	    console.log("WebSocket 연결이 닫혔습니다. 재연결 시도 중...");
	    if (reconnectAttempts < 5) {
	        setTimeout(connectWebSocket, 1000); // 1초 후 재연결 시도
	        reconnectAttempts++;
	    } else {
	        console.error("재연결 시도가 최대치를 초과했습니다.");
	    }
	}

	// WebSocket 오류 처리
	function handleError(event) {
	    console.error("WebSocket 오류가 발생했습니다:", event);
	}

	// 전송 버튼을 클릭하면 메시지를 서버로 전송한다.
	document.getElementById("send-btn").addEventListener("click", function() {
	    sendMessage();
	});

	// Enter 키로 메시지 전송 (keyup 이벤트로 수정)
	document.getElementById("message-input").addEventListener("keyup", function(event) {
	    if (event.key === "Enter" && !event.shiftKey) { // Shift+Enter은 줄바꿈
	        event.preventDefault(); // 기본 동작 방지
	        sendMessage();
	    }
	});

	function sendMessage() {
	    const messageInput = document.getElementById("message-input");
	    const message = messageInput.value.trim(); // 공백 제거
	    if (message) {
	        const messageData = JSON.stringify({
	            mtype: "message",
	            sender: "${sessionScope.username}", // 현재 사용자 이름
	            content: message
	        });

	        // WebSocket이 열린 상태일 때만 메시지 전송
	        if (socket.readyState === WebSocket.OPEN) {
	            socket.send(messageData);
	            messageInput.value = ""; // 입력 필드 초기화
	            messageInput.style.height = "auto"; // 텍스트 영역 높이 초기화
	        } else {
	            console.error("WebSocket이 닫혀 있습니다. 현재 상태:", socket.readyState);
	        }
	    } else {
	        console.error("메시지가 비어있습니다.");
	    }
	}

    // 텍스트 영역 자동 높이 조절
    document.getElementById("message-input").addEventListener("input", function() {
        this.style.height = "auto";
        this.style.height = (this.scrollHeight) + "px";
    });
</script>

</body>
</html>



















