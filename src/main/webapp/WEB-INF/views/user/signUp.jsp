<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <style>
        * {
            margin: 0;
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
        }

        /* 전체 페이지 레이아웃 */
        .container {
			display: flex;
			justify-content: center; 
            background-color:rgba(255, 255, 255, 0.03); /* 반투명 흰색 */
            padding: 2rem;
            border-radius: 10px;
            box-shadow: -4px -4px 8px rgba(0, 123, 255, 0.5); /* 파란색 음영 */
            max-width: 700px;
            margin: 2rem auto;
            width: 100%;
			
			backdrop-filter: blur(10px); /* 유리 같은 흐림 효과 */
			border: 1px solid rgba(255, 255, 255, 0.3); /* 얇은 반투명 테두리 */
        }

        h2 {
            text-align: center;
            color: #f4f4f4;
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
            color: white;
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

      
    </style>
</head>
<body>

    <!-- 헤더 삽입 -->
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <!-- 메인 컨텐츠 -->
    <div class="container">
        
        <form action="/user/signup" method="post">
			<h2>Sign Up</h2>
			
            <label for="username">Username</label>
            <input type="text" id="username" name="username" placeholder="Enter your username" required>

            <label for="email">Email</label>
            <input type="email" id="email" name="email" placeholder="Enter your email" required>

            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="Enter your password" required>

            <label for="confirm-password">Confirm Password</label>
            <input type="password" id="confirm-password" name="confirmPassword" placeholder="Confirm your password" required>

            <button type="submit">Sign Up</button>
        </form>
    </div>
    
    <div class="form-footer">
        <p>Already have an account? <a href="/user/login">Login here</a></p>
    </div>

</body>
</html>