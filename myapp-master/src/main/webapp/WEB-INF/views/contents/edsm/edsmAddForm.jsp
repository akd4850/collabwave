<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<div class="card">
    <div class="header">
        전자결재 양식 추가
    </div>
    <div class="content table-responsive table-full-width">
        <input type="button" class="btn btn-info btn-fill" style="margin-left:10px" value="등록">
        <input type="button" class="btn btn-info btn-fill" value="수정">
        <input type="button" class="btn btn-info btn-fill" value="삭제">
        <hr>
        <table class="table table-hover table-striped">
            <tbody>
                <tr>
                    <td>파일명</td>
                    <td><input type="file" name="" id=""></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="card">
        <jsp:include page="./payForm/example1.jsp"/>
    </div>
</div>