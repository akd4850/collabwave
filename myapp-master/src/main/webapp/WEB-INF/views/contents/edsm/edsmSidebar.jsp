<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<style>
.subtab > li {
    padding-top: 10px;
}    
.subtab2 li {
    padding-left: 30px;
}
</style>

<div class="card">
    <div class="header">
        전자 결재 메뉴
    </div>
    <div class="content">
        <div>
            <button type="button" class="btn btn-info btn-fill" onclick="erpModal.showSwal('edsm','새 결재 진행')">새 결재 진행</button>
        </div>
        <ul class="list-unstyled subtab">
            <li><b>결제하기</b></li>
            <li>
                <ul class="list-unstyled subtab2">
                    <li><a href="/edsm/edsmWaiting.page">결재 대기 문서</a></li>
                    <li><a href="">결재 수신 문서</a></li>
                </ul>
            </li>
            <li><b>개인 문서함</b></li>
            <li>
                <ul class="list-unstyled subtab2">
                    <li><a href="/edsm/edsmDrafting.page">기안 문서함</a></li>
                    <li><a href="">결재 문서함</a></li>
                </ul>
            </li>
            <li><b>문서함</b></li>
            <li>
                <ul class="list-unstyled subtab2">
                    <li><a href="/edsm/edsmForm.do">전자결재 양식</a></li>
                </ul>
            </li>
        </ul>
    </div>
</div>