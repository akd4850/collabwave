<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<div class="card">
    <div class="header">
        부서 관리
    </div>
    <div class="content table-responsive table-full-width">
        <input type="button"
                class="btn btn-info btn-fill"
                style="margin-left:10px"
                onclick="location.href='/admin/dept/add.page'"
                value="등록">
        <table class="table table-hover table-striped">
            
            <thead>
                <tr>
                    <th>부서코드</th>
                    <th>부서명</th>
                    <th>부서장</th>
                    <th>부서위치</th>
                    <th>사용여부</th>
                    <th>생성일자</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${deptList}" var="dept" varStatus="vs">
                    <tr>
                        <td>${dept.deptCode}</td>
                        <td><a href="/admin/dept/detail.do?deptCode=${dept.deptCode}">${dept.deptName}</a></td>
                        <td>${dept.emp.empName}</td>
                        <td>${dept.deptLocation}</td>
                        <td>${dept.useYn}</td>
                        <td>${dept.deptCreatedate}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        ${paging}
    </div>
</div>
