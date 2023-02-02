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
<script>
window.addEventListener('load',function(){
	window.scrollTo(0,1100);
}); //자동으로 스크롤내려주기

	function search(){
			var $keyword = $('#keyword');
			$('#searchBtn').on('click',function(){
				var keywordVal = $keyword.val();
				var url = "list?page=1"
					+ "&perPageNum=" + "${pageMaker.cri.perPageNum}"			
					+ "&keyword=" + encodeURIComponent(keywordVal);
				window.location.href = url;			
			})	
	}
</script>
</head>
<body>

<div id="container">
	<!-- #header start -->
	<%@ include file="../include/header.jsp" %>
	<!--// #header end -->
	
	<div id="body_head">
		<h2>정비소 검색</h2>
		<div class="location">
			HOME　<i class="fa-solid fa-circle-chevron-right"></i>　
			<span>정비소 검색</span>
		</div>
	</div>
	
	<div id="wrap">
		<div id="submenu">
			<ul>
				<li class="on"><a href="#">정비소 검색</a></li>
				<li><a href="#">서브 메뉴</a></li>
				<li><a href="#">서브 메뉴</a></li>
				<li><a href="#">서브 메뉴</a></li>
				<li><a href="#">서브 메뉴</a></li>
			</ul>
		</div>
		
<h2 style="text-align: center; padding: 30px 0px 0px 0px;">정비소 검색</h2>

		<div id="body_contents" style="padding: 30px 0px 60px 0px"; >
<!-- ================================================== -->
<div class="container" id="map" style="width:700px;height:400px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=08c7f5459534f8433e8a8e73d7707bc1&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

	
function garage_search(a,b) {
// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();
// 주소로 좌표를 검색합니다
geocoder.addressSearch(a, function(result, status) {
    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {
        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });
        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content:'　'+b
        });
        infowindow.open(map, marker);
        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
}
</script>

<div   class="container text-center" > <br>

	
		<table id="garagetable"class="table table-bordered text-center";>
	  	<thead class="table-dark theadmm">

			<tr>
			<!-- 관리자용 수정탭 -->
				<th style="width: 30px;">수정/삭제</th>
				<c:if test="${admin==1}"> 
				</c:if>
				
				<th style="width: 100px;">정비소명</th>
				<th style="width: 150px;">주소</th>
				<th style="width: 50px;">전화번호</th>
				<th style="width: 50px;">영업상태</th>
				<th style="width: 50px;">위치</th>
			</tr>
		  </thead>
	<c:forEach items="${list }" var="GarageDTO">
		<c:if test="${GarageDTO.state_modify == 1 }">
		<tr id=resultgarage>
			
			<!-- 
			<th>
			<a href="/listcri${pageMaker.makeQuery(pageMaker.cri.page)}&garage_no=${GarageDTO.garage_no }">	${GarageDTO.garage_name }</a></th>
			</th>
			  -->
			 
			 
			 <!-- 관리자용 수정버튼 --> 
  			<c:if test="${admin==1}">
			</c:if>
			<th>			
			<button type="button" class="btn btn-primary btn-sm" 
			 onclick='location.href="${contextPath}/admin/garage_admin/garage_update?garage_no=${GarageDTO.garage_no}"'>수정</button>
			<button type="button" class="btn btn-danger btn-sm"
			onclick='location.href="${contextPath}/admin/garage_admin/garage_delete?garage_no=${GarageDTO.garage_no}"'>삭제</button>
			</th>
			
			
			
			<th>${GarageDTO.garage_name }</th>
			<th>${GarageDTO.garage_addr }</th>
			<th>${GarageDTO.garage_phone}</th>
			<th>
			<c:choose>
			<c:when test="${GarageDTO.garage_state == 01 }">영업중</c:when>
			<c:when test="${GarageDTO.garage_state == 02 }">휴업중</c:when>		
			</c:choose>
			</th>
			<th>		
			 <!-- 카카오맵이용해서 창띄우기 
			<a href="https://map.kakao.com/link/search/${GarageDTO.garage_addr }" target="_blank">지도보기</a>
			-->
			<button type="button" class="btn btn-primary btn-sm" onclick="garage_search('${GarageDTO.garage_addr }','${GarageDTO.garage_name }')" >지도보기</button>
			</th>
			
		</tr>
	</c:if>
	</c:forEach>
		<c:if test="${empty list}">
		<th colspan="6">검색결과가 없습니다.</th>	
		</c:if>
	</table>
	
	
</div>

<c:if test="${pageMaker.cri.keyword !=null }">
	<div class="container text-center">
	 
		<ul>
			<c:if test="${pageMaker.prev }">			
				<a class="btn btn-outline-secondary" href = "list${pageMaker.makeSearch(pageMaker.startPage -1)}">&laquo;</a>				
			</c:if>		
				
			<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var = "idx">				
				<a class="btn btn-outline-secondary" href = "list${pageMaker.makeSearch(idx)}"  >${idx }</a>				
			</c:forEach>			
						
			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<a class="btn btn-outline-secondary " href = "list${pageMaker.makeSearch(pageMaker.endPage +1 )}">&raquo;</a>
			</c:if>
		</ul>
				
</div>
</c:if>



<form name="search_garage" autocomplete="on">
	<div class="container text-center"> 
		
	<input  type="search" id="keyword" name="keyword" 
					value="${pageMaker.cri.keyword}" placeholder="정비소를 검색하세요"/>
				<button id="searchBtn" class="btn btn-primary">검색</button>
				
	</div>
</form>




 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<!-- ================================================== -->		
		</div> <!-- // #body_contents end -->
	</div><!-- // #wrap end -->
	
	<div id="footer">
	</div>
</div><!-- // #container end -->

</body>
</html>