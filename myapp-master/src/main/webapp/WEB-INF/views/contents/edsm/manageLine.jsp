<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<div class="card">
    <div class="header">
        ${messageSource.getMessage('my', null, locale)} 
        ${messageSource.getMessage('appr', null, locale)}${messageSource.getMessage('line', null, locale)} 
        ${messageSource.getMessage('manage', null, locale)}
    </div>
    <div class="content table-responsive table-full-width">
        <input type="button"
                class="btn btn-info btn-fill"
                style="margin-left:10px"
                onclick="location.href='${contextPath}/edsm/edsmAddLine.page'"
                value="${messageSource.getMessage('appr', null, locale)}${messageSource.getMessage('line', null, locale)}  
                ${messageSource.getMessage('add', null, locale)}">
        <table class="table table-hover table-striped">
            <thead>
                <th>
                    ${messageSource.getMessage("appr", null, locale)}${messageSource.getMessage("line", null, locale)} 
                    ${messageSource.getMessage("name", null, locale)}
                </th>
            </thead>
            <tbody>
                <c:forEach items="${customApprList}" var="appr" varStatus="vs">
                    <tr>
                        <td><a href="${contextPath}/edsm/edsmDetailLine.do?apprNo=${appr.customApprNo}">${appr.lineName}</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        ${paging}
    </div>    
</div>