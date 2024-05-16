<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<div class="main-content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-3">
                <div class="card">
                    <div class="header">
                        header
                    </div>
                    <div class="content">
                        content
                    </div>
                </div>
            </div>

            <div class="col-md-9">
                <div class="card">
                    <div class="header">
                        header
                    </div>
                    <div class="content">
                        content
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>