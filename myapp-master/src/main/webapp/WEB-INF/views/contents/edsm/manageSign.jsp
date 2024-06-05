<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<div class="card">
    <div class="header">
        ${messageSource.getMessage('my', null, locale)} 
        ${messageSource.getMessage('sign', null, locale)} 
        ${messageSource.getMessage('manage', null, locale)}
    </div>
    <div class="content table-responsive table-full-width">
        <form   action="${contextPath}/edsm/registerSign.do" 
                method="post"
                enctype="multipart/form-data">
            <div class="form-group">
                <label for="sign">
                    ${messageSource.getMessage('registered', null, locale)} 
                    ${messageSource.getMessage('sign', null, locale)} 
                    ${messageSource.getMessage('file', null, locale)}
                </label>
                <br>
                <c:if test="${sessionScope.emp.signFileName != ''}">
                    <img src="${contextPath}${sessionScope.emp.signFileName}" alt="">
                </c:if>
            </div>
            <div class="form-group">
                <label for="file">${messageSource.getMessage('attach', null, locale)}</label>
                <input type="file" name="file" id="file">
                <br>
                <input type="submit" class="btn btn-info btn-fill" style="margin-left:10px" value="${messageSource.getMessage('register', null, locale)}">
            </div>
        </form>
    </div>
</div>