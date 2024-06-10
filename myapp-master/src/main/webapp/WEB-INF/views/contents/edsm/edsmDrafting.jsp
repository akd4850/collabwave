<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<div class="card">
    <div class="header">
        기안 문서함
    </div>
    <div class="content table-responsive table-full-width">
        <table class="table table-hover table-striped">
            <thead>
                <th>문서번호</th>
                <th>기안일</th>
                <th>완료일</th>
                <th>결재 양식</th>
                <th>첨부</th>
                <th>결재상태</th>
            </thead>
            <tbody>
                <!--<tr>
                    <td>2024-05-22</td>
                    <td>2024-05-23</td>
                    <td>업무협조</td>
                    <td>업무협조 문서 결재</td>
                    <td></td>
                    <td>2023-0523</td>
                    <td>
                        <button class="btn btn-xs btn-fill" style="background-color:blue;border:none">완료</button>
                        <button class="btn btn-xs btn-fill" style="background-color:red;border:none">반려</button>
                        <button class="btn btn-xs btn-fill" style="background-color:green;border:none">진행중</button>
                    </td>
                </tr>-->
                <c:forEach items="${draftList}" var="draft" varStatus="vs">
                    <tr>
                        <td>${draft.edsmNo}</td>
                        <td>${draft.edsmStartDatetime}</td>
                        <td>${draft.edsmEndDatetime}</td>
                        <td>${draft.sample.sampleTitle}</td>
                        <td></td>
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
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>