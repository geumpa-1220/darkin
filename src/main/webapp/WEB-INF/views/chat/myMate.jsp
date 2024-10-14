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
		padding:0.2rem;
		
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
		width:100%;
		text-align: center;
	}

	.scrollable-list ul {
	    list-style: none;
	    padding: 0;
	    margin: 0;
	}


	.dynamic-list {
	    min-height: 200px; /* 최소 높이 설정 */
	    display: flex;
	    flex-direction: column;
	    justify-content: center;
	    align-items: stretch;
	    color: rgba(255, 255, 255, 0.6); /* 빈 리스트 색상 */
		height:100%;
		width:100%;
	}

	.placeholder {
	    color: rgba(255, 255, 255, 0.6);
	    text-align: center;
	    width: 100%;
	    padding: 0.5rem 0;
	}
	.dynamic-list li {
		display: flex; /* li 요소를 Flex 컨테이너로 설정 */
		justify-content: center; /* 텍스트를 중앙 정렬 */
	    text-align: center;
		width:100%;
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
        <div class="title">${mate}</div>
        <hr>
        <div class="content-wrapper"> <!-- 새로운 래퍼 시작 -->
            <div class="sidebar">
                <div class="menu-item">채팅방</div>
                <div class="scrollable-list">
                    <ul class="dynamic-list">
                        <c:if test="${empty chatList}">
                            <li class="placeholder">채팅방이 없습니다.</li>
                        </c:if>
                        <c:forEach var="chat" items="${chatList}">
                            <li>${chat.name}</li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <div id="chat-section"> <!-- 새로운 채팅 섹션 시작 -->
                <div id="chat-box"></div>
                <div class="chat-input">
                    <textarea placeholder="메시지를 입력하세요" rows="1"></textarea>
                    <button type="button">전송</button>
                </div>
            </div>
        </div> <!-- 새로운 래퍼 끝 -->
    </div>

<script>
	// 현재 접속한 사용자 정보 (서버에서 전달받아야 함)
	const userName='${sessionScope.username}';
	// URL 파라미터로 전달된 상대방 사용자 이름
	const mateName='${param.username}';
	
	// WebSocket 연결
	const socket = new WebSocket('ws://localhost:8081/myMate?user='+userName+'&mate'+mateName);
	
	const chatBox = document.getElementById('chat-box');
	const messageInput = document.querySelector('.chat-input textarea');
	const sendButton = document.querySelector('.chat-input button');
	const dynamicList = document.querySelector('.dynamic-list');
	
	

</script>

</body>
</html>













