<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<style>
.appr-table > tbody > tr > td { font-size: 15px; text-align: center; height:20px; }
.td-img { min-width: 100px; }
.appr-table { min-width: 120px; }
.sign { width: 100px; height: 100px; }
</style>

<div class="card">
    <div class="header">
        전자결재 결재하기
    </div>
    <div class="content table-responsive table-full-width">
        <table class="table table-hover table-striped">
            <tbody>
                <tr>
                    <th>문서 제목</th>
                    <td>${edsm.edsmTitle}</td>
                </tr>
                <tr>
                    <th>기안자</th>
                    <td>${edsm.emp.empName}</td>
                </tr>
                <tr>
                    <th>기안일</th>
                    <td>${edsm.edsmStartDatetime}</td>
                </tr>
                <tr>
                    <th>상태</th>
                    <td>
                        <c:if test="${edsm.edsmStatus == 'a0001'}">진행중</c:if>
                        <c:if test="${edsm.edsmStatus == 'a0002'}">반려</c:if>
                        <c:if test="${edsm.edsmStatus == 'a0003'}">완료</c:if>
                        <c:if test="${edsm.edsmStatus == 'a0004'}">만료</c:if>
                    </td>
                </tr>
            </tbody>
        </table>
        <c:if test="${edsm.edsmSeq == appr.apprSeq && appr.emp.empCode == sessionScope.emp.empCode}">
            <form action="${contextPath}/edsm/confirmAppr.do" method="post">
                <div class="content">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="의견" name="comment"/>
                        <input type="hidden" name="apprNo" value="${appr.apprNo}">
                        <input type="hidden" name="apprSeq" value="${appr.apprSeq}">
                        <input type="hidden" name="edsmNo" value="${edsm.edsmNo}">
                        <input type="hidden" name="edsmSeq" value="${edsm.edsmSeq}">
                    </div>
                    <div>
                        <select name="apprStatus" class="selectpicker" data-title="--문서 승인--" data-style="btn-default btn-block" data-menu-style="dropdown-blue">
                            <option value="p0003">승인</option>
                            <option value="p0002">반려</option>
                        </select>
                    </div>
                    <div>
                        <button type="submit" class="btn btn-info btn-fill" style="margin-top: 10px;">확인</button>
                    </div>
                </div>
            </form>
        </c:if>
    </div>
    <div class="content">
        ${edsm.edsmContent}
    </div>
</div>
<script>
window.addEventListener('DOMContentLoaded', function(){
    $.ajax({
        type: 'GET',
        url: fnGetContextPath() + '/edsm/getApprList.do',
        data: 'edsmNo=${edsmNo}',
        contentType: "application/json; charset=utf-8;",
        success: (resData) => {
            var td = $('#tr2').children();
            td.each(function(i) {
                var orgHtml = td.eq(i).html();
                td.eq(i).empty();
                if(i == 0) {
                    td.eq(i).append("<img class='sign' src='" + fnGetContextPath() + "${edsm.emp.signFileName}'>" + orgHtml);
                } else {
                    if(resData.apprList[i-1].apprStatus == 'p0003')
                        td.eq(i).append("<img class='sign' src='" + fnGetContextPath() + resData.apprList[i-1].emp.signFileName + "'>" + orgHtml);
                    else
                        td.eq(i).append(orgHtml);
                }
            });
        },
        error: (jqXHR) => {
            alert(jqXHR.statusText + '(' + jqXHR.status + ')');
        }
    });
});
</script>