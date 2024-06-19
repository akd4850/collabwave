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
        예약 관리 메뉴
    </div>
    <div class="content">
        <ul class="list-unstyled subtab">
            <li><a href="/reservation/curReservation.page"><b>예약 현황</b></a></li>
            <li><a href="/reservation/myReservation.page?empCode=${sessionScope.emp.empCode}"><b>내 예약 현황</b></a></li>
            <c:if test="${sessionScope.emp.deptCode == 'd1100'}">
                <li><a href="/reservation/management.page"><b>자산 관리</b></a></li>
            </c:if>   
        </ul>
    </div>
</div>