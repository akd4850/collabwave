<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<div class="main-content">
    <div class="container-fluid">
        <div class="row">

            <div class="col-md-12">
                <div class="card">
                    <div class="header">
                        근태 현황
                    </div>
                    <div class="text-center">
                        <h4>
                            <!--
                            <a href="http://localhost:8090/attendance/workLeave.page?month="><</a> 
                                2023.05
                            <a href="http://localhost:8090/attendance/workLeave.page?month=">></a>
                            -->
                            ${curMon}
                        </h4>
                    </div>
                    <div class="content table-responsive table-full-width">
                        <table class="table table-hover table-striped">
                            <thead>
                                <th>일차</th>
                                <th>업무시작</th>
                                <th>업무종료</th>
                                <th>총 근무시간</th>
                            </thead>
                            <tbody>
                                <c:forEach items="${attendanceList}" var="att" varStatus="vs">
                                    <tr>
                                        <td>${att.gotoworkDatetime.toString().split("T")[0].split("-")[2]}일</td>
                                        <td>${att.gotoworkDatetime.toString().split("T")[1]}</td>
                                        <td>${att.offworkDatetime.toString().split("T")[1]}</td>
                                        <td>${att.minutes}분</td>
                                    </tr>
                                </c:forEach>
                                <!--
                                <tr>
                                    <td>3일</td>
                                    <td>09:00:33</td>
                                    <td>18:00:50</td>
                                    <td>8h 54m 30s</td>
                                    <td>정상 근무</td>
                                </tr>
                                -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>