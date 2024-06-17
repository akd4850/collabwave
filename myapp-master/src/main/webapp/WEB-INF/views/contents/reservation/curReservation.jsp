<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<div class="card">
    <div class="header">
       예약 현황
    </div>
    <div class="content table-responsive table-full-width">
        <input type="button"
                class="btn btn-info btn-fill"
                style="margin-left:10px"
                onclick="location.href='/reservation/reservationAsset.page?empCode=${sessionScope.emp.empCode}'"
                value="예약 하기">
        <table class="table table-hover table-striped">
            <thead>
                <th>예약 자산</th>
                <th>예약자</th>
                <th>시작 시간</th>
                <th>종료 시간</th>
                <th>예약 사유</th>
            </thead>
            <tbody class="reservation-list">

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
    const date = new Date(timestamp);
    const year = date.getFullYear();
    const month = ('0' + (date.getMonth() + 1)).slice(-2); // Months are zero-based
    const day = ('0' + date.getDate()).slice(-2);
    const hours = ('0' + date.getHours()).slice(-2);
    const minutes = ('0' + date.getMinutes()).slice(-2);
    return `${year}-${month}-${day} ${hours}:${minutes}`;
}

    const fnReservationList = () => {
        $.ajax({
            type: 'GET',
            url: '${contextPath}/reservation/reservationList.do',
            data: 'page=' + page,
            dataType: 'json',
            success: (resData) => {
                totalPage = resData.totalPage;
                console.log(resData);
                $('.reservation-list').empty();
                $.each(resData.reservationList, (i, reservation) => {
                    let str = '<tr>';
                        str += '<td>' + reservation.asset.assetName + '</td>';
                        str += '<td>' + reservation.emp.empName + '</td>';
                    str += '<td>' + formatDateTime(reservation.startDatetime) + '</td>';
                    str += '<td>' + formatDateTime(reservation.endDatetime) + '</td>';
                    str += '<td>' + reservation.reason + '</td>';
                    str += '</tr>';
                    $('.reservation-list').append(str);
                });
            },
            error: (jqXHR) => {
                alert(jqXHR.statusText + '(' + jqXHR.status + ')');
            }
        });
    }

    fnReservationList();

</script>