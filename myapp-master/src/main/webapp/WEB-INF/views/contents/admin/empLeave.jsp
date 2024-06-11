<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<div class="card">
    <div class="header">
        퇴사자 관리
    </div>
    <div class="content table-responsive table-full-width">

        <table class="table table-hover table-striped">
            
            <thead>
                <tr>
                    <th>이름</th>
                    <th>부서</th>
                    <th>직급</th>
                    <th>연락처</th>
                    <th>입사일자</th>
                    <th>퇴사일자</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${empLeaveList}" var="empL" varStatus="vs">
                    <tr>
                        <td>${empL.empName}</td>
                        <td>${empL.dept.deptName}</td>
                        <td>${empL.position.positionName}</td>
                        <td>${empL.mobile}</td>
                        <td>${empL.joinDate}</td>
                        <td>${empL.leaveDate}</td>
                    </tr>
                </c:forEach>
            </tbody>
            <tfoot>
                <tr>
                    <td>${paging}</td>
            </tfoot>
        </table>
    </div>
</div>
