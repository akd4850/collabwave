<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<div class="card">
    <div class="header">
        조직관리 홈
    </div>
    <div class="content table-responsive table-full-width">
        <hr>
        <h6 style="padding-left:10px;">인사관리</h6>
        <table class="table table-hover table-striped">
            <thead>
                <th>사원번호</th>
                <th>이름</th>
                <th>부서</th>
                <th>직급</th>
                <th>이메일</th>
            </thead>
            <tbody>
                <tr>
                    <td>e0001</td>
                    <td>최우제</td>
                    <td>영업팀</td>
                    <td>사원</td>
                    <td>zeus@collabwave.com</td>
                </tr>
            </tbody>
        </table>

        <hr>
        <h6 style="padding-left:10px;">부서관리</h6>
        <table class="table table-hover table-striped">
            <thead>
                <th>부서코드</th>
                <th>부서명</th>
                <th>부서인원</th>
                <th>사용여부</th>
                <th>생성일</th>
            </thead>
            <tbody>
                <tr>
                    <td colspan="5" class="text-center">
                        작업 중입니다
                    </td>
                </tr>
            </tbody>
        </table>

        <hr>
        <h6 style="padding-left:10px;">직급관리</h6>
        <table class="table table-hover table-striped">
            <thead>
                <th>직급코드</th>
                <th>직급명</th>
                <th>사용인원</th>
                <th>사용여부</th>
            </thead>
            <tbody>
                <tr>
                    <td colspan="5" class="text-center">
                        작업 중입니다
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</div>