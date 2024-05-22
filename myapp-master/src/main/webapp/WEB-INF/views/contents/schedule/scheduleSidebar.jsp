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
        <hr>
        <div class="checkbox">
            <input id="checkboxMine" type="checkbox">
            <label for="checkboxMine">
                내 일정(기본)
            </label><br>
            <input id="checkboxCompany" type="checkbox">
            <label for="checkboxCompany">
                전사 일정
            </label>
        </div>
    </div>
</div>