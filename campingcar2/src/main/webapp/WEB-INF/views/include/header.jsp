<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<style>
.dropmenu{
	background-color: transparent;
	border-color: transparent;
	width: 250px;	
}
.one{
	display: inline-block;
}

</style>
<div id="header_outer">
<div id="header">
	<div id="gnb">
	<ul>
	
		<li><a href="${contextPath }/rent/join">회원가입</a>　
	<c:if test="${user.car_uid == null}">
		<a class="one" href="${contextPath }/rent/login">로그인</a>
	</c:if>
	
	<c:if test="${user.car_uid != null}">
		<a class="nav-link one" href="car/logout">로그아웃</a>
	</c:if>
	
	<c:if test="${user.car_uid == 'root'}">
		<a class="one" href="${contextPath }/admin/" target="_blank">관리자</a>
	</c:if>
	</ul>
	<h1><a href="${contextPath }/"><img src="${contextPath }/resources/img/header/logo.png" alt="자바 캠핑카" /></a></h1>
	<div id="topmenu">
		<ul>
			<li><a href="#">회사 소개</a></li>
			<li><a href="${contextPath }/car/list">보유 차량</a></li>
			<li><a href="${contextPath }/rent/list">실시간 예약</a></li>
			<li><a href="#">예약 확인</a></li>
			<li class="dropdown" ><a class="dropdown-toggle" data-bs-toggle="dropdown"			
			aria-expanded="false" href="#">정비소</a>			
			<ul class="dropdown-menu dropmenu" >
				<li><a style="padding: 5px 5px 15px 25px"; href="${contextPath }/garage/list">정비소 검색</a></li>
				<li><a style="padding: 5px 5px 15px 25px"; href="${contextPath }/garage/register">정비소 등록신청</a></li>
				<li><a style="padding: 5px 5px 15px 25px"; href="${contextPath }/admin/garage/register">정비소 등록신청 현황</a></li>
				<li><a style="padding: 5px 5px 15px 25px"; href="${contextPath }/admin/garage/update">정비소 정보 수정 및 삭제</a></li>				
			</ul>		
			</li>
			
			</li>
				<li><a href="#">커뮤니티</a></li>
				<li><a href="#">고객센터</a></li>
		</ul>
	</div>	
</div>
</div>