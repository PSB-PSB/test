<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<link rel="stylesheet" type="text/css" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.3.0/bootbox.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU=" crossorigin="anonymous"></script>

<style>
ul.cvf_uploaded_files {list-style-type: none; margin: 20px 0 0 0; padding: 0;}
ul.cvf_uploaded_files li {background-color: #fff; border: 1px solid #ccc; border-radius: 5px; float: left; margin: 20px 20px 0 0; padding: 2px; width: 150px; height: 150px; line-height: 150px; position: relative;}
ul.cvf_uploaded_files li img.img-thumb {width: 150px; height: 150px;}
ul.cvf_uploaded_files .ui-selected {background: red;}
ul.cvf_uploaded_files .highlight {border: 1px dashed #000; width: 150px; background-color: #ccc; border-radius: 5px;}
ul.cvf_uploaded_files .delete-btn {width: 24px; border: 0; position: absolute; top: -12px; right: -14px;}
.bg-success {padding: 7px;}
</style>
<script type="text/javascript">
jQuery(document).ready(function() {        

var storedFiles = [];      
//$('.cvf_order').hide();

// Apply sort function 
function cvf_reload_order() {
	var order = $('.cvf_uploaded_files').sortable('toArray', {attribute: 'item'});
	$('.cvf_hidden_field').val(order);
}

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

<div class = "container-fluid">
<h3>Sort Files before upload</h3>
<br />
<form action="register" method="post" enctype="multipart/form-data">
<input type="hidden" name="bo_table" value="free" />
<table border="1" width="600px">
<tr><td>??????</td><td><input type="text" name="wr_subject" /></td></tr>
<tr><td>??????</td><td><textarea cols="100" rows="5" name="wr_content"></textarea></td></tr>
<tr><td>??????</td><td><input type="text" name="wr_name" /></td></tr>
<tr><td>??????</td><td><input type="text" name="wr_password" /></td></tr>
</table>


<div class = "col-md-6">
<div class = "form-group">
	<label>Select Images</label>
	<input type = "file" name = "file" multiple = "true" class = "form-control user_picked_files" />                 
</div>                     
<div class = "form-group cvf_order">                           
	<label>Order</label>                               
	<input type = "text" class = "form-control cvf_hidden_field" value = "" disabled = "disabled" />   
</div>                     
<ul class = "cvf_uploaded_files"></ul>
<button onclick="cvf_reload_order();">??????</button>
</div>
</div>
</form>