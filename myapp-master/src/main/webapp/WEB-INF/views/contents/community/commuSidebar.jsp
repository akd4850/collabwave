<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<style>
.subtab > li {
    padding-top: 10px;
}    
.subtab2 li {
    padding-left: 30px;
}
</style>

<div class="card">
    <div class="header">
        커뮤니티 메뉴
    </div>
    <div class="content">
        <ul class="list-unstyled subtab">
            <li><a href="/community/notice.page">공지사항</a></li>
            <li><a href="/community/free.page">자유게시판</a></li>
        </ul>
    </div>
</div>