<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<div class="card">
    <div class="header">
        새 결재 진행
    </div>
</div>
<div class="card">
    <div class="header">
        결재선 지정
    </div>
    <div class="content">
        <div id="jstree"></div>
    </div>
</div>
<div class="card">
    <jsp:include page="./payForm/example1.jsp"/>
</div>
<div class="card">
    <div class="header">
        첨부파일
    </div>
    <div class="content">
        <input type="file" name="" id=""><br>
        <button type="button" class="btn btn-primary btn-fill">결재요청</button>
        <button type="button" class="btn btn-primary btn-fill">반려</button>
        <div class="clearfix"></div>
    </div>
</div>