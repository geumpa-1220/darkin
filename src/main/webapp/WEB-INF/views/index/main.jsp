<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <style>
        /* 기존 스타일 그대로 유지 */
        * {
            margin: 1px;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            color: #333;
            background-image: url('/background.png');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }

        /* 두 div를 가로로 배열 */
        .container {
            display: flex;
            justify-content:space-around;;
            align-items: center;
            height: 100vh;
			margin:5px;
			flex-wrap: wrap; /* 한 줄에 두 개씩 배치되도록 설정 */
        }

		.first, .second {
		    position: relative;
		    width: 45%;
		    height: 45%;
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    border: 2px solid #ccc;
		    text-align: center;
		    font-size: 1.5em;
		    cursor: pointer;
		    transition: transform 0.2s;
		    margin-bottom: 20px;
		    overflow: hidden; /* 가상 요소가 밖으로 나가지 않게 설정 */
			
			border-radius: 10px;
			box-shadow: 0 0 8px rgba(255,255, 255,1);  ; /* 흰색 음영 */

		}

		.first::before, .second::before {
		    content: '';
		    position: absolute;
		    top: 0;
		    left: 0;
		    right: 0;
		    bottom: 0;
			
		    background-image: url('/main.gif');
		    background-size: cover;
		    background-position: center;
			
		    opacity: 0.4; /* 배경에만 투명도 적용 */
		    z-index: -1; /* 배경을 텍스트 뒤로 배치 */
		}

		.first:hover, .second:hover {
		    transform: scale(1.05); /* 호버 시 요소가 5% 확대됨 */
		    transition: transform 0.3s ease, opacity 0.3s ease; /* 애니메이션 효과 추가 */
		}

		.first:hover::before, .second:hover::before {
		    opacity: 0.7; /* 호버 시 배경 투명도 변화 */
		}

		p {
			text-decoration: none;
		    font-size: 3rem;
		    color: white;
		    text-shadow: 0 0 10px rgba(0, 123, 255, 1);
		    z-index: 1; /* 텍스트가 배경보다 위에 위치 */
		    position: relative; /* z-index가 적용되도록 설정 */
		}
		.first p{
			text-shadow: 0 0 10px rgba(243, 156, 18, 1); /* #f39c12 컬러 음영 적용 */
		}
    </style>
</head>
<body>

    <!-- 헤더 삽입 -->
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <!-- 메인 컨텐츠 -->
 <div class="container">
	<c:choose>
	    <c:when test="${ not empty sessionScope.username }">
			<div class="first" onclick="location.href='/community/questionList'">
			    <p>커뮤니티 계시판</p>
			</div>
			<div class="second" onclick="location.href='/chat/allChat'">
				<p>전국 채팅</p>
			</div>
			<div class="second" onclick="location.href='/chat/choice'">
			    <p>1:1 매칭</p>
			</div>
			<div class="first" onclick="location.href='/chat/allGroupList'">
				<p>그룹 찾기</p>
			</div>
			<div class="first" onclick="location.href='/chat/myRooms'">
			    <p>운명의 인연</p>
			</div>
			<div class="second" onclick="location.href='/chat/myGroup'">
			    <p>소속된 그룹<p>
			</div>

		</c:when>
		
		<c:otherwise>
			<div class="first" onclick="location.href='/user/login'">
			    <p>커뮤니티 계시판</p>
			</div>
			<div class="second" onclick="location.href='/user/login'">
				<p>전국 채팅</p>
			</div>
			<div class="second" onclick="location.href='/user/login'">
			    <p>1:1 매칭</p>
			</div>
			<div class="first" onclick="location.href='/user/login'">
				<p>그룹 찾기</p>
			</div>
			<div class="first" onclick="location.href='/user/login'">
			    <p>운명의 인연</p>
			</div>
			<div class="second" onclick="location.href='/user/login'">
			    <p>소속된 그룹<p>
			</div>
		</c:otherwise>
	</c:choose>	

</div>

 
 
</body>
</html>