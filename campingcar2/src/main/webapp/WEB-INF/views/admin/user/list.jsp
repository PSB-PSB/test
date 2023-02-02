<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<title>Insert title here</title>
<%@ include file="../../include/plugin.jsp" %>
<link href="${contextPath}/resources/css/admin/admin_all.css" rel="stylesheet" />
<script>
   function search(){
         var $keyword = $('#keyword');
         $('#searchBtn').on('click',function(){
            var keywordVal = $keyword.val();
            var url = "listcri?page=1"
               + "&perPageNum=" + "${pageMaker.cri.perPageNum}"         
               + "&keyword=" + encodeURIComponent(keywordVal);
            window.location.href = url;         
         })   
   } 

</script>
<style>
	.table-style{
		margin: 0 auto;
		margin-top: 100px;
		text-align: center;
	}
	.t-style > tr > th{
		padding: 15px
	}
	.tb-style > tr > td{
		padding: 15px
	}
	.tb-style > tr > td > a{
		color:red;
	}
	.tb-style > tr > td > a:hover{
		color : #000;
	}
	.text-center{
		margin-top: 50px;
	}

</style>
</head>
<body>

	<!-- #sidebar start -->
	<%@ include file="../include/sidebar.jsp" %>
	<!-- // #sidebar end -->

	<!-- #topmenu start -->
	<%@ include file="../include/topmenu.jsp" %>
	<!-- // #topmenu end -->	
	
	<div id="wrap">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	<table class="table-style" border="1px">
		<thead class="t-style">
			<tr class="table-secondary">
				<th>회원번호</th>
				<th>운전면허 번호</th>
				<th>아이디</th>
				<th>생년월일</th>
				<th>이름</th>
				<th>주소</th>
				<th>이메일</th>
				<th>핸드폰 번호</th>
				<th>포인트</th>
				<th>가입날자</th>
				<th>선호차량</th>
			</tr>
		</thead>
		
		
	
	<c:if test="${pageMaker.cri.keyword != null }">
		<tbody class="tb-style">
			<c:forEach items="${list }" var = "list">
				<tr>
					<td>${list.car_uno}</td>
					<td>${list.car_udriverid }</td>
					<td><a href="detail?car_uno=${list.car_uno}"> ${list.car_uid } </a></td>
					<td>${list.car_uyear }</td>
					<td>${list.car_uname }</td>
					<td>${list.car_uaddr }</td>
					<td>${list.car_uemail }</td>
					<td>${list.car_uphone }</td>
					<td>${list.car_upoint }</td>
					<td>${list.car_pdate }</td>
					<td>${list.car_ptype }</td>
				</tr>
			</c:forEach>
		</tbody>
	</c:if>
	</table>
   <div class="container text-center">
    
      <ul>
         <c:if test="${pageMaker.prev }">
            <a class="btn btn-outline-secondary" href = "list${pageMaker.makeSearch(pageMaker.startPage -1)}">&laquo;</a>
            
         </c:if>      
            
         <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var = "idx">
                     
               <a class="btn btn-outline-secondary"  href = "list${pageMaker.makeSearch(idx)}">${idx }</a>
            
         </c:forEach>           
         
         <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
            <a class="btn btn-outline-secondary " href = "list${pageMaker.makeSearch(pageMaker.endPage +1 )}">&raquo;</a>
         </c:if>
      </ul>
</div>

            <form name="search_garage" autocomplete="on">
   <div class="container text-center"> 
      
   <input  type="search" id="keyword" name="keyword" 
               value="${pageMaker.cri.keyword}" placeholder="이름을 검색하세요"/>
            <button id="searchBtn" class="btn btn-primary">검색</button>
            
   </div>
</form>
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
   })
   </script>
   </div>
</body>
</html>