<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<div class="card">
    <div class="header">
        ${messageSource.getMessage("edsm", null, locale)} ${messageSource.getMessage("form", null, locale)}
    </div>
    <div class="content table-responsive table-full-width">
        <input type="button"
                class="btn btn-info btn-fill"
                style="margin-left:10px"
                onclick="location.href='/edsm/edsmAddForm.page'"
                value="${messageSource.getMessage('form', null, locale)} ${messageSource.getMessage('add', null, locale)}">
        <table class="table table-hover table-striped">
            <thead>
                <th>${messageSource.getMessage("form", null, locale)} ${messageSource.getMessage("number", null, locale)}</th>
                <th>${messageSource.getMessage("formName", null, locale)}</th>
                <th>${messageSource.getMessage("regiDay", null, locale)}</th>
            </thead>
            <tbody>
                <c:forEach items="${sampleList}" var="sample" varStatus="vs">
                    <tr>
                        <td><a href="/edsm/edsmDetailForm.do?code=${sample.sampleDotCode}">${sample.sampleDotCode}</a></td>
                        <td>${sample.sampleTitle}</td>
                        <td>${sample.createDatetime}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        ${paging}
    </div>
</div>