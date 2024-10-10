<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board</title>
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
	
	h3{
		font-size:3.5rem;
		margin-top:0;
		color:white;
		text-shadow: 0 0 10px rgba(0, 123, 255, 1);
		margin-bottom: 3rem; /* 아래 요소와의 간격 조절 */
		cursor: pointer;
	}
	
	.user {
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

	.user:hover {
		background-color: #f39c12;
	}

	table {
		width: 80%;
		border-collapse: collapse;
	}

	thead {
		background-color: rgba(255, 255, 255, 0.2);
	}

	th, td {
		padding: 0.75rem;
		border: 1px solid rgba(255, 255, 255, 0.1);
		text-align:center;
		font-size:1.5rem;
		
	}

	th {
		background-color: rgba(255, 255, 255, 0.3);
		color: #fff;
		font-weight: bold;
		text-shadow: 0 0 10px rgba(0, 123, 255, 1);
	}

	td {
		background-color: rgba(255, 255, 255, 0.3);
		color: #fff;
		text-shadow: 0 0 10px rgba(0, 123, 255, 1);
	}

	hr{
		width:100%;
		box-shadow: 0 0 8px rgba(255, 255, 255, 1);
		margin:2rem;
	}
	h2 {
	    text-align: center;
	    color: #000;
		text-shadow: 0 0 10px rgba(0, 123, 255, 90); /* 글자에 그림자 추가 */	  
	}
	form {
	    display: flex;
		flex-direction: column; /* 세로로 정렬 */
		align-items: center; /* 수평으로 가운데 정렬 */
		width: 100%; /* form의 너비를 부모 컨테이너의 너비에 맞게 */
		font-size:2rem;
	}

	label {
		
		border-bottom: 1px solid rgba(255, 255, 255, 0.5);
		cursor: pointer;
		border-radius: 5px; /* 테두리 둥글기 없애기 */
        width:80%;
		text-align:center;
		margin-top:1rem;
	    margin-bottom: 0.5rem;
	    font-weight: bold;
	    color: #fff;
		text-shadow: 0 0 10px rgba(0, 123, 255, 90); /* 글자에 그림자 추가 */	  
	}
	textarea{
		background-color: rgba(255, 255, 255, 0.7);
		width: 80%; /* 가로 너비, cols="50"에 해당 */
		height: 150px; /* 세로 높이, rows="4"에 해당 */
		margin:2px;	
	    margin-bottom:3rem;	
		align-items: center;	
	}

	button {
		width:80%;
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



</style>
</head>
<body>
   <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <!-- 메인 컨텐츠 -->

<div class="container">
	<h3 onclick="location.href='/community/questionList'">커뮤니티 계시판</h3>
	
	
	<!--userController 해야됌-->
	<div class="user" onclick="location.href='/user/profile?username='+${question.questionUser}">${question.questionUser}</div>
	<!---->
	
  <table>
	<thead>
		<tr>
			<th>${question.questionTitle}</th>
		</tr>
	</thead>
  
	<tbody>
        <tr>
     		<td style="height: 300px;">${question.questionContent}</td>
		</tr>
		<tr>
			<td>${question.questionTime}</td>
		</tr>
	</tbody>
  </table>
  <hr>
  
  <table>
  <tbody>
  	<c:forEach var="list" items="${ answer }">
  		<tr onclick="location.href='/user/profile'">
  			<td>${list.answerUser}</td>
  			<td>${list.answerContent}</td>
			<td>${list.answerTime}</td>
  		</tr>
  	</c:forEach>
  </tbody>
  </table>
  
  <hr>
  
  <form action="/community/writeAnswer" method="post">
	<input type="hidden" name="qid" value="${question.id}">
	
    <label for="answerContent">댓글</label>
  	<textarea id="answerContent" name="answerContent" placeholder="Enter your content" required ></textarea>
  	
    <button type="submit">Write</button>
  </form>

</div>
<c:out value="${question.id}"/>
</body>
</html>