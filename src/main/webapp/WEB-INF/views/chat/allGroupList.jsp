<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>allGroupList</title>
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
		justify-content:flex-start; 
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
	    margin: 1rem auto 1rem;
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

	.title:hover {
		background-color: #f39c12;
	}
	hr {
	    border: none;
	    width: 100%;
	    margin: 2rem 0;
	    background: linear-gradient(to right, rgba(255, 255, 255, 0), rgba(255, 255, 255, 0.5), rgba(255, 255, 255, 0));
	    height: 2px;
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
	h3 a {
	    color: white;
	    font-size: 24px;
	    text-transform: uppercase;
	    letter-spacing: 2px;
	    text-decoration: none;
	    font-weight: bold;
	    text-shadow: 0 0 10px rgba(0, 123, 255, 1);
	}
</style>
</head>
<body>
	   <jsp:include page="/WEB-INF/views/common/header.jsp" />

	    <!-- 메인 컨텐츠 -->
		
		<div class="title" >운명의 그룹들</div>
		<hr>
		        <!-- 그룹 리스트 반복 시작 -->
		        <c:forEach var="list" items="${allGroupList}">
		            <div class="container">
		                <h2>그룹명</h2>
		                <div class="card">
		                    ${list.title}    
		                </div>
						
						<h2>그룹 소개</h2>
						<div class="card">
						    ${list.bio}    
						</div>

						<div class="footer" onclick="location.href='/chat/groupChat?roomId=${list.id}'">
						   <h3>입장</h3>
						</div>

		            </div>
					<hr>
		        </c:forEach>
		        <!-- 그룹 리스트 반복 종료 -->
		    
		    

</body>
</html>
