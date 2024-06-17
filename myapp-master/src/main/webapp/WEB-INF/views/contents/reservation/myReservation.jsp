<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<div class="card">
    <div class="header">
       내 예약 현황
    </div>
    <div class="content table-responsive table-full-width">
        <table class="table table-hover table-striped">
            <thead>
                <th>예약 자산</th>
                <th>예약자</th>
                <th>시작 시간</th>
                <th>종료 시간</th>
                <th>예약 사유</th>
                <th>취소</th>
            </thead>
            <tbody class="myReservation-list">
              
            </tbody>
        </table>
        <div class="pagination">
            <button class="btn btn-info btn-fill" onclick="prevPage()">이전</button>
            <span>페이지 <span id="page-number">1</span></span>
            <button class="btn btn-info btn-fill" onclick="nextPage()">다음</button>
        </div>
    </div>
</div>

<script>
var page = 1;
var totalPage = 0;

const formatDateTime = (timestamp) => {
/*    // 문자열 형식의 타임스탬프를 Date 객체로 변환
//    const date = new Date(timestamp.replace(" ", "T")); // 공백을 'T'로 변경하여 ISO 형식으로 만듭니다.
//    
    const year = date.getFullYear();
    const month = ('0' + (date.getMonth() + 1)).slice(-2); // 월은 0부터 시작하므로 1을 더합니다.
    const day = ('0' + date.getDate()).slice(-2);
    const hours = ('0' + date.getHours()).slice(-2);
    const minutes = ('0' + date.getMinutes()).slice(-2);
    
    return `${year}.${month}.${day} ${hours}:${minutes}`; */
    return timestamp;
}


const fnMyReservationList = () => {
    const empCode = "${emp.empCode}";

    $.ajax({
        type: 'GET',
        url: '${contextPath}/reservation/myReservationList.do',
        data: {
            page: page,
            empCode: empCode
        },
        dataType: 'json',
        success: (resData) => {
            totalPage = resData.totalPage;
            console.log(resData);
            $('.myReservation-list').empty();
            $.each(resData.myReservationList, (i, reservation) => {
                let str = '<tr>';
                str += '<td>' + reservation.asset.assetName + '</td>';
                str += '<td>' + reservation.emp.empName + '</td>';
                str += '<td>' + formatDateTime(reservation.startTime) + '</td>';
                str += '<td>' + formatDateTime(reservation.endTime) + '</td>';
                str += '<td>' + reservation.reason + '</td>';
                str += '<td><button type="button" class="btn btn-info btn-fill cancel-button" data-number="'+ reservation.reservationNumber +'">취소</button></td>';
                str += '</tr>';
                $('.myReservation-list').append(str);
            });
            $('.cancel-button').on('click', function() {
                var reservationNumber = $(this).data('number');
                cancelReservation(reservationNumber);
            });
            $('#page-number').text(page);
        },
        error: (jqXHR) => {
            alert(jqXHR.statusText + '(' + jqXHR.status + ')');
        }
    });
}

const cancelReservation = (reservationNumber) => {
    $.ajax({
        type: 'POST',
        url: '${contextPath}/reservation/removeReservation.page',
        data: { reservationNumber: reservationNumber },
        success: (resData) => {
            alert('예약이 취소되었습니다.');
            fnMyReservationList();
        },
        error: (jqXHR) => {
            alert(jqXHR.statusText + '(' + jqXHR.status + ')');
        }
    });
}

fnMyReservationList();

</script>
