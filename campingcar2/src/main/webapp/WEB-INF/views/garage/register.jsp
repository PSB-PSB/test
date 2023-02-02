<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script>

$(document).ready(function(){  
     
       //아이디 유효성검사
    $("#register").on("click", function(){
    	
       if($("#garage_name").val()==""){
          alert("정비소명을 입력해주세요.");
          $("#garage_name").focus();
          return false;
       }
       //비밀번호 유효성검사
       if($("#garage_addr").val()==""){
          alert("주소를 입력해주세요.");
          $("#garage_addr").focus();
          return false;
       }
       //이름 유효성검사
       if($("#garage_code").val()==""){
          alert("지역을 선택해주세요.");
          $("#garage_code").focus();
          return false;
       }
      
       alert('정비소 등록신청이 완료되었습니다')
    });
 })
</script>
<meta charset="UTF-8">
<title>자바 캠핑카 - 정비소 등록신청</title>
<%@ include file="../include/plugin.jsp" %>
<link href="${contextPath}/resources/css/sub_all.css" rel="stylesheet" />
</head>
<body>

<div id="container">
	<!-- #header start -->
	<%@ include file="../include/header.jsp" %>
	<!--// #header end -->
	
	<div id="body_head">
		<h2>정비소 등록신청</h2>
		<div class="location">
			정비소 <i class="fa-solid fa-circle-chevron-right"></i> 　<span>정비소 등록신청</span>
		</div>
	</div>
	
	<div id="wrap">
		<div id="submenu">
			<ul>
				<li class="on"><a href="#">정비소 등록양식</a></li>
			</ul>
		</div>
		
		<div id="body_contents">
<!-- ================================================== -->

<div class="board_write">
	<form action="register" method="post">
		
	<div class="input-group">
		<span class="input-group-text">정비소 명</span>
		<input type="text" class="form-control" id="garage_name" name="garage_name"  placeholder="정비소명 입력"/>
	</div>
		
	<div class="input-group">
		<span class="input-group-text">정비소 주소</span>
		<input type="text" class="form-control" id="garage_addr" name="garage_addr"  placeholder="정비소 주소 입력" />
	</div>
	<div class="input-group">
		<span class="input-group-text">정비소 연락처</span>
		<input type="text" class="form-control" name="garage_phone" placeholder="정비소 연락처 입력" />
	</div>
	<div class="input-group">
		<span class="input-group-text">정비소 영업상태</span>
		<select name="garage_state" size="1">
			<option value="1"> 영업중 </option>
			<option value="2"> 휴업중 </option>
		</select>		
	</div>
	<div class="input-group">
		<span class="input-group-text">정비소 지역</span>	
					<select id="garage_code" name="garage_code" size="1">			
							<option value="">지역을 선택하세요.</option>
							<option value="41820">가평군</option>
							<option value="41610">경기광주시</option>
							<option value="41280">고양시</option>
							<option value="41290">과천시</option>
							<option value="41210">광명시</option>
							<option value="41310">구리시</option>
							<option value="41410">군포시</option>
							<option value="41570">김포시</option>
							<option value="41360">남양주시</option>						
							<option value="41250">동두천시</option>
							
							<option value="41190">부천시</option>
							<option value="41130">성남시</option>
							<option value="41110">수원시</option>
							<option value="41390">시흥시</option>
							<option value="41270">안산시</option>
							<option value="41170">안양시</option>
							<option value="41630">양주시</option>
							<option value="41830">양평군</option>
							
							<option value="41670">여주시</option>
							<option value="41800">연천군</option>
							<option value="41370">오산시</option>
							<option value="41460">용인시</option>
							<option value="41430">의왕시</option>
							<option value="41150">의정부시</option>
							<option value="41500">이천시</option>
							<option value="41480">파주시</option>
							<option value="41220">평택시</option>
							<option value="41650">포천시</option>
							<option value="41450">하남시</option>
							<option value="41590">화성시</option>						
					</select>
						
	</div>
						
	<div class="input-group" style="display: none;">
		<span class="input-group-text">정비소등록상태</span>
		<input type="text" class="form-control" name="state_modify" value="0"/>
	</div>
	
		<button type="submit" id="register">정비소 등록하기</button>
	</form>
</div>	



<!-- ================================================== -->
		</div> <!-- // #body_contents end -->
	</div><!-- // #wrap end -->
	
	<div id="footer">
	</div>
</div><!-- // #container end -->

</body>
</html>