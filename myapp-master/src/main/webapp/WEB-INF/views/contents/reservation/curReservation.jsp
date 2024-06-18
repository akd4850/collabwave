<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<style>
     .date-input {
    position: absolute;
    top: 25%;
    left: 55%;
    transform: translate(-50%, -50%);
    opacity: 0;
    pointer-events: auto;
}
    .timeset {
        text-align: center;
    }

</style>

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
                <div class="center-content">
                    <h4 class="timeset">
                        <div id="date-display" class="date-display" onclick="showDatePicker()"></div>
                        <input type="date" id="date-input-start" class="date-input" onchange="handleDateChange()">
                    </h4>
                </div>
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
        <div id="paging"></div>
    </div>
</div>

<script>

      /* 날짜 표시 */
      function setDefaultDate() {
        const dateInput = document.getElementById('date-input-start');
        const today = new Date();
        const yyyy = today.getFullYear();
        const mm = String(today.getMonth() + 1).padStart(2, '0');
        const dd = String(today.getDate()).padStart(2, '0');
        const formattedToday = yyyy + '-' + mm + '-' + dd;
        dateInput.value = formattedToday;
        updateDateDisplay(formattedToday.replace(/-/g, '/'));
        fnReservationList(formattedToday.replace(/-/g, '/'));
    }

  function updateDateDisplay(date) {
      const dateDisplay = document.getElementById('date-display');
      const [yyyy, mm, dd] = date.split('/');
      dateDisplay.textContent = yyyy + '년 ' + mm + '월 ' + dd + '일 ▼';
  }

  function showDatePicker() {
      const dateInput = document.getElementById('date-input-start');
      dateInput.showPicker(); // Use the showPicker method to display the date picker
  }

  function handleDateChange() {
        const dateInput = formatDate(document.getElementById('date-input-start').value);
        updateDateDisplay(dateInput);
        fnReservationList(dateInput);
    }

  function formatDate(dateStr) {
        return dateStr.replace(/-/g, '/');
    }

  document.addEventListener('DOMContentLoaded', function() {
        setDefaultDate();

        document.getElementById('date-input-start').addEventListener('click', function() {
            this.showPicker();
        });
    });

    var page = 1;

    const fnReservationList = (date) => {
        console.log('Sending date:', date);

        $.ajax({
            type: 'GET',
            url: '${contextPath}/reservation/reservationList.do',
            data: {
                page: page,
                date: date
            },    
            dataType: 'json',
            success: (resData) => {
                let paging = $('#paging');
                $('.reservation-list').empty();
                paging.empty();
                $.each(resData.reservationList, (i, reservation) => {
                    let str = '<tr>';
                    str += '<td>' + reservation.asset.assetName + '</td>';
                    str += '<td>' + reservation.emp.empName + '</td>';
                    str += '<td>' + reservation.startTime + '</td>';
                    str += '<td>' + reservation.endTime + '</td>';
                    str += '<td>' + reservation.reason + '</td>';
                    str += '</tr>';
                    $('.reservation-list').append(str);
                });
                paging.append(resData.paging);
            },
            error: (jqXHR) => {
                alert(jqXHR.statusText + '(' + jqXHR.status + ')');
            }
        });
    }

    const fnPaging = (p) => {
        page = p;
        fnReservationList(formatDate(document.getElementById('date-input-start').value));
    }

</script>
