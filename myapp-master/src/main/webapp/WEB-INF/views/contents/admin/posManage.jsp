<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<div class="card">
    <div class="header">
        직급 관리
    </div>
    <div class="content table-responsive table-full-width">
        <input type="button"
                class="btn btn-info btn-fill"
                style="margin-left:10px"
                onclick="location.href='/admin/pos/add.page'"
                value="등록">
        <table class="table table-hover table-striped">
            
            <thead>
                <tr>
                    <th>직급코드</th>
                    <th>직급명</th>
                    <th>사용인원</th>
                    <th>사용여부</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${posList}" var="pos" varStatus="vs">
                    <tr>
                        <td>${pos.posCode}</td>
                        <td><a href="/admin/pos/detail.do?posCode=${pos.posCode}">${pos.posName}</a></td>
                        <td>유저수</td>
                        <td>${pos.useYn}</td>
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
