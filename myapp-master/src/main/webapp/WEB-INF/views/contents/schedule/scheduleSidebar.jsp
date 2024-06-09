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
        일정 관리 메뉴
    </div>
    <div class="content">
        <div>
            <button type="button" class="btn btn-info btn-fill" onclick="location.href='/schedule/registerSchedule.page'">일정 등록</button>
        </div>
        <hr>
        <ul class="list-unstyled subtab">
            <li><a href="/schedule/mySchedule.page">일정 확인</a></li>
        </ul>
        <div class="checkbox">
            <input id="checkboxMine" type="checkbox">
            <label for="checkboxMine">
                개인 일정	
            </label><br>
            <input id="checkboxCompany" type="checkbox">
            <label for="checkboxCompany">
                전사 일정
            </label>
        </div>
    </div>
</div>