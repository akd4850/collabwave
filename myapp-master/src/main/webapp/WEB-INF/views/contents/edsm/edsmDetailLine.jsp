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

                        <form action="${contextPath}/edsm/modifyLine.do" method="post">
                            <table class="table table-hover table-striped">
                                <thead>
                                    <th>${messageSource.getMessage('turn', null, locale)}</th>
                                    <th>${messageSource.getMessage('name', null, locale)}</th>
                                    <th>${messageSource.getMessage('dept', null, locale)}</th>
                                    <th>${messageSource.getMessage('delete', null, locale)}</th>                                
                                </thead>
                                <tbody id="appr-line">
                                    <c:forEach items="${apprItemList}" var="appr" varStatus="vs">
                                        <tr id="tr_${appr.customAppr.emp.empCode}">
                                            <td>${vs.count}</td>
                                            <td>${appr.customAppr.emp.empName}</td>
                                            <td>${appr.customAppr.emp.dept.deptName}</td>
                                            <td>
                                                <input type="hidden" name="empCode" value="${appr.customAppr.emp.empCode}">
                                                <input type='button' onclick='deleteApprEmpcodeFromLine("${appr.customAppr.emp.empCode}")' value='삭제' class='btn btn-info btn-fill'>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>

                            <br>
                            <div class="form-group">
                                <label>
                                    ${messageSource.getMessage('appr', null, locale)}${messageSource.getMessage('line', null, locale)} 
                                    ${messageSource.getMessage('name', null, locale)}
                                </label>
                                <input type="hidden" name="apprNo" value="${apprItemList[0].customAppr.customApprNo}">
                                <input type="text" class="form-control" name="apprName" value="${apprItemList[0].customAppr.lineName}">
                            </div>
                            <input type="submit" class="btn btn-info btn-fill" style="margin-left:10px" value="${messageSource.getMessage('modify', null, locale)}">
                            <input type="button" class="btn btn-info btn-fill" value="${messageSource.getMessage('delete', null, locale)}" onclick="location.href='${contextPath}/edsm/removeLine.do?apprNo=${apprItemList[0].customAppr.customApprNo}'">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    window.addEventListener('DOMContentLoaded', function(){
		apprSeq = 1 * '${apprItemList.size()}' + 1;
        myEmpCode = '${sessionScope.emp.empCode}';

        let inputAry = document.querySelectorAll("input[name^='empCode");
        for(let i = 0; i < inputAry.length; i++) {
            empArr.push(inputAry[i].defaultValue);
        }
	});
</script>