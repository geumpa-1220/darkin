<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update My Page</title>
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
			background-image: url('/background.png'); /* 배경 이미지 경로 */
			background-size: cover; /* 화면에 맞게 이미지 크기 조정 */
	        background-position: center; /* 이미지의 위치를 가운데로 설정 */
	    	background-repeat: no-repeat; /* 이미지 반복 방지 */
		    background-attachment: fixed; /* 스크롤 시 배경 고정 */
        }

        /* 전체 페이지 레이아웃 */
        .container {
			display: flex;
			justify-content: center; 
            max-width: 700px;
            margin: 2rem auto;
            width: 100%;
			
			background-color:rgba(255, 255, 255, 0.1); /* 반투명 흰색 */
			backdrop-filter: blur(3px); /* 유리 같은 흐림 효과 */
			border-radius: 10px;
			box-shadow: 0 0 8px rgba(255,255, 255,1);  ; /* 흰색 음영 */
			padding: 2rem;
			border: 1px solid rgba(255, 255, 255, 0.3); /* 얇은 반투명 테두리 */
        }

        h2 {
            text-align: center;
            color: #000;
			text-shadow: 0 0 10px rgba(0, 123, 255, 90); /* 글자에 그림자 추가 */	  
        }

        form {
            display: flex;
            flex-direction: column;
			width: 100%; /* form의 너비를 부모 컨테이너의 너비에 맞게 */
		    max-width: 400px; /* 적절한 최대 너비 설정 */
			
        }

        label {
            margin-bottom: 0.5rem;
            font-weight: bold;
            color: #000;
			text-shadow: 0 0 10px rgba(0, 123, 255, 90); /* 글자에 그림자 추가 */	  
        }

        input , textarea{
            padding: 0.75rem;
            margin-bottom: 1.25rem;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
            width: 100%;
			color: #333; /* 글자 색상을 어둡게 */
			box-shadow: 0 0 10px rgba(0, 123, 255, 90);
			
        }

        input:focus {
            outline: none;
            border-color: #007BFF;
            box-shadow: 0 0 5px rgba(0, 123, 255, 5);
        }

        button {
            padding: 0.75rem;
            background-color: #333;
			box-shadow: 0 0 5px rgba(0, 123, 255, 5);
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1rem;
			transition: background-color 0.3s ease; /* 부드러운 hover 효과 */
        }

        button:hover {
            background-color: #f39c12;
        }

       

		/* 반응형 디자인 추가 */
		       @media (max-width: 600px) {
		           .container {
		               padding: 1rem;
		               max-width: 90%;
		           }

		           form {
		               max-width: 100%;
		           }
		       }
    </style>
</head>
<body>

    <!-- 헤더 삽입 -->
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <!-- 메인 컨텐츠 -->
    <div class="container">
        
        <form action="/user/editProfile" method="post">
			<h2>신분증 편집</h2>
			
            <label for="username">닉네임</label>
            <input type="text" id="username" name="username" value="${user.username}" required>

            <label for="email">이미일</label>
            <input type="email" id="email" name="email" value="${user.email}" required>
      
			<label for="bio">자기소개</label>
			<textarea id="bio" name="bio" rows="5" cols="40" required>${user.bio}</textarea>

            <button type="submit">저장</button>
        </form>
    </div>
    

</body>
</html>