<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<style>
    .table th:nth-child(1),
    .table td:nth-child(1) {
        width: 10%;
    }
    .table th:nth-child(2),
    .table td:nth-child(2) {
        width: 60%;
    }
</style>

<div class="main-content">
    <div class="container-fluid">
        <class class="row">

            <div class="col-md-6" style="height:400px;">
                <div class="card card-user">
                    <div class="image">
                        <img src="${contextPath}/resources/img/full-screen-image-3.jpg" alt="..."/>
                    </div>
                    <div class="content">
                        <div class="author">
                             <a href="/myPage/myInfo.page?empCode=${sessionScope.emp.empCode}">
                    <c:choose>
                        <c:when test="${not empty emp.profileFileName}">
                            <img class="avatar border-gray" src="${contextPath}${sessionScope.emp.profileFileName}" alt="프로필 이미지" loading="lazy" style="background-size: cover;"/>
                        </c:when>
                        <c:otherwise>
                            <img class="avatar border-gray" src="${contextPath}/resources/img/default_thumbnail.png" alt="기본 프로필" loading="lazy"/>
                        </c:otherwise>
                    </c:choose>
                              <h4 class="title">
                                ${sessionScope.emp.empName}<br />
                                <small>${sessionScope.emp.dept.deptName}</small><br>
                                 <small>${sessionScope.emp.position.positionName}</small>
                              </h4>
                            </a>
                        </div>

                    </div>
                </div>
            </div>            
            
            <div class="col-md-6" style="height:400px;">
                <div class="card card-user">
                    <div class="header" style="text-align: center;">
                        근태 관리
                    </div>
                    <div class="contents">
                        <div>
                            <h4 style="text-align: center;" id="today"></h4>
                        </div>
                        <table class="table table-hover table-striped">
                            <tbody >
                                <tr>
                                    <th style="width: 43%; text-align: center;">출근 시간</th>
                                    <td id="gotowork" ></td>
                                </tr>
                                <tr>
                                    <th style="width: 43%; text-align: center;">퇴근 시간</th>
                                    <td id="offwork"></td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="text-center">
                            <hr>
                            <input type="button" class="btn btn-info btn-fill" id="gotowork_btn" onclick="gotowork();" value="출근" disabled/> &nbsp;
                            <input type="button" class="btn btn-info btn-fill" id="offwork_btn" onclick="offwork();" value="퇴근" disabled/>
                            <br/>&nbsp;
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="card">
                    <div class="header">
                        자유게시판
                    </div>
                    <div class="content table-responsive table-full-width">
                        <table class="table table-hover table-striped">
                            <thead>
                                <th style="text-align: center;">순번</th>
                                <th>제목</th>
                                <th>등록날짜</th>
                            </thead>
                            <tbody>
                                <c:forEach items="${freeNewList}" var="post" varStatus="vs">
                                    <tr>
                                        <td style="text-align: center;">${vs.index + 1}</td>
                                        <td><a href="${contextPath}/community/detail?postNo=${post.postNo}">${post.postTitle}</a></td>
                						<td class="postCreateDatetime">${post.postCreateDatetime}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="card">
                    <div class="header">
                        공지사항
                    </div>
                    <div class="content table-responsive table-full-width">
                        <table class="table table-hover table-striped">
                            <thead>
                                <th style="text-align: center;">순번</th>
                                <th>제목</th>
                                <th>등록날짜</th>
                            </thead>
                            <tbody>
                                <c:forEach items="${postNewList}" var="post" varStatus="vs">
                                    <tr>
                                        <td style="text-align: center;">${vs.index + 1}</td>
                                        <td><a href="${contextPath}/community/detail?postNo=${post.postNo}">${post.postTitle}</a></td>
                						<td class="postCreateDatetime">${post.postCreateDatetime}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<script>
window.addEventListener('DOMContentLoaded', function() {
    getAttendanceInfo();
});

function getAttendanceInfo() {
    $.ajax({
        type: 'GET',
        url: fnGetContextPath() + '/attendance/getAttendanceToday.do',
        data: 'empCode=${sessionScope.emp.empCode}',
        contentType: "application/json; charset=utf-8;",
        dataType: 'json',
        success: (resData) => {

            let gotoworkBtn = $('#gotowork_btn');
            let offworkBtn = $('#offwork_btn');
            let gotowork = $('#gotowork');
            let offwork = $('#offwork');

            $('#today').empty();
            $('#today').append(resData.today);
            if(resData.bIsAttendance) {
                gotoworkBtn.attr("disabled", resData.attendance.gotoworkDatetime != null);
                offworkBtn.attr("disabled", resData.attendance.offworkDatetime != null);

                gotowork.empty();
                offwork.empty();
                if(resData.attendance.gotoworkDatetime != null) gotowork.append(fnExplodeDatetime(resData.attendance.gotoworkDatetime)[1]);
                if(resData.attendance.offworkDatetime != null) offwork.append(fnExplodeDatetime(resData.attendance.offworkDatetime)[1]);
            } else {
                gotoworkBtn.attr("disabled", false);
                offworkBtn.attr("disabled", true);
            }
        }
    });
}

function gotowork() {
    $.ajax({
        type: 'GET',
        url: fnGetContextPath() + '/attendance/gotowork.do',
        data: 'empCode=${sessionScope.emp.empCode}',
        contentType: "application/json; charset=utf-8;",
        dataType: 'json',
        success: (resData) => {
            if(resData.result == 1) {
                getAttendanceInfo();
                alert('출근처리되었습니다.');
            } else if(resData.result == -1) {
                alert('이미 출근처리된 상태입니다.');
            }
        }
    });
}

function offwork() {
    $.ajax({
        type: 'GET',
        url: fnGetContextPath() + '/attendance/offwork.do',
        data: 'empCode=${sessionScope.emp.empCode}',
        contentType: "application/json; charset=utf-8;",
        dataType: 'json',
        success: (resData) => {
            if(resData.result == 1) {
                getAttendanceInfo();
                alert('퇴근처리되었습니다.');
            } 
        }
    });
}

document.addEventListener("DOMContentLoaded", function() {
    var dateElements = document.querySelectorAll('.postCreateDatetime');
    dateElements.forEach(function(element) {
        var originalDate = element.textContent.trim();
        var formattedDate = moment(originalDate).format('YYYY-MM-DD HH:mm');
        element.textContent = formattedDate;
    });
});
</script>