<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="action" value="register" />
<c:if test="${not empty dto.car_regid }">
	<c:set var="action" value="modify" />
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑카 등록</title> 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
.input-group-text {width:200px;}
</style>
</head>
<body>

	<form action="${action }" method="post">
	<c:if test="${action eq 'modify'}"><input type="hidden" name="car_regid" value="${dto.car_regid }" /></c:if>
	
	<div class="input-group">
		<span class="input-group-text">캠핑카 대여 회사</span>
		<select class="form-control" name="car_rentcompid">
			<option value="1" selected>임시 대여 회사</option>
		</select>
	</div>
	<div class="input-group">
		<span class="input-group-text">모델명</span>
		<input type="text" name="car_modelname" value="${dto.car_modelname }" class="form-control" required />
	</div>	
	<div class="input-group">
		<span class="input-group-text">캠핑카 이름</span>
		<input type="text" name="car_name" value="${dto.car_name }" class="form-control" required />
	</div>
	<div class="input-group">
		<span class="input-group-text">차량 번호</span>
		<input type="text" name="car_number" value="${dto.car_number }" class="form-control" required />
	</div>
	<div class="input-group">
		<span class="input-group-text">탑승 인원</span>
		<input type="text" name="car_capa" value="${dto.car_capa }" class="form-control" required />
	</div>
	<div class="input-group">
		<span class="input-group-text">내부 옵션</span>
		<textarea  name="car_option" required class="form-control">${dto.car_option }</textarea>
	</div>	
	<div class="input-group">
		<span class="input-group-text">세부 사항</span>
		<textarea  name="car_detail" required class="form-control">${dto.car_detail }</textarea>
	</div>
	<div class="input-group">
		<span class="input-group-text">대여 비용 (1일 기준)</span>
		<input type="text" name="car_rentprice" value="${dto.car_rentprice }" class="form-control" required />
	</div>
	
	<button type="submit" class="btn btn-primary">확인</button>
	</form>
			
</body>
</html>