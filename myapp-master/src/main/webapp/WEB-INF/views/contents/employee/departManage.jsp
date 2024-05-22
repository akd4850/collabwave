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
    <div class="content">
        <div id="jstree"></div>
        
        <div class="content table-responsive table-full-width">
            <input type="button"
                class="btn btn-info btn-fill"
                style="margin-left:10px"
                onclick="location.href='/employee/addDepart.page'"
                value="등록"><hr>
            <table class="table table-hover table-striped">
                <tbody>
                    <tr>
                        <th>부서명</th>
                        <td><input type="text" class="form-control" placeholder="부서명" value="회계팀"></td>
                    </tr>
                    <tr>
                        <th>부서코드</th>
                        <td><input type="text" class="form-control" placeholder="부서코드" value="d-code-100" disabled></td>
                    </tr>
                    <tr>
                        <th>생성일</th>
                        <td><input type="text" class="form-control" placeholder="생성일" value="2024-05-23" disabled></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <button type="button" class="btn btn-info btn-fill">수정</button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>