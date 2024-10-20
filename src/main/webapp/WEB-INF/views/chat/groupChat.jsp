<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Group Chat</title>
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
        height: 100%;
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
        flex-grow: 1;
        height: 100%;
        align-items: stretch;
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
        padding: 0.5rem 0;
        border-radius: 5px;
    }

    .scrollable-list {
        flex: 1;
        border-radius: 5px;
        background-color: rgba(255, 255, 255, 0.05);
        padding: 0.2rem;
        width: 100%;
        text-align: center;
        overflow-y: auto;
    }

    .scrollable-list ul {
        list-style: none;
        padding: 0;
        margin: 0;
    }

    .dynamic-list {
        min-height: 200px;
        display: flex;
        flex-direction: column;
        justify-content: flex-start;
        align-items: stretch;
        color: rgba(255, 255, 255, 0.9);
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
        display: block;
        padding: 0.5rem;
        margin-bottom: 0.2rem;
        text-align: center;
        background-color: rgba(255, 255, 255, 0.1);
        border-radius: 5px;
        transition: background-color 0.3s ease;
    }

    .dynamic-list li:hover {
        background-color: rgba(243, 156, 18, 0.8);
        cursor: pointer;
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
        word-wrap: break-word;
        word-break: break-word;
        white-space: pre-wrap;
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
        word-wrap: break-word;
        word-break: break-word;
        white-space: pre-wrap;
    }

    .user .content {
        background-color: rgba(0, 0, 0, 0.5);
        margin-right: 20px;
        box-shadow: 2px 2px 0px rgba(255, 255, 255, 0.5);
        text-shadow: 0 0 10px rgba(243, 156, 18, 1);
    }

    .other .content {
        background-color: rgba(0, 0, 0, 0.5);
        margin-right: 20px;
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
            flex-direction: column;
            flex-grow: 0;
        }

        .sidebar {
            width: 100%;
            height: auto;
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
        <div class="title">${groupRoom.title}</div>
        <hr>
        <div class="content-wrapper">
            <div class="sidebar">
                <div class="menu-item">그룹 맴버</div>
                <div class="scrollable-list">
                    <ul class="dynamic-list">
                        <c:forEach var="member" items="${members}">
                            <li onclick="location.href='/chat/myMate?mate=${member.user}'">${member.user}</li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <div id="chat-section">
                <div id="chat-box">
                    <c:forEach var="message" items="${messages}">
                        <div class="message ${message.user == sessionScope.username ? 'user' : 'other'}">
                            <div class="sender">${message.user}</div>
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
        </div>
    </div>

<script>
    let socket;
    let reconnectAttempts = 0;
    const userName = '${sessionScope.username}';
    const roomId = '${param.roomId}';
    const chatBox = document.getElementById('chat-box');
    const messageInput = document.querySelector('.chat-input textarea');
    const sendButton = document.querySelector('.chat-input button');

    window.onload = function() {
        connectWebSocket();
    };

    function connectWebSocket() {
        if (!socket || socket.readyState === WebSocket.CLOSED || socket.readyState === WebSocket.CLOSING) {
            socket = new WebSocket("ws://localhost:8081/groupChat");
            socket.onopen = handleOpen;
            socket.onmessage = handleMessage;
            socket.onclose = handleClose;
            socket.onerror = handleError;
        }
    }

    function handleOpen(event) {
        console.log("WebSocket 연결이 열렸습니다.");
        reconnectAttempts = 0;

        if (userName && roomId) {
            const registrationData = {
                type: "member",
                user: userName,
                roomId: roomId
            };

            socket.send(JSON.stringify(registrationData));
            console.log("사용자 등록 요청 전송:", registrationData);
        } else if (!userName) {
            console.error("user 를 찾을 수 없습니다.");
        } else if (!roomId) {
            console.error("roomId 를 찾을 수 없습니다.");
        }
    }

    function handleMessage(event) {
        const data = JSON.parse(event.data);
        displayMessage(data);
        chatBox.scrollTop = chatBox.scrollHeight;
    }

    function displayMessage(message) {
        const messageDiv = document.createElement("div");
        messageDiv.className = "message";

        if (message.user === userName) {
            messageDiv.classList.add("user");
        } else {
            messageDiv.classList.add("other");
        }

        const senderDiv = document.createElement("div");
        senderDiv.className = "sender";
        senderDiv.textContent = message.user;

        const contentDiv = document.createElement("div");
        contentDiv.className = "content";
        contentDiv.textContent = message.content;

        const timeDiv = document.createElement("div");
        timeDiv.className = "time";
        timeDiv.textContent = message.sentTime;

        messageDiv.appendChild(senderDiv);
        messageDiv.appendChild(contentDiv);
        messageDiv.appendChild(timeDiv);

        chatBox.appendChild(messageDiv);
        chatBox.scrollTop = chatBox.scrollHeight;
    }

    function handleClose(event) {
        console.log("WebSocket 연결이 닫혔습니다. 재연결 시도 중...");
        if (reconnectAttempts < 5) {
            setTimeout(connectWebSocket, 1000);
            reconnectAttempts++;
        } else {
            console.error("재연결 시도가 최대치를 초과했습니다.");
        }
    }

    function handleError(event) {
        console.error("WebSocket 오류가 발생했습니다:", event);
    }

    sendButton.addEventListener("click", function() {
        sendMessage();
    });

    messageInput.addEventListener("keyup", function(event) {
        if (event.key === "Enter" && !event.shiftKey) {
            event.preventDefault();
            sendMessage();
        }
    });

    function sendMessage() {
        const message = messageInput.value.trim();
        if (message) {
            const messageData = JSON.stringify({
                type: "message",
                roomId: roomId,
                user: userName,
                content: message
            });

            if (socket.readyState === WebSocket.OPEN) {
                socket.send(messageData);
                messageInput.value = "";
                messageInput.style.height = "auto";
            } else {
                console.error("WebSocket이 닫혀 있습니다. 현재 상태:", socket.readyState);
            }
        } 
    }
</script>

</body>
</html>
