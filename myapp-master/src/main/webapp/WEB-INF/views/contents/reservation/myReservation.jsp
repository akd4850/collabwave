<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>


<style>
    .date-input {
   position: absolute;
   top: 23%;
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
       내 예약 현황
    </div>
    <div class="content table-responsive table-full-width">
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
                <th>취소</th>
            </thead>
            <tbody class="myReservation-list">
              
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
        fnMyReservationList(formattedToday.replace(/-/g, '/'));
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
        fnMyReservationList(dateInput);
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


const fnMyReservationList = (date) => {
    const empCode = "${emp.empCode}";
    $.ajax({
        type: 'GET',
        url: '${contextPath}/reservation/myReservationList.do',
        data: {
            page: page,
            empCode: empCode,
            date: date
        },
        dataType: 'json',
        success: (resData) => {
            let paging = $('#paging');
            $('.myReservation-list').empty();
            paging.empty();
            $.each(resData.myReservationList, (i, reservation) => {
                if (reservation.emp.empCode === empCode) {
                    let str = '<tr>';
                    str += '<td>' + reservation.asset.assetName + '</td>';
                    str += '<td>' + reservation.emp.empName + '</td>';
                    str += '<td>' + reservation.startTime + '</td>';
                    str += '<td>' + reservation.endTime + '</td>';
                    str += '<td>' + reservation.reason + '</td>';
                    str += '<td><button type="button" class="btn btn-danger btn-fill cancel-button" data-number="'+ reservation.reservationNumber +'">취소</button></td>';
                    str += '</tr>';
                    $('.myReservation-list').append(str);
                }
            });
            paging.append(resData.paging);
            $('.cancel-button').on('click', function() {
                var reservationNumber = $(this).data('number');
                cancelReservation(reservationNumber);
            });
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

const fnPaging = (p) => {
        page = p;
        fnMyReservationList(formatDate(document.getElementById('date-input-start').value));
    }
</script>
