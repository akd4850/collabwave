<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>
<!DOCTYPE html>
<html>
<head>
  
  <meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
  <meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 페이지마다 다른 제목 -->
<title>
  <c:choose>
    <c:when test="${empty title}">Welcome</c:when>
    <c:otherwise>${title}</c:otherwise>
  </c:choose>
</title>

<link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/light-bootstrap-dashboard.css?v=1.4.1" rel="stylesheet"/>
<link href="${contextPath}/resources/css/demo.css?v=1.4.1" rel="stylesheet" />

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
<link href="${contextPath}/resources/css/pe-icon-7-stroke.css" rel="stylesheet" />

</head>
<body>

  <jsp:include page="./sidebar.jsp"/>

  <!--[wrapper]-->
<div class="wrapper">

  <div class="main-panel">

    <jsp:include page="./navbar.jsp"/>