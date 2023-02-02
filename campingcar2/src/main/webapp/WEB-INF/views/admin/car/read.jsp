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


<h2>차량 조회</h2>

<table border="1" width="100%">
<colgroupd>
	<col width="20%" />
	<col width="*" />
</colgroupd>
<tr>
	<th>등록 번호</th><td>${dto.car_regid }</td>
</tr>
<tr>
	<th>대여 회사</th><td>${dto.car_rentcompid }</td>
</tr>
<tr>
	<th>모델 명</th><td>${dto.car_modelname }</td>
</tr>
<tr>
	<th>차량 이름</th><td>${dto.car_name }</td>
</tr>
<tr>
	<th>차량 번호</th><td>${dto.car_number }</td>
</tr>
<tr>
	<th>탑승 인원</th><td>${dto.car_capa }</td>
</tr>
<tr>
	<th>내부 옵션</th><td>${dto.car_option }</td>
</tr>
<tr>
	<th>세부 내용</th><td>${dto.car_detail }</td>
</tr>
<tr>
	<th>대여 비용 (1일 기준)</th><td>${dto.car_rentprice }</td>
</tr>
<tr>
	<th>등록 일</th><td>${dto.car_regdate }</td>
</tr>
</table>

<c:forEach items="${filelist }" var="file">
	<div><img src="${contextPath }/resources/data/car/${file.bf_source}" /></div>
</c:forEach>


<button onclick="location.href='list';">목록</button>
<button onclick="location.href='register?car_regid=${dto.car_regid }';">수정</button>

<!-- 모달&모달테스트 -->
		
		
		<c:if test="${repair.repair_no == null }">
		
		<button data-bs-target="#exampleModalToggle3" data-bs-toggle="modal">정비내역 등록</button>
		<div class="modal fade" id="exampleModalToggle3" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalToggleLabel2">정비내역 등록</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		
		<form action="repair/register" method="post">
		 
		      <div class="modal-body">		   
			    <table class="table table-bordered text-center tablemm">
			    	<tr style="display: none">
			    		<th class="table-dark thmm">차량ID</th>
			    		<th><input type ="text" id="car_regid" name="car_regid" value="${dto.car_regid }" readonly/></th>
			    	</tr>
			    	
			       	<tr>
		        		<th class="table-dark thmm">정비소명</th>
		        		<th><input type="text" id="garage_name" name="garage_name" value="${repair.garage_name }" /></th>
		        	</tr>
		        	<tr>
		        		<th class="table-dark thmm">차량명</th>
		        		<th><input type="text" id="car_name" name="car_name" value="${dto.car_name }" readonly /></th>
		        	</tr>
		        	<tr>
		        		<th class="table-dark thmm">렌트회사</th>
		        		<th><input type="text" id="comp_name" name="comp_name" value="${repair.comp_name }" /></th>
		        		
		        	</tr>
		        	<tr>
		        		<th class="table-dark thmm">정비내역</th>
		        		
		        		<th>
		        		<textarea type="text" id="repair_info" name="repair_info" value="${repair.repair_info }">${repair.repair_info }</textarea>
		        		</th>
		        	</tr>
		        	<tr>
		        		<th class="table-dark thmm">정비일자</th>
		        		<th ><input type="date" id="repairdate" name="repair_date" /></th>		
				
		        	</tr>

		        	<tr>
		        		<th class="table-dark thmm">정비비용(원)</th>
		        		<th><input type="text" id="repair_price" name="repair_price" value="${repair.repair_price }"/></th>
		        	</tr>
		        	<tr>
		        		<th class="table-dark thmm">추가정비내역</th>
		        		<th><input type="text" id="repair_addinfo" 	 name="repair_addinfo" value="${repair.repair_addinfo }" /></th>
		        	</tr>
		        	
				
		        </table>
		      </div>
			
		      <div class="modal-footer">
			    <button class="btn btn-success" type="submit" name="submit">등록</button>
			    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
			    </div>
			</form>
			</div>
		</div>
	</div>
			
		
		
		
		
		
		</c:if>
		<c:if test="${repair.repair_no !=null }">
	    <button data-bs-target="#exampleModalToggle2" data-bs-toggle="modal">정비내역 수정</button>
		</c:if>
		
		<div class="modal fade" id="exampleModalToggle2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalToggleLabel2">정비내역 수정</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		        	
		        	<!-- 모달2(수정폼) -->
		   <form method="post"  >
		      <div class="modal-body">		   
			    <table class="table table-bordered text-center tablemm";>
			       	<tr>
		        		<th class="table-dark thmm">정비소명</th>
		        		<th><input type="text" id="garage_name" name="garage_name" value="${repair.garage_name }"/></th>
		        	</tr>
		        	<tr>
		        		<th class="table-dark thmm">차량명</th>
		        		<th id="car_name" name="car_name" value="${dto.car_name }">${dto.car_name } </th>
		        	</tr>
		        	<tr>
		        		<th class="table-dark thmm">렌트회사</th>
		        		<th><input type="text" id="comp_name" name="comp_name" value="${repair.comp_name }" /></th>
		        		
		        	</tr>
		        	<tr>
		        		<th class="table-dark thmm">정비내역</th>
		        		
		        		<th>
		        		<textarea style="width: 100%; height: 250px"; type="text" id="repair_info" name="repair_info" value="${repair.repair_info }">${repair.repair_info }</textarea>
		        		</th>
		        	</tr>
		        	<tr>
		        		<th class="table-dark thmm">정비일자</th>
		        		<th ><input style="width: 70%" type="date" id="repairdate" name="repair_date" value="${repair.repair_date }" /></th>		
				
		        	</tr>

		        	<tr>
		        		<th class="table-dark thmm">정비비용(원)</th>
		        		<th><input type="text" id="repair_price" name="repair_price" value="${repair.repair_price }"/></th>
		        	</tr>
		        	<tr>
		        		<th class="table-dark thmm">추가정비내역</th>
		        		<th><input type="text" id="repair_addinfo" 	 name="repair_addinfo" value="${repair.repair_addinfo }" /></th>
		        	</tr>
		        	
				
		        </table>
		      </div>
			
		      <div class="modal-footer">
			    <button class="btn btn-success" type="submit" id="updatesubmit"
			    name="modify" value="${repair.car_regid }">수정완료</button>
			</form>
			    <form action="repair/remove" method="get">
				
			    <button type="submit" class="btn btn-danger" data-bs-dismiss="modal" 
			    name="car_regid" id="car_regid" value="${repair.car_regid }">내역 삭제</button>
			    </form>
		   
		       	
			    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
			   	
				
		        
		      </div>
			
		    </div>
		  </div>
		</div>
		
		
		
				
		
	
		<!-- 모달끝 -->





<form action="remove" method="post">
	<input type="text" name="car_regid" value="${dto.car_regid }" />
	<button type="submit">삭제</button>
</form>
<!-- ================================================== -->
	</div><!-- // #wrap end -->
</div><!-- // #container end -->

</body>
</html>