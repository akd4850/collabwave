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
            <li><a href="/reservation/curReservation.page"><b>내 예약 현황</b></a></li>
            <li><a href="/reservation/management.page"><b>자산 관리</b></a></li>
            <li><b>예약 관리</b></li>
            <li>
                <ul class="list-unstyled subtab2">
                    <li><a href="/reservation/reservation.page?goodsCode=room1">대회의실1</a></li>
                    <li><a href="/reservation/reservation.page?goodsCode=room2">소회의실1</a></li>
                    <li><a href="/reservation/reservation.page?goodsCode=room3">소회의실2</a></li>
                    <li><a href="/reservation/reservation.page?goodsCode=car1">그랜저 3.0</a></li>
                </ul>
            </li>
        </ul>
    </div>
</div>