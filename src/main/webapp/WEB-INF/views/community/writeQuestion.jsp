<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WriteQeustion</title>
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
			
		   
		    width: 60%;
			
			margin:2rem auto;
			background-color: rgba(225, 225, 225, 0.1);
			backdrop-filter: blur(3px);
			border-radius: 10px;
			box-shadow: 0 0 8px rgba(255, 255, 255, 1);
			padding: 1rem;
			border: 1px solid rgba(255, 255, 255, 0.3);
			
			flex-grow: 1; /* 남은 공간을 모두 차지하게 만듦 */
			
		}

 
        h2 {
            text-align: center;
            color: #000;
			text-shadow: 0 0 10px rgba(0, 123, 255, 90); /* 글자에 그림자 추가 */	  
        }
		hr{
			box-shadow: 0 0 8px rgba(255, 255, 255, 1);
			margin-bottom:2rem
		}

        form {
            display: flex;
            flex-direction: column;
			width: 100%; /* form의 너비를 부모 컨테이너의 너비에 맞게 */
		    max-width: 400px; /* 적절한 최대 너비 설정 */
			font-size:2rem;
        }

        label {
			
			border-bottom: 1px solid rgba(255, 255, 255, 0.5);
			cursor: pointer;
			border-radius: 5px; /* 테두리 둥글기 없애기 */

			text-align:center;
			margin-top:1rem;
            margin-bottom: 0.5rem;
            font-weight: bold;
            color: #000;
			text-shadow: 0 0 10px rgba(0, 123, 255, 90); /* 글자에 그림자 추가 */	  
        }

        input {
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
		
		textarea{
			width: 100%; /* 가로 너비, cols="50"에 해당 */
			height: 150px; /* 세로 높이, rows="4"에 해당 */
			margin:2px;	
		    margin-bottom:3rem;		
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

       

	
    </style>
</head>
<body>

    <!-- 헤더 삽입 -->
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <!-- 메인 컨텐츠 -->
    <div class="container">
        
        <form action="/community/writeQuestion" method="post">
			<h2> 계시판 작성하기 </h2>
			<hr>
			
            <label for="questionTitle">타이틀</label>
            <input type="text" id="questionTitle" name="questionTitle" placeholder="Enter your title" required>

            <label for="questionContent">내용</label>
			<textarea id="questionContent" name="questionContent" placeholder="Enter your content" required ></textarea>
			
            <button type="submit">Write</button>
        </form>
    </div>
    

</body>
</html>