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
            <div class="col-md-2">
                <jsp:include page="./empSidebar.jsp"/>
            </div>
            <div class="col-md-10">
                <jsp:include page="./${submenu}"/>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../../layout/footer.jsp"/>