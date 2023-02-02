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
<title>게시글 조회</title>
<%@ include file="../include/plugin.jsp" %>
<link href="${contextPath}/resources/css/sub_all.css" rel="stylesheet" />
</head>
<body>

<div id="container">
	<!-- #header start -->
	<%@ include file="../include/header.jsp" %>
	<!--// #header end -->
	
	<div id="body_head">
	</div>
	
	<div id="wrap">
		<div id="submenu">
			내용
		</div>
		
		<div id="body_contents">
<!-- ================================================== -->

<div>
내용
</div>
<button class="btn btn-primary" id="btn-list">목록</button>

<script>
document.querySelector("#btn-list").addEventListener("click",function(e){
	location.href="list?bo_table=${param.bo_table}&${pageRequestDTO.link }";
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