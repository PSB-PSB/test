<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바 캠핑카 - 회원가입</title>
<%@ include file="../include/plugin.jsp" %>
<link href="${contextPath}/resources/css/sub_all.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
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
            //생년월일 유효성검사
				if($("#car_uyear").val()==""){
					alert("생년월일을 입력해주세요.");
					$("#m_brith").focus();
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

<style>
	/* 중복아이디 존재하지 않는경우 */
	.id_input_re_1{
		color : green;
		display : none;
	}
	/* 중복아이디 존재하는 경우 */
	.id_input_re_2{
		color : red;
		display : none;
	}
	.pw_input_re_1{
		color : green;
		display :none;
	}
	.input-group{
		padding: 15px;
	}
	h1{
	margin-left: 30px;
	}
	form{
		padding: 15px;
	}
	#submenu{
		margin-bottom: 15px;
	}
	.id_input_re_1{
		display:none;
		position: absolute;
    	left: 20px;
    	top: 55px;
		position: absolute;
	}
	.two{
    	left: 20px;
    	top: 55px;
	}
	.btn-primary{
	background: #E9ECEF;
	color:#212529;
	border: 1px solid #ccc;
	}
	.btn-primary:hover{
		background: #E9ECEF;
	color:#212529;
	}
	.input-bu{
	margin-left:15px; 
	}
	.pw_input_re_1{
		position: absolute;
		left: 20px;
    	top: 55px;
	}
</style>
</head>
<body>

<div id="container">
	<!-- #header start -->
	<%@ include file="../include/header.jsp" %>
	<!--// #header end -->
	
	<div id="body_head">
		<h2>회원가입</h2>
		<div class="location">
			HOME　<i class="fa-solid fa-circle-chevron-right"></i> 　<span>회원가입</span>
		</div>
	</div>
	
	<div id="wrap">
	<div id="submenu">
			<ul>
				<li class="on"><a href="#">회원가입</a></li>
			</ul>
		</div>
		<h1>
	회원가입  
</h1>
<form method="post" action="join">
      
   <div class="input-group">
      <span class="input-group-text">아이디</span>
      <input type="text" class="car_uid form-control id_input" id="car_uid" name="car_uid" placeholder="아이디" value = ${list.car_uid }>
      <!-- 아이디 중복확인 -->
		<span class="id_input_re_1 two">사용 가능한 아이디입니다.</span>
		<span class="id_input_re_2 two">아이디가 이미 존재합니다.</span>
		<br>
		<!-- 아이디 중복확인 스크립트 -->
		<script>
			$('.id_input').on("propertychange change keyup paste input", function(){
				var memberId = $('.id_input').val();	 // .id_input에 입력되는 값
				var data = {memberId : memberId}		// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
				
				$.ajax({
					type : "post",
					url : "memberIdChk",
					data : data,
					success : function(result){
						//console.log("성공 여부" + result);
						if(result != "fail"){
							$('.id_input_re_1').css("display", "inline-block");
							$('.id_input_re_2').css("display", "none");
						}else{
							$('.id_input_re_2').css("display","inline-block");
							$('.id_input_re_1').css("display", "none");
						}
					} //success종료
				}); //ajax 종료
			}); //function 종료
		</script>
   </div>
   <div class="input-group">
      <span class="input-group-text">비밀번호</span>
      <input type="password" class="car_uid form-control" id="car_upw" name="car_upw" placeholder="비밀번호">
      <span class="input-group-text">비밀번호 확인</span>
		<input type="password" class="car_uid form-control" id="upw_c" name="upw_c" placeholder="비밀번호확인">
		<span class="pw_input_re_1">비밀번호가 일치 합니다.</span><br>
		<!-- 비밀번호 중복체크 -->
		<script>
			//비밀번호 확인 
			$(function(){			
				$('#upw_c').blur(function(){
					if($('#car_upw').val() != $('#upw_c').val()){
						if($('#upw_c').val() != ''){
							 alert("비밀번호가 일치하지 않습니다.");
					    	    $('#upw_c').val('');
					          $('#upw_c').focus();
						}
					}else{
							$('.pw_input_re_1').css("display","inline-block");
						
					}
				});
			});   
		</script>
   </div>
   <div class="input-group">
      <span class="input-group-text">이름</span>
      <input type="text" class="car_uid form-control" id="car_uname" name="car_uname" placeholder="이름" value = ${list.car_uname }>
   </div>
   <div class="input-group">
      <span class="input-group-text">생년월일</span>
      <input type="date" class="car_uid form-control" id="car_uyear" name="car_uyear" placeholder="생년월일" value = ${list.car_uyear }>
   </div>
   <div class="input-group">
      <span class="input-group-text">이메일</span>
      <input type="text" class="car_uid form-control" id="car_uemail" name="car_uemail" placeholder="이메일"  value = ${list.car_uemail }>
   </div>
   <div class="input-group">
      <span class="input-group-text">주소</span>
      <input type="text" class="car_uid form-control" id="car_uaddr" name="car_uaddr" placeholder="주소" value = ${list.car_uaddr } >
   </div>
   <div class="input-group">
      <span class="input-group-text">핸드폰</span>
      <input type="text" class="car_uid form-control" id="car_uphone" name="car_uphone" placeholder=" '-' 없이 입력해주세요 " value = ${list.car_uphone }>
   </div>
    <script>
		$(document).on("keyup", "#car_uphone", function() { 
			$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
		});
	</script>
   <div class="input-group">
      <span class="input-group-text">운전면허번호</span>
      <input type="text" class="car_uid form-control" id="car_udriverid" name=car_udriverid placeholder="운전등록번호" value = ${list.car_udriverid }><br>
   </div>
   
      <select name="car_ptype" style="margin-left: 15px; width: 97.5%;"  class="form-select form-select-sm" aria-label=".form-select-sm example">
		<option>선호 차량</option>
		<option value="zeus560A">제우스560 A / 4 ~ 5인취침</option>
		<option value="zeus640B">제우스640 B / 5 ~ 6인취침</option>
		<option value="zeus640C">제우스640 C / 5 ~ 6인취침</option> 
		<option value="zeus640D">제우스640 D / 5 ~ 6인취침</option>
		<option value="zeus640E">제우스640 E / 5 ~ 6인취침</option>
		<option value="zeus640F">제우스640 F / 5 ~ 6인취침</option>
	</select><br>
	<div class="input-bu">
		<input class="btn btn-primary" type="submit" value="회원가입" id="join">
		<input class="btn btn-primary" type="reset" value="다시쓰기" id="cencle">
	</div>
	</form>
	</div>
<hr>




		

	</div><!-- // #wrap end -->
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