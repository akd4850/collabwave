<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<div class="card">
    <div class="header">
        결재 대기 문서
    </div>
    <div class="content table-responsive table-full-width">
        <table class="table table-hover table-striped">
            <thead>
                <th>기안일</th>
                <th>결재 양식</th>
                <th>제목</th>
                <th>첨부</th>
                <th>기안자</th>
            </thead>
            <tbody>
            <% for(int i = 0; i < 10; i++) { %>
                <tr>
                    <td>2024-05-22</td>
                    <td>업무협조</td>
                    <td>업무협조 문서 결재</td>
                    <td></td>
                    <td>김민식</td>
                </tr>
            <% } %>
            </tbody>
        </table>
    </div>
</div>