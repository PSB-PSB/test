<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보유 차량</title>
<%@ include file="../include/plugin.jsp" %>
<link href="${contextPath}/resources/css/sub_all.css" rel="stylesheet" />
</head>
<body>

<div id="container">
	<!-- #header start -->
	<%@ include file="../include/header.jsp" %>
	<!--// #header end -->
	
	<div id="body_head">
		<h2>보유 차량</h2>
		<div class="location">
			HOME　<i class="fa-solid fa-circle-chevron-right"></i> 　<span>보유 차량</span>
		</div>
	</div>
	
	<div id="wrap">
		<div id="submenu">
			<ul>
				<li class="on"><a href="#">보유 차량</a></li>
			</ul>
		</div>
		
		<div id="body_contents">
<!-- ================================================== -->

<h2>캠핑카 목록</h2>

<table width="100%" border="1">
<colgroup>
</colgroup>
<thead>
</thead>
<tbody>
<c:forEach items="${dtolist}" var="dto">
<tr>
	<th>${dto.car_regid }</th>
	<td>${dto.car_rentcompid }</td>
	<td><a href="read?car_regid=${dto.car_regid }">${dto.car_modelname } ${dto.car_name }</a></td>
	<td>${dto.car_number }</td>
	<td>${dto.car_capa }</td>
	<td>${dto.car_rentprice }</td>
	<td>${dto.car_regdate }</td>
</tr>
</c:forEach>
</tbody>
</table>

<button class="btn btn-primary" onclick="location.href='register';">차량 등록</button>

<!-- ================================================== -->		
		</div> <!-- // #body_contents end -->
	</div><!-- // #wrap end -->
	
	<div id="footer">
	</div>
</div><!-- // #container end -->

</body>
</html>