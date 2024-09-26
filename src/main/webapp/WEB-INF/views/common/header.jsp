<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	/* 기본 스타일 */
	body {
	    font-family: Arial, sans-serif;
	    margin: 0;
	    padding: 0;
	}

	/* 헤더 영역 스타일 */
	header {
	    background-color: #333;
	    color: white;
	    padding: 10px 0;
	    position: sticky;
	    top: 0;
	    width: 100%;
	    box-shadow: 0 0 8px rgba(255,255, 255,1);  
	    z-index: 1000;
	}

	/* 네비게이션 스타일 */
	nav {
	    display: flex;
	    justify-content: space-between;
	    align-items: center;
	    max-width: 1200px;
	    margin: 0 auto;
	    padding: 0 20px;
	}

	/* 링크 스타일 */
	nav a {
	    color: white;
	    text-decoration: none;
	    margin: 0 15px;
	    font-size: 16px;
	    transition: color 0.3s ease;
	}

	nav a:hover {
	    color: #f39c12; /* 호버 시 색상 변경 */
	}

	/* 헤더 가운데 로고 스타일 */
	h1 a {
	    color: white;
	    font-size: 24px;
	    text-transform: uppercase;
	    letter-spacing: 2px;
	    text-decoration: none;
	    font-weight: bold;
		text-shadow: 0 0 10px rgba(0, 123, 255, 1);
	}

	/* 로그인/로그아웃 버튼 영역 */
	div {
	    display: flex;
	    align-items: center;
	}

	div a {
	    margin-left: 15px;
	}
	.menu{
		text-shadow: 0 0 10px rgba(243, 156, 18, 1); /* #f39c12 컬러 음영 적용 */
		
	}
</style>

<header>
    <nav>
        <c:choose>
            <c:when test="${ not empty sessionScope.username }">
                <div class="menu">
                    <a href="/community/board">COMMNITY</a>
                    <a href="/community/message">CHAT</a>
                </div>
                <div>
                    <h1><a href="/">  DARK IN  </a></h1>
                </div>
                <div class="menu">
                    <a href="/user/profile">${ sessionScope.username}님</a>
                    <a href="/logout">LOG OUT</a>
                </div>
            </c:when>
            <c:otherwise>
                <div class="menu">
                    <a href="/user/login">COMMNITY</a>
                    <a href="/user/login">CHAT</a>
                </div>
                <div>
                    <h1><a href="/">DARK IN</a></h1>
                </div>
                <div class="menu">
                    <a href="/user/login">Login</a>
                    <a href="/user/signUp">Sign Up</a>
                </div>
            </c:otherwise>
        </c:choose>
    </nav>
</header>