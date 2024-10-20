<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myMate</title>
<style>
	/* 기본 스타일 유지 */
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
	    justify-content: flex-start; /* 상단 정렬 */
	    background-image: url('/background.png');
	    background-size: cover;
	    background-position: center;
	    background-repeat: no-repeat;
	    background-attachment: fixed;
	    min-height: 100vh;
	}

	.container {
		display: flex;
		flex-direction: column;
		width: 90%;
		margin: 2rem auto;
		background-color: rgba(0, 0, 0, 0.5);
		backdrop-filter: blur(3px);
		border-radius: 10px;
		box-shadow: 0 0 8px rgba(255, 255, 255, 1);
		padding: 1rem;
		border: 1px solid rgba(255, 255, 255, 0.3);
		flex-grow: 1;
		height: 100%; /* 추가: 부모의 전체 높이 차지 */
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

	.content-wrapper {
	    display: flex;
	    flex-direction: row;
	    width: 100%;
	    gap: 0.5rem;
		flex-grow: 1; /* 남은 공간을 모두 차지 */
		height: 100%; /* 부모의 전체 높이 차지 */
		align-items: stretch; /* 자식 요소들이 동일한 높이를 가지도록 */
	}

	.sidebar {
	    width: 20%;
	    background-color: rgba(0, 0, 0, 0.7);
	    border-radius: 10px;
	    display: flex;
	    flex-direction: column;
	    padding: 0.2rem;
	    
	}

	.menu-item {
	    font-size: 1.5rem;
	    color: white;
	    margin: 0.5rem;
	    text-align: center;
	    text-shadow: 0 0 5px rgba(255, 255, 255, 0.7);
	    padding: 0.5rem 0; /* 패딩 추가 */
	    border-radius: 5px;
	}

	.scrollable-list {
	    flex: 1;
	    border-radius: 5px;
	    background-color: rgba(255, 255, 255, 0.05); /* 스크롤 영역 배경 추가 */
	    padding: 0.2rem;
	    width: 100%;
	    text-align: center;
	    overflow-y: auto; /* 스크롤 가능하도록 설정 */
	}

	.scrollable-list ul {
	    list-style: none;
	    padding: 0;
	    margin: 0;
	}

	.dynamic-list {
	    min-height: 200px; /* 최소 높이 설정 */
	    display: flex;
	    flex-direction: column; /* 위에서 아래로 나열 */
	    justify-content: flex-start; /* 위쪽부터 정렬 */
	    align-items: stretch;
	    color: rgba(255, 255, 255, 0.9); /* 텍스트 색상을 좀 더 선명하게 */
	    height: 100%;
	    width: 100%;
	}

	.placeholder {
	    color: rgba(255, 255, 255, 0.6);
	    text-align: center;
	    width: 100%;
	    padding: 0.5rem 0;
	}

	.dynamic-list li {
	    display: block; /* 리스트 아이템을 블록 요소로 설정 */
	    padding: 0.5rem;
	    margin-bottom: 0.2rem;
	    text-align: center;
	    background-color: rgba(255, 255, 255, 0.1); /* 리스트 배경 색상 추가 */
	    border-radius: 5px;
	    transition: background-color 0.3s ease; /* 부드러운 배경 전환 효과 */
	}

	.dynamic-list li:hover {
	    background-color: rgba(243, 156, 18, 0.8); /* 마우스 호버 시 배경 색상 변경 */
	    cursor: pointer; /* 포인터 커서로 변경 */
	}




	#chat-section {
	    flex: 1;
	    display: flex;
	    flex-direction: column;
	}

	#chat-box {
	    position: relative;
	    border: 1px solid rgba(255, 255, 255, 0.3);
	    width: 100%;
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
		  font-weight: bold;
		  color: #f39c12;
		  position: absolute; /* 절대 위치로 설정 */
		  top: -20px; /* 메시지 상단에서의 위치 */
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
	    width: 100%;
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

	/* 반응형 디자인 */
	@media (max-width: 800px) {
	    .content-wrapper {
	        flex-direction: column; /* 모바일에서는 세로로 배치 */
	        flex-grow: 0; /* 높이 자동 조정 */
	    }

	    .sidebar {
	        width: 100%;
	        height: auto; /* 높이 자동 조정 */
	    }

	    #chat-box {
	        height: 300px;
	    }
	}
