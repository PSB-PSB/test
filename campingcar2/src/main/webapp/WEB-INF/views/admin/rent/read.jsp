<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="category.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바 캠핑카 - 관리자 페이지</title>
<%@ include file="../../include/plugin.jsp" %>
<link href="${contextPath}/resources/css/admin/admin_all.css" rel="stylesheet" />
<style>

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
<c:if test="${empty dto }">
	<p>해당 글이 존재하지 않습니다.</p>
</c:if>

<c:if test="${not empty dto }">
<div class="board_view">
<table class="table table-bordered">
<colgroup>
	<col width="15%" />
	<col width="35%" />
	<col width="15%" />
	<col width="35%" />
</colgroup>
<thead>
<tr>
	<th colspan="4" class="state type0${dto.rent_paystate }">#${dto.rent_id } <span>${cateArr[dto.rent_paystate] }</span></th>
</tr>
</thead>
<tbody>


<tr>
	<th>상태 변경</th>
	<td>
		<form action="read" method="post">
		<input type="hidden" name="rent_id" value="${dto.rent_id }" />	
		<input type="hidden" name="listtype" value="${param.listtype }" />
		<select name="rent_paystate">
		<c:forEach items="${cateArr }" var="cate">
			<option value="${cate.key }" ${dto.rent_paystate eq cate.key?"selected":"" }>${cate.value }</option>	
		</c:forEach>
		</select>
		<button type="submit">상태 변경</button>
		</form>
	</td>
	<th>예약 취소</th>
	<td>
		<form action="remove" method="post" id="remove">
		<input type="hidden" name="rent_id" value="${dto.rent_id }" />
		<input type="hidden" name="listtype" value="${param.listtype }" />
		<a class="btn btn-danger" href="#" role="button" onclick="confirmAlert();">예약 취소</a>
		</form>
	</td>
</tr>
<script>
function confirmAlert(){
	if(confirm("해당 예약을 취소하시겠습니까?\r\n한번 삭제한 예약글은 복구할 수 없습니다.")){
		$("#remove").submit();
	}else{
		return;
	}
}
</script>

<tr><th>차량 정보</th><td colspan="3">(${dto.car.car_regid }) ${dto.car.car_modelname } ${dto.car.car_name }</td></tr>
<tr><th>예약자</th><td>${dto.user_id }</td><th>유저 ID</th><td>${dto.user_id }</td></tr>
<tr><th>필수 연락처</th><td>${dto.rent_phone1 }</td><th>예비 연락처</th><td>${dto.rent_phone2 }</td></tr>
<tr><th>차량 출고일</th><td>${dto.rent_startdate }</td><th>차량 반납일</th><td>${dto.rent_enddate }</td></tr>
<tr><th>옵션1</th><td>${dto.rent_option1 }</td><th>옵션2</th><td>${dto.rent_option1 }</td></tr>
<tr>
	<th>결제 비용</th><td>${dto.rent_price }</td>
	<th>결제 유형</th>
	<td>
		<c:choose>
			<c:when test="${dto.rent_paytype==0 }"><p>무통장 입금</p></c:when>
			<c:when test="${dto.rent_paytype==1 }"><p>신용 카드</p></c:when>
		</c:choose>			
	</td>
</tr>
<tr><th>추가 내용</th><td colspan="3">${dto.rent_memo }</td></tr>
</tbody>
</table>
</div>
</c:if>

<button onclick="location.href='${param.listtype}';" class="btn btn-primary">목록</button>
<!-- ================================================== -->
	</div><!-- // #wrap end -->
</div><!-- // #container end -->

</body>
</html>