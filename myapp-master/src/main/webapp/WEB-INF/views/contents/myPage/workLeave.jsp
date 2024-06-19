<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<div class="main-content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="header">
                        근태 현황
                    </div>
                    <div class="text-center">
                        <h4 style="font-weight: 600;">
						<script>
						    var curMon = "${curMon}";
						
						    // 년도와 월 정보 분리
						    var parts = curMon.split('-');
						    var year = parts[0]; // 년도
						    var month = parseInt(parts[1], 10); // 월 (문자열을 정수로 변환)
						
						    // 월을 한글로 변환하는 함수
						    function monthToKorean(month) {
						        var monthNames = ["", "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"];
						        return monthNames[month];
						    }
						
						    var curMonString = year + "년 " + monthToKorean(month);
						
						    document.write(curMonString);
						</script>
                        </h4>
                    </div>
                    <div class="content table-responsive table-full-width">
                        <table class="table table-hover table-striped">
                            <thead>
                                <th style="padding-left: 150px; width: 30%;">일차</th>
                                <th style="width: 20%;">업무시작</th>
                                <th style="width: 20%;">업무종료</th>
                                <th style="width: 20%;">총 근무시간</th>
                            </thead>
                            <tbody>
                                <c:forEach items="${attendanceList}" var="att" varStatus="vs">
                                    <tr>
                                        <td style="padding-left: 150px; width: ">${att.gotoworkDatetime.toString().split("T")[0].split("-")[2]}일</td>
                                        <td>${att.gotoworkDatetime.toString().split("T")[1]}</td>
                                        <td>${att.offworkDatetime.toString().split("T")[1]}</td>
                                        <td>
								            <script>
								                // att.minutes 값을 분으로 설정
								                var minutes = ${att.minutes};
								
								                // 분을 시간과 분으로 변환하는 함수
								                function convertMinutesToHours(minutes) {
								                    var hours = Math.floor(minutes / 60);
								                    var remainingMinutes = minutes % 60;
								                    return { hours: hours, minutes: remainingMinutes };
								                }
								
								                // 변환된 시간과 분을 가져오기
								                var time = convertMinutesToHours(minutes);
								
								                // 시간과 분을 문자열로 만들기
								                var timeString = time.hours + "시간 " + time.minutes + "분";
								
								                // HTML에 표시
								                document.write(timeString);
								            </script>
                                        </td>
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
