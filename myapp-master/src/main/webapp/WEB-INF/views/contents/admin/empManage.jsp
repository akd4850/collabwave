<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<div class="card">
    <div class="header">
        직원 관리
    </div>
    <div class="content table-responsive table-full-width">
        <input type="button"
                class="btn btn-info btn-fill"
                style="margin-left:10px"
                onclick="location.href='/admin/emp/add.page'"
                value="등록">
        <table class="table table-hover table-striped">
            
            <thead>
                <tr>
                    <th>사원번호</th>
                    <th>이름</th>
                    <th>부서</th>
                    <th>직급</th>
                    <th>연락처</th>
                    <th>이메일</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${empList}" var="emp" varStatus="vs">
                    <tr>
                        <td>${emp.empCode}</td>
                        <td><a href="/admin/emp/detail.do?empCode=${emp.empCode}">${emp.empName}</a></td>
                        <td>${emp.dept.deptName}</td>
                        <td>${emp.position.positionName}</td>
                        <td>${emp.mobile}</td>
                        <td>${emp.email}</td>
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
