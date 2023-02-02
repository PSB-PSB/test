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

<div class="board_list">

<form action="list" method="get">

<div class="category">
	<a class="btn btn-outline-secondary" href="list">전체 목록</a>
	<c:forEach items="${cateArr }" var="cate">
		<a class="btn btn-outline-secondary" href="list?category=${cate.key }" role="button">${cate.value }</a>
	</c:forEach>
</div>

<table class="table table-bordered table-hover center">
<colgroup>
</colgroup>
<thead>
<tr class="table-secondary">
	<th>#</th>
	<th>차량</th>
	<th>예약자</th>
	<th>필수 연락처</th>
	<th>예비 연락처</th>
	<th>차량 출고일</th>
	<th>차량 반납일</th>
	<th>옵션1</th>
	<th>옵션2</th>
	<th>결제 비용</th>
	<th>결제 방법</th>
	<th>결제 상태</th>
</tr>
</thead>
<tbody>
<c:forEach items="${responseDTO.dtoList }" var="dto">
<tr onclick="location.href='read?rent_id=${dto.rent_id}&listtype=list';">
	<td>${dto.rent_id }</td>	
	<td>${dto.car_regid }</td>	
	<td>${dto.rent_name }</td>	
	<td>${fn:substring(dto.rent_phone1,0,3) }-${fn:substring(dto.rent_phone1,3,7) }-${fn:substring(dto.rent_phone1,7,11) }</td>	
	<td>${fn:substring(dto.rent_phone2,0,3) }-${fn:substring(dto.rent_phone2,3,7) }-${fn:substring(dto.rent_phone2,7,11) }</td>	
	<td>${dto.rent_startdate }</td>	
	<td>${dto.rent_enddate }</td>	
	<td><input type="checkbox" disabled <c:if test="${dto.rent_option1==1 }">checked</c:if> /></td>	
	<td><input type="checkbox" disabled <c:if test="${dto.rent_option1==2 }">checked</c:if> /></td>	
	<td class="right"><fmt:formatNumber value="${dto.rent_price }" pattern="#,###" /></td>	
	<td>
		<c:choose>
			<c:when test="${dto.rent_paytype==0 }"><p>무통장 입금</p></c:when>
			<c:when test="${dto.rent_paytype==1 }"><p>신용 카드</p></c:when>
		</c:choose>	
	</td>	
	<td>
		<p class="state type0${dto.rent_paystate }">${cateArr[dto.rent_paystate] }</p>
	</td>	
</tr>
</c:forEach>
</tbody>
</table>
</div>

<nav aria-label="Page navigation example">
	 <ul class="pagination">
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

<input type="hidden" name="size" value="${pageRequestDTO.size }" />
<div class="search">
	<input type="checkbox" name="types" value="rent_name" ${pageRequestDTO.checkType("rent_name")?"checked":"" } /> 예약자
	<input type="checkbox" name="types" value="rent_phone1" ${pageRequestDTO.checkType("rent_phone1")?"checked":"" } /> 핸드폰 번호
	<input type="text" name="keyword" class="form-control" value="${pageRequestDTO.keyword }" />
	차량 출고일
	<input type="date" name="from" class="form-control" value="${pageRequestDTO.from }" />
	<input type="date" name="to" class="form-control" value="${pageRequestDTO.to }" />
	예약 상태
	<select name="category">
		<option value="">선택</option>
		<option value="0" ${pageRequestDTO.category eq '0'?"selected":"" }>결제 대기</option>
		<option value="1" ${pageRequestDTO.category eq '1'?"selected":"" }>결제 완료</option>
		<option value="2" ${pageRequestDTO.category eq '2'?"selected":"" }>출고 대기</option>
		<option value="3" ${pageRequestDTO.category eq '3'?"selected":"" }>출고 완료</option>
		<option value="4" ${pageRequestDTO.category eq '4'?"selected":"" }>반납 완료</option>
	</select>
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