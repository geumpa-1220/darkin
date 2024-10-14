<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- 기존 head 내용 유지 -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Matching</title>
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
        
        .age{
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }
        
        /* 링크 스타일 */
        .age a {
            color: white;
            text-decoration: none;
            margin: 0 15px;
            font-size: 16px;
            transition: color 0.3s ease;
        }

        .age a:hover {
            color: #f39c12; /* 호버 시 색상 변경 */
        }

        /* 헤더 가운데 로고 스타일 */
        h3 a {
            color: white;
            font-size: 24px;
            text-transform: uppercase;
            letter-spacing: 2px;
            text-decoration: none;
            font-weight: bold;
            text-shadow: 0 0 10px rgba(0, 123, 255, 1);
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
            max-height: 80vh; /* 스크롤을 위한 최대 높이 설정 */
            overflow-y: auto; /* 세로 스크롤 활성화 */
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
        
        .card {
            font-size: 1.5rem; /* 적절한 폰트 크기로 조정 */
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

        .bio {
            padding: 1rem;
            margin-bottom: 1rem;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1.2rem;
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            color: #000;
            text-shadow: 0 0 10px rgba(0, 123, 255, 0.5);
            background-color: rgba(255, 255, 255, 0.4);
            box-shadow: 0 0 10px rgba(0, 123, 255, 1);
        }

        .footer {
			position: relative;
			width: 70%;
			height: 45%;
			display: flex;
			justify-content: center;
			align-items: center;
			border: 2px solid #ccc;
			text-align: center;
			font-size: 1.5em;
			cursor: pointer;
			transition: transform 0.2s;
			margin-top:20px;
			margin-bottom: 20px;
			color:white;
            background-color:rgba(0,0,0,0.3);
			border-radius: 10px;
			box-shadow: 0 0 8px rgba(255,255, 255,1);  ; /* 흰색 음영 */
			text-shadow: 0 0 10px rgba(0, 123, 255, 1);
        }

        .footer:hover {
			transform: scale(1.05); /* 호버 시 요소가 5% 확대됨 */
			transition: transform 0.3s ease, opacity 0.3s ease; /* 애니메이션 효과 추가 */
			color: #f39c12;

        }
		
		hr {
		    border: none;
		    width: 100%;
		    margin: 2rem 0;
		    background: linear-gradient(to right, rgba(255, 255, 255, 0), rgba(255, 255, 255, 0.5), rgba(255, 255, 255, 0));
		    height: 2px;
		}


        @media (max-width: 600px) {
            .container {
                padding: 1rem;
                max-width: 90%;
            }
            .card {
                font-size: 1.2rem;
            }
            .bio {
                font-size: 1rem;
            }
        }
    </style>
</head>
<body>

    <!-- 헤더 삽입 -->
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    

    <!-- 메인 컨텐츠 -->
	<hr>
        <h1>매칭된 사용자 목록</h1>
    <hr>    
        <!-- 사용자 리스트 반복 시작 -->
        <c:forEach var="user" items="${users}">
            <div class="container">
                <h2>닉네임</h2>
                <div class="card">
                    ${user.username}    
                </div>
            
                <h2>나이</h2>
                <div class="card">
                    ${user.age}대
                </div>
                
                <h2>자기소개</h2>
                <div class="bio">
                    <c:choose>
                        <c:when test="${not empty user.bio}">
                            ${user.bio}
                        </c:when>
                        <c:otherwise>
                            아직 내용이 없습니다
                        </c:otherwise>
                    </c:choose>
                </div>
				
				<div class="footer" onclick="location.href='/chat/myMate?mate=${user.username}'">
				   <h3>채팅 시작</h3>
				</div>

            </div>
			<hr>
        </c:forEach>
        <!-- 사용자 리스트 반복 종료 -->
    
    

</body>
</html>