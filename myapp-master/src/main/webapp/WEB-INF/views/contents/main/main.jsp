<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<div class="main-content">
    <div class="container-fluid">
        <div class="row">

            <div class="col-md-4">
                <div class="card card-user">
                    <div class="image">
                        <img src="${contextPath}/resources/img/full-screen-image-3.jpg" alt="..."/>
                    </div>
                    <div class="content">
                        <div class="author">
                             <a href="#">
                            <img class="avatar border-gray" src="${contextPath}${sessionScope.emp.profileFileName}" alt="..."/>

                              <h4 class="title">
                                ${sessionScope.emp.empName}<br />
                                <small>${sessionScope.emp.dept.deptName}</small><br>
                                 <small>${sessionScope.emp.position.positionName}</small>
                              </h4>
                            </a>
                        </div>
                        <!--p class="description text-center"> "Lamborghini Mercy <br>
                                            Your chick she so thirsty <br>
                                            I'm in that two seat Lambo"
                        </p-->
                    </div>
                </div>
            </div>

            <div class="col-md-8">
                <div class="card">
                    <div class="header">
                        24 Hours Performance
                        <p class="category">Line Chart</p>
                    </div>
                    <div class="content">
                        <div id="chartPerformance" class="ct-chart "></div>
                    </div>
                </div>
            </div>
            
            <div class="col-md-4">
                <div class="card card-user">
                    <div class="header">
                        근퇴 관리
                    </div>
                    <div class="contents">
                        <div>
                            <h4 style="padding-left:10px" id="today"></h4>
                        </div>
                        <table class="table table-hover table-striped">
                            <tbody>
                                <tr>
                                    <th>출근 시간</th>
                                    <td id="gotowork"></td>
                                </tr>
                                <tr>
                                    <th>퇴근 시간</th>
                                    <td id="offwork"></td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="text-center">
                            <hr>
                            <input type="button" class="btn btn-info btn-fill" id="gotowork_btn" onclick="gotowork();" value="출근 하기" disabled/> 
                            <input type="button" class="btn btn-info btn-fill" id="offwork_btn" onclick="offwork();" value="퇴근 하기" disabled/>
                            <br/>&nbsp;
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-8">
                <div class="card">
                    <div class="header">
                        공지사항
                    </div>
                    <div class="content table-responsive table-full-width">
                        <table class="table table-hover table-striped">
                            <thead>
                                <th>제목</th>
                                <th>등록날짜</th>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>연말 정산 공지</td>
                                    <td>2023-12-26</td>
                                </tr>
                                <tr>
                                    <td>프로젝트 크런치 공지</td>
                                    <td>2023-11-20</td>
                                </tr>
                                <tr>
                                    <td>탕비실 이용 유의사항</td>
                                    <td>2023-10-30</td>
                                </tr>
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
</script>