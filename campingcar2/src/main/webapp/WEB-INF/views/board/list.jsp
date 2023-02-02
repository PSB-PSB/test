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
<title>게시판 목록</title>
<%@ include file="../include/plugin.jsp" %>
<link href="${contextPath}/resources/css/sub_all.css" rel="stylesheet" />
</head>
<body>

<div id="container">
	<!-- #header start -->
	<%@ include file="../include/header.jsp" %>
	<!--// #header end -->
	
	<div id="body_head">
		<h2>일반 게시판</h2>
		<div class="location">
			HOME　<i class="fa-solid fa-circle-chevron-right"></i>　
			<span>일반 게시판</span>
		</div>
	</div>
	
	<div id="wrap">
		<div id="submenu">
			<ul>
				<li class="on"><a href="#">서브 메뉴</a></li>
				<li><a href="#">서브 메뉴</a></li>
				<li><a href="#">서브 메뉴</a></li>
				<li><a href="#">서브 메뉴</a></li>
				<li><a href="#">서브 메뉴</a></li>
			</ul>
		</div>
		
		<div id="body_contents">
<!-- ================================================== -->

<table class="table table-bordered">
<tbody>
<c:forEach items="${responseDTO.dtoList }" var="dto">
<tr>
	<th>${dto.wr_id }</th>
	<td><a href="${contextPath }/board/read?bo_table=${param.bo_table }&wr_id=${dto.wr_id}&${pageRequestDTO.link}">${dto.wr_subject }</a></td>
	<td>${dto.wr_name }</td>
	<td>${dto.wr_datetime }</td>
	<td>${dto.wr_hit }</td>
</tr>
</c:forEach>
</tbody>
</table>

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

<div class="board_bot">
<button onclick="location.href='${contextPath}/board/register?bo_table=${param.bo_table }';" class="btn btn-primary">글쓰기</button>
</div>

<div class="search">
<form action="list" method="get">
<input type="hidden" name="bo_table" value="${param.bo_table }" />
<input type="hidden" name="size" value="" />
<input type="hidden" name="" value="" />
<input type="hidden" name="" value="" />
</form>
</div>

<script>
document.querySelector(".pagination").addEventListener("click", function(e){
	e.preventDefault();
	e.stopPropagation();
	const target = e.target;
	if(target.tagName!=='A'){
		return
	}
	const num = target.getAttribute("data-num");
	self.location = `list?bo_table=${param.bo_table}&page=\${num}`
},false);
</script>

<!-- ================================================== -->		
		</div> <!-- // #body_contents end -->
	</div><!-- // #wrap end -->
	
	<div id="footer">
	</div>
</div><!-- // #container end -->

</body>
</html>