</style>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <!-- 메인 컨텐츠 -->

    <div class="container">
        <div class="title">${room.mate}</div>
        <hr>
        <div class="content-wrapper"> <!-- 새로운 래퍼 시작 -->
            <div class="sidebar">
                <div class="menu-item">채팅방</div>
                <div class="scrollable-list">
                    <ul class="dynamic-list">
                        <c:if test="${empty roomList}">
                            <li class="placeholder">채팅방이 없습니다.</li>
                        </c:if>
                        <c:forEach var="rooms" items="${roomList}">
                            <li onclick="location.href='/chat/myMate?mate=${rooms.mate}'">${rooms.mate}</li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <div id="chat-section"> <!-- 새로운 채팅 섹션 시작 -->
				<div id="chat-box">
				    <c:forEach var="message" items="${messages}">
				        <div class="message ${message.sender == sessionScope.username ? 'user' : 'other'}">
				            <div class="sender">${message.sender}</div>
				            <div class="content">${message.content}</div>
				            <div class="time">${message.sentTime}</div>
				        </div>
				    </c:forEach>
				</div>

                <div class="chat-input">
                    <textarea placeholder="메시지를 입력하세요" rows="1"></textarea>
                    <button type="button" >전송</button>
                </div>
            </div>
        </div> <!-- 새로운 래퍼 끝 -->
    </div>

<script>
	// WebSocket 객체를 선언한다.
	let socket;
	let reconnectAttempts = 0; // 재연결 시도 횟수
	
	// 현재 접속한 사용자 정보 (서버에서 전달받아야 함)
	const userName="${sessionScope.username}";
	// URL 파라미터로 전달된 상대방 사용자 이름
	const mateName='${param.mate}' || null;;
	const roomId=${room.id};
	// WebSocket 연결
	 	
	const chatBox = document.getElementById('chat-box');
	const messageDiv = document.getElementsByClassName("message");
	const senderDiv = document.getElementsByClassName("sender");
	const contentDiv = document.getElementsByClassName("content");
	const timeDiv = document.getElementsByClassName("time");
	const messageInput = document.querySelector('.chat-input textarea');
	const sendButton = document.querySelector('.chat-input button');
	const dynamicList = document.querySelector('.dynamic-list');
	
	// 페이지가 로드되면 WebSocket 연결을 설정한다.
		window.onload = function() {
		    connectWebSocket();
		};
		
		function connectWebSocket() {
		    // WebSocket이 이미 열려 있는지 확인 후 연결을 설정한다.
		    if (!socket || socket.readyState === WebSocket.CLOSED || socket.readyState === WebSocket.CLOSING) {
				socket = new WebSocket("ws://localhost:8081/myMate");
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

			// 사용자 이름을 서버로 전송합니다.
			if (userName && mateName) {
			    const registrationData = {
			        type: "register",
			        sender: userName,
			        mate: mateName
			    };

			    socket.send(JSON.stringify(registrationData));
			    console.log("사용자 등록 요청 전송:", registrationData);
			} else if (!userName) {
			    console.error("user 를 찾을 수 없습니다.");
			} else if (!mateName) {
			    console.error("mate 를 찾을 수 없습니다.");
			}

		}
		// 메시지 수신 핸들러
		function handleMessage(event) {
		    const data = JSON.parse(event.data);
		    displayMessage(data);
		    // 스크롤을 최신 메시지로 이동
		    chatBox.scrollTop = chatBox.scrollHeight;
		}

		
		// 메시지를 화면에 표시하는 함수
		function displayMessage(message) {
		    // 메시지 전체를 감싸는 div 생성
		    const messageDiv = document.createElement("div");
		    messageDiv.className = "message";

		    // 메시지의 발신자가 현재 사용자인지 상대방인지에 따라 스타일 적용
		    if (message.sender === userName) {
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
		    timeDiv.textContent = message.sentTime;

		    // 각 요소를 메시지Div에 추가
		    messageDiv.appendChild(senderDiv);
		    messageDiv.appendChild(contentDiv);
		    messageDiv.appendChild(timeDiv);

		    chatBox.appendChild(messageDiv);
		    chatBox.scrollTop = chatBox.scrollHeight; // 스크롤을 최신 메시지로 이동
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
		sendButton.addEventListener("click", function() {
		    sendMessage();
		});

		// Enter 키로 메시지 전송 (keyup 이벤트로 수정)
		messageInput.addEventListener("keyup", function(event) {
		    if (event.key === "Enter" && !event.shiftKey) { // Shift+Enter은 줄바꿈
		        event.preventDefault(); // 기본 동작 방지
		        sendMessage();
		    }
		});
		
		function sendMessage() {
		    const message = messageInput.value.trim(); // 공백 제거
		    if (message) {
		        const messageData = JSON.stringify({
					type:"message",
		            roomId: roomId,
		            sender: userName,
					mate:mateName, 
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
		    } 
		}

	

</script>

</body>
</html>













