<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Page</title>
    <style>
        /* 기존 스타일 그대로 유지 */
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
			justify-content: center; 
            flex-direction: column;
            min-height: 100vh;
			background-image: url('/background.png');
			background-size: cover;
	        background-position: center;
	    	background-repeat: no-repeat;
		    background-attachment: fixed;
        }

        .container {
			display: flex;
			justify-content: center; 
			flex-direction: column;
            max-width: 700px;
            margin: 2rem auto;
            width: 100%;
			background-color: rgba(255, 255, 255, 0.05);
			backdrop-filter: blur(3px);
			border-radius: 10px;
			box-shadow: 0 0 8px rgba(255, 255, 255, 1);
			padding: 2rem;
			border: 1px solid rgba(255, 255, 255, 0.3);
        }

        h1 {
            text-align: center;
            color: #000;
			padding: 0.3rem;
			margin-bottom: 0.25rem;
		    text-shadow: 0 0 10px rgba(0, 123, 255, 1);
        }

	    h2 {
			color: #f39c12;
			text-shadow: 0 0 10px rgba(243, 156, 18, 0.5);
		}

		.bio {
		    padding: 1rem;
		    margin-bottom: 3rem;
		    border: 1px solid #ddd;
		    border-radius: 5px;
		    font-size: 1.5rem;
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    width: 100%;
		    color: #000;
			text-shadow: 0 0 10px rgba(0, 123, 255, 0.5);
			background-color: rgba(255, 255, 255, 0.4);
			box-shadow: 0 0 10px rgba(0, 123, 255, 1);
		}

		.form-footer {
			display: flex;
			justify-content: center;

			text-align: center;
			margin-top: 1.5rem;
			margin-bottom:1.5rem;
			color: white;
		}

		.form-footer a {
			color: #f39c12;
			text-decoration: none;
		}

		.form-footer a:hover {
			text-decoration: underline;
		}

		@media (max-width: 600px) {
			.container {
				padding: 1rem;
				max-width: 90%;
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
	
		
		<h2>이메일</h2>
		<div class="bio">
			 ${ user.email }
		</div>
		

		<h2>자기소개</h2>
		<div class="bio">
		    <c:choose>
		        <c:when test="${not empty user.bio}">
		            ${ user.bio }
		        </c:when>
		        <c:otherwise>
		            아직 내용이 없습니다
		        </c:otherwise>
		    </c:choose>
		</div>

		
		<h2>가입한 시간</h2>
		<div class="bio">
			 ${ user.signday }
		</div>

	  </div>
    
    <div class="form-footer">
        <p>신분증 정보 수정 -->> <a href="/user/editProfile">Edit Profile</a></p>
    </div>

</body>
</html>