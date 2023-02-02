<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="action" value="register" />
<c:if test="${not empty dto.car_regid }">
	<c:set var="action" value="modify" />
</c:if>

<%
List<String> optionArr = new ArrayList<>();
optionArr.add("무시동 히터");
optionArr.add("바닥 난방");
optionArr.add("에어컨");
optionArr.add("냉장고");
optionArr.add("전자레인지");
optionArr.add("스마트TV");
optionArr.add("온수샤워");
optionArr.add("화장실");
optionArr.add("싱크대");
optionArr.add("침대");
optionArr.add("어닝");
optionArr.add("소화기");
optionArr.add("외부 CCTV");
pageContext.setAttribute("optionArr", optionArr);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바 캠핑카 - 관리자 페이지</title>
<%@ include file="../../include/plugin.jsp" %>
<link href="${contextPath}/resources/css/admin/admin_all.css" rel="stylesheet" />
<style>
.input-group-text {width:200px;}
.input-group {margin:0px 0px 5px 0px;}
.thumbnail {border:1px solid #dcdcdc; width:300px; margin:5px 0px 10px 0px;}
.thumbnail img {width:300px;}
.thumbnail p {padding:10px;}
.thumbnail p:nth-child(2) {padding-top:0px;}
</style>
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

<form action="${action }" method="post"  enctype="multipart/form-data" id="write">
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
	<span class="input-group-text">차량 상태</span>
	<p class="form-control">
		<input type="radio" name="car_state" value="1" <c:if test="${dto.car_state==1 }">checked</c:if> /> 사용 가능　
		<input type="radio" name="car_state" value="0" <c:if test="${dto.car_state==0 }">checked</c:if> /> 사용 불가　
	</p>
</div>
<div class="input-group">
	<span class="input-group-text">차량 대표 사진</span>
	<div class="form-control">
		<c:if test="${dto.car_file!=''}">
			<div class="thumbnail">
				<input type="hidden" name="car_file" value="${dto.car_file }" size="50" readonly />
				<img src="${contextPath }/resources/data/car/${dto.car_file }" alt="" />
				<p>${dto.car_file }</p>
				<p>첨부파일 삭제 <input type="checkbox" name="file_delete" value="1" /></p>
			</div>
		</c:if>
		<input type="file" name="file" />
		
	</div>
</div>

<div class="input-group">
	<span class="input-group-text">탑승 인원</span>
	<input type="text" name="car_capa" value="${dto.car_capa }" class="form-control" required />
</div>
<div class="input-group">
	<span class="input-group-text">내부 옵션</span>
	<!-- <textarea  name="car_option" required class="form-control">${dto.car_option }</textarea> -->
	<div class="form-control">
		<table class="table table-borderless">
		<tr class="align-top">
			<td>
				<c:set var="i" value="0" />
				<c:forEach items="${optionArr }" var="option">
					<p><input type="checkbox" name="car_option" value="${option }" <c:if test = "${fn:contains(dto.car_option, option)}">checked</c:if> /> ${option }</p>
					<c:set var="i" value="${i+1 }" />
					<c:if test="${i==5 }"></td><td></c:if>
					<c:if test="${i==9 }"></td><td></c:if>
				</c:forEach>
			</td>
		</tr>
		</table>
	</div>
</div>	
<div class="input-group">
	<span class="input-group-text">세부 사항</span>
	<textarea  name="car_detail" required class="form-control" rows="5">${dto.car_detail }</textarea>
</div>
<div class="input-group">
	<span class="input-group-text">대여 비용 (1일 기준)</span>
	<input type="text" name="car_rentprice" value="${dto.car_rentprice }" class="form-control" required />
</div>

<button type="submit">차량 등록</button>
</form>




<!-- ================================================== -->
	</div><!-- // #wrap end -->
</div><!-- // #container end -->

</body>
</html>