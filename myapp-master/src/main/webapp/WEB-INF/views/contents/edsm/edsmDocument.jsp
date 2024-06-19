<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<div class="card">
    <div class="header">
        결재 문서함
    </div>
    <div class="content table-responsive table-full-width">
        <table class="table table-hover table-striped">
            <thead>
                <th>문서번호</th>
                <th>기안일</th>
                <th>완료일</th>
                <th>만료일</th>
                <th>제목</th>
                <th>결재 양식</th>
                <th>결재상태</th>
            </thead>
            <tbody>
                <c:forEach items="${documentList}" var="document" varStatus="vs">
                    <tr>
                        <td>${document.edsm.edsmNo}</td>
                        <td class="edsmDatetime">${document.edsm.edsmStartDatetime}</td>
                        <td class="edsmDatetime">${document.edsm.edsmEndDatetime}</td>
                        <td class="edsmDatetime">${document.edsm.edsmExpireDatetime}</td>
                        <td>
                            <a href="${contextPath}/edsm/edsmDetail.do?edsmNo=${document.edsm.edsmNo}">${document.edsm.edsmTitle}</a>
                        </td>
                        <td>${document.edsm.sample.sampleTitle}</td>
                        <td>
                            <!--a0001 진행중 a0002 반려 a0003 완료-->
                            <c:if test="${document.edsm.edsmStatus == 'a0001'}">
                                <button class="btn btn-xs btn-fill" style="background-color:green;border:none">진행중</button>
                            </c:if>
                            <c:if test="${document.edsm.edsmStatus == 'a0002'}">
                                <button class="btn btn-xs btn-fill" style="background-color:red;border:none">반려</button>
                            </c:if>
                            <c:if test="${document.edsm.edsmStatus == 'a0003'}">
                                <button class="btn btn-xs btn-fill" style="background-color:blue;border:none">완료</button>
                            </c:if>
                            <c:if test="${document.edsm.edsmStatus == 'a0004'}">
                                <button class="btn btn-xs btn-fill" style="background-color:orange;border:none">만료</button>
                            </c:if>
                        </td>
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