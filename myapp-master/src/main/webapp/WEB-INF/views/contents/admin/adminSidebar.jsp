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
        조직 관리 메뉴
    </div>
    <div class="content">
        <ul class="list-unstyled subtab">
            <li><b>직원</b></li>
                <ul class="list-unstyled subtab2">
                    <li><a href="/admin/emp/management.page">직원관리</a></li>
                    <li><a href="/admin/emp/add.page">직원등록</a></li>
                </ul>
            <li><b>부서</b></li>
                <ul class="list-unstyled subtab2">
                    <li><a href="/admin/dept/management.page">부서관리</a></li>
                    <li><a href="/admin/dept/add.page">부서등록</a></li>
                </ul>
            <li><b>직급</b></li>
                <ul class="list-unstyled subtab2">
                    <li><a href="/admin/pos/management.page">직급관리</a></li>
                </ul>
            <li><b>퇴사자관리</b></li>
                <ul class="list-unstyled subtab2">
                    <li><a href="/admin/emp/leave.page">퇴사자관리</a></li>
                </ul>
        </ul>
    </div>
</div>