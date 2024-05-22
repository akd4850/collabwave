<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<div class="card">
    <div class="header">
        직원 조회
    </div>
    <div class="content table-responsive table-full-width">
        <input type="button"
                class="btn btn-info btn-fill"
                style="margin-left:10px"
                onclick="location.href='/employee/addEmployee.page'"
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
                <tr>
                    <td>07-73002320</td>
                    <td><a href="/employee/detailEmployee.page">김민식</a></td>
                    <td>개발1팀</td>
                    <td>과장</td>
                    <td>010-2222-3333</td>
                    <td>akd3850@collabwave.com</td>
                </tr>
            </tbody>
        </table>
    </div>
</div>