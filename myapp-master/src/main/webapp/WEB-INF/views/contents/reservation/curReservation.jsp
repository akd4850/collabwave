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
        <button type="submit" class="btn btn-info btn-fill" style="margin-left:10px">자산추가</button>
        <table class="table table-hover table-striped">
            <thead>
                <th>코드</th>
                <th>이름</th>
                <th>타입</th>
                <th>수정</th>
            </thead>
            <tbody>
                <tr>
                    <td>room1</td>
                    <td>대회의실1</td>
                    <td>장소</td>
                    <td><button type="submit" class="btn btn-info btn-fill">수정</button></td>
                </tr>
                <tr>
                    <td>room2</td>
                    <td>소회의실1</td>
                    <td>장소</td>
                    <td><button type="submit" class="btn btn-info btn-fill">수정</button></td>
                </tr>
            </tbody>
        </table>
    </div>
</div>