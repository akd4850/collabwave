<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<div class="card">
    <div class="header">
        결재 예정 문서
    </div>
    <div class="content table-responsive table-full-width">
        <table class="table table-hover table-striped">
            <thead>
                <th>기안일</th>
                <th>만료일</th>
                <th>결재 양식</th>
                <th>제목</th>
                <th>기안자</th>
            </thead>
            <tbody>
                <c:forEach items="${expectList}" var="expect" varStatus="vs">
                    <tr>
                        <td class="edsmDatetime">${expect.edsm.edsmStartDatetime}</td>
                        <td class="edsmDatetime">${expect.edsm.edsmExpireDatetime}</td>
                        <td class="edsmDatetime">${expect.edsm.sample.sampleTitle}</td>
                        <td>${expect.edsm.edsmTitle}</td>
                        <td>${expect.emp.empName}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        ${paging}
    </div>
</div>
<script>
document.addEventListener("DOMContentLoaded", function() {
    var dateElements = document.querySelectorAll('.edsmDatetime');
    dateElements.forEach(function(element) {
        var originalDate = element.textContent.trim();
        var formattedDate = moment(originalDate).format('YYYY-MM-DD HH:mm');
        element.textContent = formattedDate;
    });
});
</script>