<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="category.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="title" value="목록형 예약 현황" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바 캠핑카 - 관리자 페이지</title>
<%@ include file="../../include/plugin.jsp" %>
<link href="${contextPath}/resources/css/admin/admin_all.css" rel="stylesheet" />
</head>
<body>

<div id="container">
	<!-- #sidebar start -->
	<%@ include file="../include/sidebar.jsp" %>
	<!-- // #sidebar end -->
	
	<!-- #topmenu start -->
	<%@ include file="../include/topmenu.jsp" %>
	<!-- // #topmenu end -->
	
	<div id="wrap">
<!-- ================================================== -->

<style>
.renttoday .col1, .renttoday .col2 {width:50%; float:left; min-height:300px; border:1px solid #ff0000;}
</style>

<div class="renttoday">

	<div class="col1">
		<h3>오늘의 출고 차량</h3>
		<c:forEach items="${startlist }" var="dto">
		<div>
			<table class="table table-bordered" onclick="location.href='read?rent_id=${dto.rent_id}&listtype=today';">
			<colgroup>
				<col width="15%" />
				<col width="35%" />
				<col width="15%" />
				<col width="35%" />
			</colgroup>
			<tr>
				<th>예약 번호</th>
				<td>${dto.rent_id }</td>
				<th>차량 번호</th>
				<td>(${dto.car.car_regid }) [${dto.car.car_modelname }] ${dto.car.car_name }</td>
			</tr>			

			<tr>
				<th>고객명</th>
				<td>${dto.rent_name }</td>
				<th>연락처</th>
				<td>${dto.rent_phone1 }</td>
			</tr>
			</table>
		</div>
		</c:forEach>
	</div>
	
	<div class="col2">
		<h3>오늘의 반납 차량</h3>
		<c:forEach items="${endlist }" var="dto">
		<div>
			<table class="table table-bordered" width="50%" onclick="location.href='read?rent_id=${dto.rent_id}&listtype=today';">
			<tr>
				<th>차량 번호</th>
				<td>${dto.car_regid }</td>
			</tr>			
			<tr>
				<th>예약 번호</th>
				<td>${dto.rent_id }</td>
			</tr>
			<tr>
				<th>예약자</th>
				<td>${dto.rent_name }</td>
			</tr>
			<tr>
				<td colspan="2">
					${dto }
				</td>
			</tr>
			</table>
		</div>
		</c:forEach>		
	</div>

 </div>

<!-- ================================================== -->
	</div><!-- // #wrap end -->
</div><!-- // #container end -->

</body>
</html>