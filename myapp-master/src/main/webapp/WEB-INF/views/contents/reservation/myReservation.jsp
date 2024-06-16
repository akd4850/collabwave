<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<div class="card">
    <div class="header">
       내 예약 현황
    </div>
    <div class="content table-responsive table-full-width">
        <table class="table table-hover table-striped">
            <thead>
                <th>예약 자산</th>
                <th>예약자</th>
                <th>시작 시간</th>
                <th>종료 시간</th>
                <th>예약 사유</th>
                <th>취소</th>
            </thead>
            <tbody>
                <tr>
                    <td>대회의실1</td>
                    <td>홍길동 사원</td>
                    <td>2024.05.22 17:30</td>
                    <td>2024.05.23 18:30</td>
                    <td>회의실 예약</td>
                    <td><button type="submit" class="btn btn-info btn-fill">취소</button></td>
                </tr>
            </tbody>
        </table>
    </div>
</div>