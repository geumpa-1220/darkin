<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
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
	        min-height: 100vh;
			background-image: url('/main.gif'); /* 배경 이미지 경로 */
			background-size: auto; /* 화면에 맞게 이미지 크기 조정 */
			background-color: #000;/* 남은 여백의 색을 이미지 테두리와 일치하게 설정 */
	        background-position: center; /* 이미지의 위치를 가운데로 설정 */
	    	background-repeat: no-repeat; /* 이미지 반복 방지 */
		    background-attachment: fixed; /* 스크롤 시 배경 고정 */
	       }

    header {	  
		    box-shadow: 0 0 8px rgba(255,255, 255,1);    
		   	}


   .container {
		   	display: flex;
			justify-content: center; 
            max-width: 1000px;
	        margin: 2rem auto;
			width: 100%;
		   	background-color:rgba(210,240,255, 0.4); /* 반투명 흰색 */
		   	backdrop-filter: blur(3px); /* 유리 같은 흐림 효과 */
		   	border-radius: 10px;
		   	box-shadow: 0 0 8px rgba(50,160,180, 1); /* 음영 */
		   	padding: 2rem;
		   	border: 1px solid rgba(255, 255, 255, 0.3); /* 얇은 반투명 테두리 */
		   	
		   }

   h2 {
	    font-size: 1.5rem;
	    color:white;
		text-shadow: 0 0 10px rgba(0, 0, 0, 1);
		} 
	 }

</style>
</head>
<body>
   <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <!-- 메인 컨텐츠 -->
<div class="container">
   <h2>인터넷은 쑥스러움을 떨쳐내는 장소이다.</h2>
</div>
<div class="container">
   <h2>인터넷은 세상 여기저기의 새로운 사람들을 만나는 장소이다.</h2>
</div>
<div class="container">
   <h2>인터넷은 당신의 취미와 열정을 공유 장소이다.</h2>
</div>

<div class="container">
   <h2>인터넷은 사람들과 우정을 쌓을 수 있는 좋은 장소이다.</h2>
</div>
<div class="container">
   <h2>온라인상에서 친구를 만드는 법은 그리 어렵지 않다.</h2>
</div>
<div class="container">
  <h2>Welcome To 다크인 !!</h2>
</div>
</body>
</html>