<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
홈화면입니다.  
</h1>

	<li><a href="${contextPath }/admin/">관리자목록</a></li>
	<li><a href="${contextPath }/board/list">게시판 목록</a></li>
	<li><a href="${contextPath }/car/list">렌트카 목록</a></li>
	<li><a href="${contextPath }/rent/list">렌트예약 목록</a></li>


</body>
</html>
