<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KoreaChat</title>
<style>
	* {
	    margin: 1px;
	    padding: 0;
	    box-sizing: border-box;
		
	}

	body {
	    font-family: 'Arial', sans-serif;
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
		
		margin:2rem auto;
		background-color: rgba(0, 0, 0, 0.5 );
		backdrop-filter: blur(3px);
		border-radius: 10px;
		box-shadow: 0 0 8px rgba(255, 255, 255, 1);
		padding: 1rem;
		border: 1px solid rgba(255, 255, 255, 0.3);
		
		flex-grow: 1; /* 남은 공간을 모두 차지하게 만듦 */
		
	}
	
	
	.title {
		font-size:2rem;
	    margin: 0 auto 1rem;
	    width: 50%;
	    color:white; /* 글자 색상 선명하게 */
	    padding: 0.5rem 1rem;
	    border-top: 1px solid rgba(255, 255, 255, 0.5); /* 위아래 테두리 */
	    border-bottom: 1px solid rgba(255, 255, 255, 0.5);
	    cursor: pointer;
	    
	    border-left: none; /* 좌우 테두리 없애기 */
	    border-right: none;
	    border-radius: 3px; /* 테두리 둥글기 없애기 */
	    background-color: rgba(0, 0, 0, 0.3); /* 반투명 효과 */
		text-shadow: 0 0 10px rgba(243, 156, 18, 1);
		
		display: flex;
		justify-content: center; 
		flex-direction: column;
		align-items: center;

	}

	hr{
		width:100%;
		box-shadow: 0 0 8px rgba(255, 255, 255, 1);
		margin:2rem;
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
		<input type="text" placeholder="메시지를 입력하세요" id="message-input">
		<button type="button" id="send-btn">전송</button>
	</div>
	
</body>
</html>







