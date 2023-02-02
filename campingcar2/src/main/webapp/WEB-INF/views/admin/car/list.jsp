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

<div class="board_list">
<table width="100%" class="table table-bordered center table-hover">
<colgroup>
</colgroup>
<thead>
<tr class="table-secondary">
	<th>#</th>
	<th>대여 회사</th>
	<th>모델명 / 차량 이름</th>
	<th>차량 번호</th>
	<th>수용 인원</th>
	<th>비용</th>
	<th>차량 등록일</th>
	<th>차량 상태</th>
</thead>
<tbody>
<c:forEach items="${responseDTO.dtoList }" var="dto">
<tr>
	<th>${dto.car_regid }</th>
	<td>${dto.car_rentcompid }</td>
	<td class="left"><a href="read?car_regid=${dto.car_regid }">${dto.car_modelname } <span>　|　</span> ${dto.car_name }</a></td>
	<td>${dto.car_number }</td>
	<td>${dto.car_capa }</td>
	<td class="right"><fmt:formatNumber value="${dto.car_rentprice }" pattern="#,###" /></td>
	<td>${dto.car_regdate }</td>
	<td>
		<c:choose>
			<c:when test="${dto.car_state==1 }"><p class="state type03">사용 가능</p></c:when>
			<c:when test="${dto.car_state==0 }"><p class="state type05">사용 불가</p></c:when>
		</c:choose>
	</td>
</tr>
</c:forEach>
</tbody>
</table>
</div>

<div class="board_bot">
	<nav aria-label="Page navigation">
		 <ul class="pagination justify-content-center">
		 	<c:if test="${responseDTO.prev }">
		 		<li class="page-item"><a class="page-link" data-num="${responseDTO.start-1 }"><i class="fa-solid fa-angle-left"></i></a></li>
		 	</c:if>
			<c:forEach begin="${responseDTO.start }" end="${responseDTO.end }" var="num">
				<li class="page-item ${responseDTO.page == num?"active":"" }"><a class="page-link" data-num="${num }">${num }</a></li>
			</c:forEach>
		 	<c:if test="${responseDTO.next }">
		 		<li class="page-item"><a class="page-link" data-num="${responseDTO.end+1 }"><i class="fa-solid fa-angle-right"></i></a></li>
		 	</c:if>
		</ul>
	</nav>
	<div>
		<button onclick="location.href='${contextPath}/admin/car/register';" class="btn btn-primary">차량 등록</button>
	</div>
</div>
<form action="list" method="get">
<input type="hidden" name="size" value="${pageRequestDTO.size }" />
<div class="search">
	<input type="checkbox" name="types" value="car_modelname" /> 모델명
	<input type="checkbox" name="types" value="car_name" /> 차량명
	<input type="text" name="keyword" class="form-control" value="" />
	<button type="submit">검색</button>
</div>
</form>

<script>
document.querySelector(".pagination").addEventListener("click", function(e){
	e.preventDefault();
	e.stopPropagation();
	const target = e.target;
	if(target.tagName!=='A'){
		return
	}
	const num = target.getAttribute("data-num");
	self.location = `list?page=\${num}`
},false);
</script>


<!-- ================================================== -->
	</div><!-- // #wrap end -->
</div><!-- // #container end -->

</body>
</html>