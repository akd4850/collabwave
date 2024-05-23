<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<jsp:include page="../../layout/header.jsp"/>
<div class="main-content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-3">
                <jsp:include page="./scheduleSidebar.jsp"/>
            </div>
            <div class="col-md-9">
                <div class="card">
                    <div class="header">
                        <h4 class="title">일정 등록</h4>
                    </div>
                    <div class="content table-responsive table-full-width">
                        <table class="table table-hover table-striped">
                            <tbody>
                                <tr>
                                    <td>일정명</td>
                                    <td colspan="2"><input type="text" class="form-control"></td>
                                </tr>
                                <tr>
                                    <td>일시</td>
                                    <td><input type="text" class="form-control" placeholder="2024-05-23 10:30 ~ 2024-05-23 16:30"></td>
                                    <td>
                                        <input id="checkboxCompany" type="checkbox">
                                        <label for="checkboxCompany">종일</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>전사일정</td>
                                    <td colspan="2">
                                        <input id="checkboxMine" type="checkbox">
                                        <label for="checkboxMine">전사일정</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <button type="submit" class="btn btn-info btn-fill">확인</button>
                                        <button type="submit" class="btn btn-info btn-fill">취소</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../../layout/footer.jsp"/>