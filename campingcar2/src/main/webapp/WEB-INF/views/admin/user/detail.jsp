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
<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<title>Insert title here</title>
<%@ include file="../../include/plugin.jsp" %>
<link href="${contextPath}/resources/css/admin/admin_all.css" rel="stylesheet" />
<style>
	h1{
		margin-bottom: 50px;
	}
</style>
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
 
 <!-- #sidebar start -->
	<%@ include file="../include/sidebar.jsp" %>
	<!-- // #sidebar end -->

	<!-- #topmenu start -->
	<%@ include file="../include/topmenu.jsp" %>
	<!-- // #topmenu end -->		
	
	<div id="wrap">
<h1>회원정보</h1>
   
	<table class="table">
  <thead>
    <tr>
      <th scope="col">이름</th>
      <th scope="col">아이디</th>
      <th scope="col">운전면허번호</th>
      <th scope="col">생년월일</th>
      <th scope="col">주소</th>
      <th scope="col">이메일</th>
      <th scope="col">핸드폰</th>
      <th scope="col">포인트</th>
      <th scope="col">가입날짜</th>
      <th scope="col">선호차량</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>${list.car_uname }</td>
      <td>${list.car_uid }</td>
      <td>${list.car_udriverid }</td>
      <td>${list.car_uyear }</td>
      <td>${list.car_uaddr }</td>
      <td>${list.car_uemail }</td>
      <td>${list.car_uphone }</td>
      <td>${list.car_upoint }</td>
      <td>${list.car_pdate }</td>
      <td>${list.car_ptype }</td>
    </tr>
  </tbody>
</table>
<div class="box-footer">
         <button class="btn btn-success">메인</button>
         <button class="btn btn-warning">수정</button>
         <button class="btn btn-danger">삭제</button>
         <button class="btn btn-primary">목록</button>
      </div>
      <script>
   $(function(){
      //메인 버튼을 눌렀을 때 처리
      $(".btn-success").click(function(){
         location.href="../";
      });
      //목록 버튼을 눌렀을 때 처리
      $(".btn-primary").click(function(){
         location.href="list?keyword=";
      });
      //삭제 버튼을 눌렀을 때 처리
      $(".btn-danger").click(function(){
         location.href="delete?car_uno="+ ${list.car_uno};
      });
      //수정 버튼을 눌렀을 때 처리   
      $(".btn-warning").click(function(){
         location.href="update?car_uno=" + ${list.car_uno};
      });
   })
   </script>
   </div>
</body>
</html>