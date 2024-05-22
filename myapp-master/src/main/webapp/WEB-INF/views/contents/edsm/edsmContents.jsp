<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<div class="card">
    <div class="header">
        전자결재 홈
    </div>
    <div class="content table-responsive table-full-width">
        <hr>
        <h6 style="padding-left:10px;">결재 대기 문서</h6>
        <table class="table table-hover table-striped">
            <thead>
                <th>기안일</th>
                <th>결재 양식</th>
                <th>제목</th>
                <th>첨부</th>
            </thead>
            <tbody>
                <tr>
                    <td>2024-05-22</td>
                    <td>업무협조</td>
                    <td>업무협조 문서 결재</td>
                    <td></td>
                </tr>
            </tbody>
        </table>

        <hr>
        <h6 style="padding-left:10px;">기안 진행 문서</h6>
        <table class="table table-hover table-striped">
            <thead>
                <th>기안일</th>
                <th>결재 양식</th>
                <th>제목</th>
                <th>첨부</th>
                <th>결재상태</th>
            </thead>
            <tbody>
                <tr>
                    <td colspan="5" class="text-center">
                        문서가 없습니다
                    </td>
                </tr>
            </tbody>
        </table>

        <hr>
        <h6 style="padding-left:10px;">완료 문서</h6>
        <table class="table table-hover table-striped">
            <thead>
                <th>기안일</th>
                <th>결재 양식</th>
                <th>제목</th>
                <th>첨부</th>
                <th>결재상태</th>
            </thead>
            <tbody>
                <tr>
                    <td colspan="5" class="text-center">
                        문서가 없습니다
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</div>