<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<div class="card">
    <div class="header">
        전자결재 양식
    </div>
    <div class="content table-responsive table-full-width">
        <input type="button"
                class="btn btn-info btn-fill"
                style="margin-left:10px"
                onclick="location.href='/edsm/edsmAddForm.page'"
                value="양식 추가">
        <table class="table table-hover table-striped">
            <thead>
                <th>양식 번호</th>
                <th>양식명</th>
                <th>등록일</th>
            </thead>
            <tbody>
                <tr>
                    <td>0001</td>
                    <td>업무협조</td>
                    <td>업무협조</td>
                    <td>2024-05-22</td>
                </tr>
            </tbody>
        </table>
    </div>
</div>