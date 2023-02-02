<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
HashMap<Integer, String> cateArr = new HashMap<>();
// (0 결제 대기, 1 결제 완료, 2 출고 대기, 3 출고 완료, 4 반납 완료)
cateArr.put(0, "결제 대기");
cateArr.put(1, "결제 완료");
cateArr.put(2, "출고 대기");
cateArr.put(3, "출고 완료");
cateArr.put(4, "반납 완료");

pageContext.setAttribute("cateArr", cateArr);
%>