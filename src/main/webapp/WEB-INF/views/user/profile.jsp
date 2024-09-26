<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
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
			flex-direction: column;
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

        h1 {
            text-align: center;
            color: #000;
			padding: 0.75rem;
			margin-bottom: 1.25rem;
		    text-shadow: 0 0 10px rgba(0, 123, 255, 1); /* 글자에 그림자 추가 */	  
        }
	    h2{
			color: #f39c12;
			text-shadow: 0 0 10px rgba(243, 156, 18, 0.5); /* #f39c12 컬러 음영 적용 */  

		}


		.bio {
		    padding: 1rem;
		    margin-bottom: 3rem;
		    border: 1px solid #ddd;
		    border-radius: 5px;
		    font-size: 1.5rem;
		    display: flex; /* Flexbox 적용 */
		    justify-content: center; /* 가로 중앙 정렬 */
		    align-items: center; /* 세로 중앙 정렬 */
		    width: 100%;
		    color: #000;
			text-shadow: 0 0 10px rgba(0, 123, 255, 0.5); /* 글자에 그림자 추가 */
			background-color:rgba(255, 255, 255, 0.4); /* 반투명 흰색 */
			box-shadow: 0 0 10px rgba(0, 123, 255, 1); /* 파란색 그림자 */
		}

		.form-footer {
		           text-align: center;
		           margin-top: 1.5rem;
				   justify-content:center;
				   color:white;
		          }

		.form-footer a {
		           color: #f39c12; /* 링크 색상을 더 눈에 띄게 */
		           text-decoration: none;
				
		          }

		       .form-footer a:hover {
		           text-decoration: underline;
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
        
		<h1>나의 신분증</h1>
		
		<h2>닉네임</h2>
		<div class="bio">
			 ${ user.username }
		</div>
		
		<h2>정신연령</h2>
		<div class="bio">
			        
		</div>
		
		<h2>이메일</h2>
		<div class="bio">
			 ${ user.email }
		</div>
		
		<h2>자기소개</h2>
		<div class="bio">
			        
		</div>
		
		<h2>가입한 시간</h2>
		<div class="bio">
			 ${ user.signday }
		</div>

    </div>
	
    
    <div class="form-footer">
        <p>신분증 정보 수정 -->> <a href="/user/update">Edit Profile</a></p>
    </div>

</body>
</html>