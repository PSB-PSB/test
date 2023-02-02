<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>자바 캠핑카 - 정비소 등록신청</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<title>Insert title here</title>
<%@ include file="../../include/plugin.jsp" %>
<link href="${contextPath}/resources/css/admin/admin_all.css" rel="stylesheet" />

<script>
		$(document).ready(function(){
			// 취소
			$("#cencle").on("click", function(){
			location.href = "${contextPath }/";
			})
		     
            //아이디 유효성검사
			$("#join").on("click", function(){
				if($("#car_uid").val()==""){
					alert("아이디를 입력해주세요.");
					$("#car_uid").focus();
					return false;
				}
            //비밀번호 유효성검사
				if($("#car_upw").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#car_upw").focus();
					return false;
				}
            //이름 유효성검사
				if($("#car_uname").val()==""){
					alert("이름을 입력해주세요.");
					$("#car_uname").focus();
					return false;
				}
            //핸드폰번호 유효성검사
				if($("#car_uphone").val()==""){
					alert("핸드폰번호를 입력해주세요.");
					$("#m_phone").focus();
					return false;
				}
            //주소 유효성검사
				if($("#m_addr").val()==""){
					alert("주소를 입력해주세요.");
					$("#car_uaddr").focus();
					return false;
				}
			});
		})
	</script>
	
	
</head>
<body>
 <!-- #sidebar start -->
	<%@ include file="../include/sidebar.jsp" %>
	<!-- // #sidebar end -->

	<!-- #topmenu start -->
	<%@ include file="../include/topmenu.jsp" %>
	<!-- // #topmenu end -->		
<div id="container">
   <!-- #header start -->
   <!--// #header end -->
   

   
   <div id="wrap">
      <h1>회원 정보 수정</h1>
      
      <div id="body_contents">
<!-- ================================================== -->

<div class="board_write">
   <form action="update" method="post">
      
   <div class="input-group">
      <span class="input-group-text">회원번호</span>
      <input type="text" id="car_uno" name="car_uno"  value = ${list.car_uno } readonly>
   </div>
      
   <div class="input-group">
      <span class="input-group-text">아이디</span>
      <input type="text" id="car_uid" name="car_uid" placeholder="아이디" value = ${list.car_uid } readonly>
   </div>
   <div class="input-group">
      <span class="input-group-text">비밀번호</span>
      <input type="password" id="car_upw" name="car_upw" placeholder="비밀번호">
   </div>
   <div class="input-group">
      <span class="input-group-text">이름</span>
      <input type="text" id="car_uname" name="car_uname" placeholder="이름" value = ${list.car_uname } readonly/>
   </div>
   <div class="input-group">
      <span class="input-group-text">생년월일</span>
      <input type="date" id="car_uyear" name="car_uyear" placeholder="생년월일" value = ${list.car_uyear } readonly>
   </div>
   <div class="input-group">
      <span class="input-group-text">이메일</span>
      <input type="text" id="car_uemail" name="car_uemail" placeholder="이메일"  value = ${list.car_uemail }>
   </div>
   <div class="input-group">
      <span class="input-group-text">주소</span>
      <input type="text" id="car_uaddr" name="car_uaddr" placeholder="주소" value = ${list.car_uaddr } >
   </div>
   <div class="input-group">
      <span class="input-group-text">핸드폰</span>
      <input type="text" id="car_uphone" name="car_uphone" placeholder=" '-' 없이 입력해주세요 " value = ${list.car_uphone }>
   </div>
   <div class="input-group">
      <span class="input-group-text">운전면허번호</span>
      <input type="text" id="car_udriverid" name=car_udriverid placeholder="운전등록번호" value = ${list.car_udriverid } readonly><br>
   </div>
   
      <select name="car_ptype" style="margin-bottom: 10px">
		<option>선호 차량</option>
		<option value="zeus560A">제우스560 A / 4 ~ 5인취침</option>
		<option value="zeus640B">제우스640 B / 5 ~ 6인취침</option>
		<option value="zeus640C">제우스640 C / 5 ~ 6인취침</option> 
		<option value="zeus640D">제우스640 D / 5 ~ 6인취침</option>
		<option value="zeus640E">제우스640 E / 5 ~ 6인취침</option>
		<option value="zeus640F">제우스640 F / 5 ~ 6인취침</option>
	</select><br>
		<input type="submit" value="수정완료" id="update">
		<input type="reset" value="다시쓰기" id="cencle">
   </form>
</div>   



<!-- ================================================== -->
      </div> <!-- // #body_contents end -->
   </div><!-- // #wrap end -->
   
   <div id="footer">
   </div>
</div><!-- // #container end -->

</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
window.onload = function(){
    document.getElementById("car_uaddr").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("car_uaddr").value = data.address; // 주소 넣기
                document.querySelector("input[name=car_uphone]").focus(); //상세입력 포커싱
            }
        }).open();
    });
}
 

</script>
</html>