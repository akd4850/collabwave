<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<div class="card">
    <div class="header">
        전자결재 홈
    </div>
    <div class="content table-responsive table-full-width">
        <hr>
        <h6 style="padding-left:10px;">결재 대기 문서</h6>
        <table class="table table-hover table-striped">
            <thead>
                <th>기안일</th>
                <th>만료일</th>
                <th>결재 양식</th>
                <th>제목</th>
                <th>기안자</th>
            </thead>
            <tbody>
                <c:forEach items="${waitList}" var="wait" varStatus="vs">
                    <tr>
                        <td>${wait.edsm.edsmStartDatetime}</td>
                        <td>${wait.edsm.edsmExpireDatetime}</td>
                        <td>${wait.edsm.sample.sampleTitle}</td>
                        <td><a href="${contextPath}/edsm/edsmDetail.do?edsmNo=${wait.edsm.edsmNo}">${wait.edsm.edsmTitle}</a></td>
                        <td>${wait.emp.empName}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <hr>
        <h6 style="padding-left:10px;">기안 문서</h6>
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
                <c:forEach items="${draftList}" var="draft" varStatus="vs">
                    <tr>
                        <td>${draft.edsmNo}</td>
                        <td>${draft.edsmStartDatetime}</td>
                        <td>${draft.edsmEndDatetime}</td>
                        <td>${draft.edsmExpireDatetime}</td>
                        <td>
                            <a href="${contextPath}/edsm/edsmDetail.do?edsmNo=${draft.edsmNo}">${draft.edsmTitle}</a>
                        </td>
                        <td>${draft.sample.sampleTitle}</td>
                        <td>
                            <!--a0001 진행중 a0002 반려 a0003 완료-->
                            <c:if test="${draft.edsmStatus == 'a0001'}">
                                <button class="btn btn-xs btn-fill" style="background-color:green;border:none">진행중</button>
                            </c:if>
                            <c:if test="${draft.edsmStatus == 'a0002'}">
                                <button class="btn btn-xs btn-fill" style="background-color:red;border:none">반려</button>
                            </c:if>
                            <c:if test="${draft.edsmStatus == 'a0003'}">
                                <button class="btn btn-xs btn-fill" style="background-color:blue;border:none">완료</button>
                            </c:if>
                            <c:if test="${draft.edsmStatus == 'a0004'}">
                                <button class="btn btn-xs btn-fill" style="background-color:orange;border:none">만료</button>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>