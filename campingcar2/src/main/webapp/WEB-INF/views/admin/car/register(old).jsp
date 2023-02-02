<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="action" value="register" />
<c:if test="${not empty dto.car_regid }">
	<c:set var="action" value="modify" />
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바 캠핑카 - 관리자 페이지</title>
<%@ include file="../../include/plugin.jsp" %>
<link href="${contextPath}/resources/css/admin/admin_all.css" rel="stylesheet" />
<style>
.input-group-text {width:200px;}
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


<style>
ul.cvf_uploaded_files {list-style-type: none; margin: 20px 0 0 0; padding: 0;}
ul.cvf_uploaded_files li {background-color: #fff; border: 1px solid #ccc; border-radius: 5px; float: left; margin: 20px 20px 0 0; padding: 2px; width: 150px; height: 150px; line-height: 150px; position: relative;}
ul.cvf_uploaded_files li img.img-thumb {width: 150px; height: 150px;}
ul.cvf_uploaded_files .ui-selected {background: red;}
ul.cvf_uploaded_files .highlight {border: 1px dashed #000; width: 150px; background-color: #ccc; border-radius: 5px;}
ul.cvf_uploaded_files .delete-btn {width: 24px; border: 0; position: absolute; top: -12px; right: -14px;}
.bg-success {padding: 7px;}
</style>


<form action="${action }" method="post"  enctype="multipart/form-data" id="write">
<c:if test="${action eq 'modify'}"><input type="hidden" name="car_regid" value="${dto.car_regid }" /></c:if>
<div class="input-group">
	<span class="input-group-text">캠핑카 대여 회사</span>
	<select class="form-control" name="car_rentcompid">
		<option value="1" selected>임시 대여 회사</option>
	</select>
</div>
<div class="input-group">
	<span class="input-group-text">모델명</span>
	<input type="text" name="car_modelname" value="${dto.car_modelname }" class="form-control" required />
</div>	
<div class="input-group">
	<span class="input-group-text">캠핑카 이름</span>
	<input type="text" name="car_name" value="${dto.car_name }" class="form-control" required />
</div>
<div class="input-group">
	<span class="input-group-text">차량 번호</span>
	<input type="text" name="car_number" value="${dto.car_number }" class="form-control" required />
</div>
<div class="input-group">
	<span class="input-group-text">탑승 인원</span>
	<input type="text" name="car_capa" value="${dto.car_capa }" class="form-control" required />
</div>
<div class="input-group">
	<span class="input-group-text">내부 옵션</span>
	<textarea  name="car_option" required class="form-control">${dto.car_option }</textarea>
</div>	
<div class="input-group">
	<span class="input-group-text">세부 사항</span>
	<textarea  name="car_detail" required class="form-control">${dto.car_detail }</textarea>
</div>
<div class="input-group">
	<span class="input-group-text">대여 비용 (1일 기준)</span>
	<input type="text" name="car_rentprice" value="${dto.car_rentprice }" class="form-control" required />
</div>
<div class="input-group">
	<span class="input-group-text">차량 상태</span>
	<p class="form-control">
		<input type="radio" name="car_state" value="1" <c:if test="${dto.car_state==1 }">checked</c:if> /> 사용 가능　
		<input type="radio" name="car_state" value="0" <c:if test="${dto.car_state==0 }">checked</c:if> /> 사용 불가　
	</p>
</div>

<input type = "file" name = "file" multiple = "true" class = "form-control user_picked_files" /> 
<input type = "text" name="order" class = "form-control cvf_hidden_field" value = "" />  
<ul class = "cvf_uploaded_files">
	<c:forEach items="${filelist }" var="file">
		<li><img src="${contextPath }/resources/data/car/${file.bf_source}" class="img-thumb" /></li>
	</c:forEach>

</ul>
</form>
	
<button onclick="cvf_reload_order();">정렬</button>
<button onclick="write_submit();">전송</button>


<script type="text/javascript">

function write_submit(){
	cvf_reload_order();
	$("#write").submit();
}

//Apply sort function 
function cvf_reload_order() {
	var order = $('.cvf_uploaded_files').sortable('toArray', {attribute: 'item'});
	$('.cvf_hidden_field').val(order);
}

jQuery(document).ready(function() {        

var storedFiles = [];      
//$('.cvf_order').hide();

function cvf_add_order() {
	$('.cvf_uploaded_files li').each(function(n) {
		$(this).attr('item', n);
	});
	console.log('test');
}


$(function() {
	$('.cvf_uploaded_files').sortable({
		cursor: 'move',
		placeholder: 'highlight',
		start: function (event, ui) {
			ui.item.toggleClass('highlight');
		},
		stop: function (event, ui) {
			ui.item.toggleClass('highlight');
		},
		update: function () {
			//cvf_reload_order();
		},
		create:function(){
			var list = this;
			resize = function(){
				$(list).css('height','auto');
				$(list).height($(list).height());
			};
			$(list).height($(list).height());
			$(list).find('img').load(resize).error(resize);
		}
	});
	$('.cvf_uploaded_files').disableSelection();
});
	   
$('body').on('change', '.user_picked_files', function() {
   
	var files = this.files;
	var i = 0;
			   
	for (i = 0; i < files.length; i++) {
		var readImg = new FileReader();
		var file = files[i];
	   
		if (file.type.match('image.*')){
			storedFiles.push(file);
			readImg.onload = (function(file) {
				return function(e) {
					$('.cvf_uploaded_files').append(
					"<li file = '" + file.name + "'>" +                                
						"<img class = 'img-thumb' src = '" + e.target.result + "' />" +
						"<a href = '#' class = 'cvf_delete_image' title = 'Cancel'><img class = 'delete-btn' src = 'delete-btn.png' /></a>" +
					"</li>"
					);     
				};
			})(file);
			readImg.readAsDataURL(file);
		   
		} else {
			alert('the file '+ file.name + ' is not an image<br/>');
		}
	   
		if(files.length === (i+1)){
			setTimeout(function(){
				cvf_add_order();
			}, 1000);
		}
	}
});

// Delete Image from Queue
$('body').on('click','a.cvf_delete_image',function(e){
	e.preventDefault();
	$(this).parent().remove('');       
   
	var file = $(this).parent().attr('file');
	for(var i = 0; i < storedFiles.length; i++) {
		if(storedFiles[i].name == file) {
			storedFiles.splice(i, 1);
			break;
		}
	}
   
	//cvf_reload_order();
   
});
	   
// AJAX Upload
$('body').on('click', '.cvf_upload_btn', function(e){
   
	e.preventDefault();
	cvf_reload_order();
   
	//$(".cvf_uploaded_files").html('<p><img src = "loading.gif" class = "loader" /></p>');
	var data = new FormData();
   
	var items_array = $('.cvf_hidden_field').val();
	var items = items_array.split(',');
	for (var i in items){
		var item_number = items[i];
		data.append('files' + i, storedFiles[item_number]);
	}
	   
	$.ajax({
		url: 'upload.php',
		type: 'POST',
		contentType: false,
		data: data,
		processData: false,
		cache: false,
		success: function(response, textStatus, jqXHR) {
			//$(".cvf_uploaded_files").html('');                                               
			//bootbox.alert('<br /><p class = "bg-success">File(s) uploaded successfully.</p>');
			alert(jqXHR.responseText);
		}
	});
   
});        
});
</script>

<!-- ================================================== -->
	</div><!-- // #wrap end -->
</div><!-- // #container end -->

</body>
</html>