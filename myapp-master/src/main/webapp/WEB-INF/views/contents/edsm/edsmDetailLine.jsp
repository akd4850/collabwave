<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<link rel="stylesheet" href="${contextPath}/jstree/dist/themes/proton/style.css" />

<div class="card">
    <div class="header">
        ${messageSource.getMessage('appr', null, locale)}${messageSource.getMessage('line', null, locale)} 
        ${messageSource.getMessage('add', null, locale)}
    </div>
    <div class="content table-responsive table-full-width">
        <div class="row" style="margin-left: 10px;">
            <div class="col-md-3">
                <div class="card">
                    <div class="header">
                        ${messageSource.getMessage('organizationChart', null, locale)}
                    </div>
                    <div class="content table-responsive table-full-width">
                        <div id="jstree"></div>
                    </div>
                </div>
            </div>
            <div class="col-md-7">
                <div class="card">
                    <div class="header">
                        ${messageSource.getMessage('appr', null, locale)}${messageSource.getMessage('line', null, locale)}
                    </div>
                    <div class="content">
                        <p class="text-info">
                            ${messageSource.getMessage('apprLineHelpMessage', null, locale)}
                        </p>

                        <form action="${contextPath}/edsm/edsmAddLine.do" method="post">
                            <table class="table table-hover table-striped">
                                <thead>
                                    <th>${messageSource.getMessage('turn', null, locale)}</th>
                                    <th>${messageSource.getMessage('name', null, locale)}</th>
                                    <th>${messageSource.getMessage('dept', null, locale)}</th>
                                    <th>${messageSource.getMessage('delete', null, locale)}</th>                                
                                </thead>
                                <tbody id="appr-line">
                                </tbody>
                            </table>

                            <br>
                            <div class="form-group">
                                <label>
                                    ${messageSource.getMessage('appr', null, locale)}${messageSource.getMessage('line', null, locale)} 
                                    ${messageSource.getMessage('name', null, locale)}
                                </label>
                                <input type="text" class="form-control" name="apprName">
                            </div>
                            <input type="submit" class="btn btn-info btn-fill" style="margin-left:10px" value="${messageSource.getMessage('register', null, locale)}">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>