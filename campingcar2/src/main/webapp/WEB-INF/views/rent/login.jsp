<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
		$(function(){
			$("#btnLogin").click(function(){
			 userid=$("#car_uid").val();
				 var passwd=$("#car_upw").val(); if(userid == ""){
		  		alert("아이디를 입력하세요");
		  		$("#car_uid").focus(); //입력포커스 이동
		  return; //함수 종료
		}
		if(passwd==""){
			 alert("비밀번호를 입력하세요"); 
			 $("#car_upw").focus();
			  return;
		}
		
				//폼 내부의 데이터를 전송할 주소
			 document.form1.action= "/rent/login";
			 document.form1.submit(); //제출
			 });
		});
	</script>


<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<h2>로그인하기</h2>
	<form name="form1" method="post">
			<table border="1" width="400px">
				<tr>
					 <td>아이디</td>
					 <td><input id="car_uid" name="car_uid"></td>
				</tr>
				<tr>
					 <td>비밀번호</td>
					 <td><input type="password" id="car_upw" name="car_upw"></td>
				</tr>
				<tr>
					 <td colspan="2" align="center">
					 <button type="button" id="btnLogin">로그인 </button>				
				</td>
				</tr>
			</table>
		</form>
 

</body>
</html>