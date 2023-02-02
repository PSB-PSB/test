<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="title" value="정비소 등록 신청 현황" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바 캠핑카 - 관리자 페이지</title>
<%@ include file="../../include/plugin.jsp" %>
<link href="${contextPath}/resources/css/admin/admin_all.css" rel="stylesheet" />
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

<!-- kakao map + script api -->
<div class="container" id="map" style="width: 700px; height: 400px;"></div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=08c7f5459534f8433e8a8e73d7707bc1&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		function garage_search(a, b) {
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(a,
					function(result, status) {
						// 정상적으로 검색이 완료됐으면 
						if (status === kakao.maps.services.Status.OK) {
							var coords = new kakao.maps.LatLng(result[0].y,
									result[0].x);
							// 결과값으로 받은 위치를 마커로 표시합니다
							var marker = new kakao.maps.Marker({
								map : map,
								position : coords
							});
							// 인포윈도우로 장소에 대한 설명을 표시합니다
							var infowindow = new kakao.maps.InfoWindow({
								content : '　' + b
								
								
							});
							infowindow.open(map, marker);
							// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
							map.setCenter(coords);
						}
					});
		}
	</script> 
<!-- kakao map + script api end -->


<div class="board_list"><br>


<table class="table table-bordered table-hover center">
<colgroup>
</colgroup>
<thead>
<tr class="table-secondary">
	
	<th>정비소 명</th>
	<th>정비소 주소</th>
	<th>정비소 연락처</th>
	<th>영업 상태</th>
	<th>위치</th>
	<th>등록 여부</th>
	
</tr>
</thead>
<tbody>

<c:forEach items="${garage_reglist}" var="GarageDTO">
	
	<th name="garage_name" value="${GarageDTO.garage_name }">${GarageDTO.garage_name }</th>
	<th name="garage_addr" value="${GarageDTO.garage_addr }">${GarageDTO.garage_addr }</th>
	<th name="garage_phone" value="${GarageDTO.garage_phone }">${GarageDTO.garage_phone}</th>
	<th name="garage_state" value="${GarageDTO.garage_state }">
	<c:choose>
		<c:when test="${GarageDTO.garage_state == 01 }">영업중</c:when>
		<c:when test="${GarageDTO.garage_state == 02 }">휴업중</c:when>
	</c:choose></th>
	<th name="garage_code" value="${GarageDTO.garage_code }"
		style="display: none">${GarageDTO.garage_code}</th>
	<th>
	<button type="button" 
	onclick="garage_search('${GarageDTO.garage_addr }','${GarageDTO.garage_name }')">지도보기</button>
	</th>
	<th>							
		<button  type="button" 
		onclick='location.href="${contextPath}/admin/garage/insert?garage_no=${GarageDTO.garage_no}"'>등록완료
		</button>
	
		<button type="button" 
		onclick='location.href="${contextPath}/admin/garage/delete?garage_no=${GarageDTO.garage_no}"'>등록취소
		</button>
	</th>
	
	
</tr>
</c:forEach>
	<c:if test="${empty garage_reglist}">
		<th colspan="6">등록신청한 정비소가 없습니다.</th>	
	</c:if>
		
</tbody>
</table>
</div>
<div class="container text-center">
	 
		<ul>
			<c:if test="${pageMaker.prev }">
				<a class="btn btn-outline-secondary" href = "register${pageMaker.makeSearch(pageMaker.startPage -1)}">&laquo;</a>
				
			</c:if>		
				
			<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var = "idx">
							
					<a class="btn btn-outline-secondary"  href = "register${pageMaker.makeSearch(idx)}">${idx }</a>
				
			</c:forEach>			
			
			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<a class="btn btn-outline-secondary " href = "register${pageMaker.makeSearch(pageMaker.endPage +1 )}">&raquo;</a>
			</c:if>
		</ul>
				
</div>



	<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
		

<!-- ================================================== -->
	</div><!-- // #wrap end -->
</div><!-- // #container end -->

</body>
</html>