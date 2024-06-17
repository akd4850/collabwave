<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>
    .date-input {
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      opacity: 0;
      pointer-events: auto;
    }

</style>

    <div class="card">
        <div class="header">
            자산 예약
        </div>
        <div class="content">
        <form id="frm-reservationAsset"
              method="POST"
              onsubmit="return combineDateTime()"
              action="${contextPath}/reservation/addReservation.page">
              
        
              <div class="center-content">
                <h4>
                    <div id="date-display" class="date-display" onclick="showDatePicker()"></div>
                    <input type="date" id="date-input-start" class="date-input" onchange="handleDateChange()">
                </h4>
                </div>
                <div class="container mt-4">
                  <div class="row">
                    <div class="col-md-4">
                      <div class="form-group">
                        <label>시작 시간</label>
                        <input type="time" class="form-control" placeholder="시작 시간" id="startTime" onchange="forceMinutesToZero(this)" value="">
                      </div>
                    </div>
                    <div class="col-md-4">
                      <div class="form-group">
                        <label>종료 시간</label>
                        <input type="time" class="form-control" placeholder="종료 시간" id="endTime" onchange="forceMinutesToZero(this)" value="">
                      </div>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                    <label id="asset-type-label">예약자</label>
                    <input type="text" class="form-control" id="empName" name="empName" placeholder="예약자" value="${emp.empName} ${emp.position.positionName}" readonly>
                </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label>예약 자산</label>
                        <select id="asset-type" class="form-control" name="assetType" onchange="updateSubassetAndCode()">
                            <c:forEach items="${assetList}" var="asset" varStatus="vs">
                              <option value="${asset.ASSET_NAME}" data-subasset="${asset.SUBASSET}" data-assetcode="${asset.ASSET_CODE}">${asset.ASSET_NAME}</option>
                            </c:forEach>
                          </select>
                    </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                      <label>보유 기자재</label>
                      <input type="text" class="form-control" id="subasset" name="subasset" placeholder="보유 기자재" readonly>
                    </div>
              </div>
            </div>

            <div class="form-group">
                <label id="asset-type-label">예약 사유</label>
                <input type="text" class="form-control" id="asset-subname" name="reason" placeholder="예약 사유" value="">
            </div>
    
            
            <input type="hidden" id="assetCode" name="assetCode">
            <input type="hidden" id="startDatetime" name="startDatetime" value="">
            <input type="hidden" id="endDatetime" name="endDatetime" value="">
            <input type="hidden" id="empCode" name="empCode" value="${emp.empCode}">
            <button type="submit" class="btn btn-info btn-fill pull-right">등록</button>
            <div class="clearfix"></div>
        </form>
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
      updateDateDisplay(formattedToday);
    }

    function updateDateDisplay(date) {
      const dateDisplay = document.getElementById('date-display');
      const [yyyy, mm, dd] = date.split('-');
      dateDisplay.textContent = yyyy + '년' + mm + '월' + dd+'일 ▼';
    }

    function showDatePicker() {
      const dateInput = document.getElementById('date-input-start');
      dateInput.showPicker(); // Use the showPicker method to display the date picker
    }

    function handleDateChange() {
      const dateInput = document.getElementById('date-input-start');
      updateDateDisplay(dateInput.value);
    }

    window.onload = setDefaultDate;

    /* 시간 표시 */

    function forceMinutesToZero(input) {
      if (input.value) {
        const timeParts = input.value.split(':');
        if (timeParts.length === 2) {
          input.value = timeParts[0] + ':00';
        }
      }
    }


    /* 타임스탬프 구하기 */
    function combineDateTime() {
    const dateInput = document.getElementById('date-input-start').value;
    const startTime = document.getElementById('startTime').value;
    const endTime = document.getElementById('endTime').value;

    if (dateInput && startTime && endTime) {
        const startDatetime = dateInput + ' ' + startTime + ':00';
        const endDatetime = dateInput + ' ' + endTime + ':00';

        document.getElementById('startDatetime').value = startDatetime;
        document.getElementById('endDatetime').value = endDatetime;
    } else {
        alert('날짜와 시간을 모두 입력해주세요.');
        return false; // 폼 제출 중지
    }
}

function updateSubassetAndCode() {
        var assetSelect = document.getElementById('asset-type');
        var selectedOption = assetSelect.options[assetSelect.selectedIndex];
        var subasset = selectedOption.getAttribute('data-subasset');
        var assetCode = selectedOption.getAttribute('data-assetcode');

        document.getElementById('subasset').value = subasset;
        document.getElementById('assetCode').value = assetCode;
    }

    // 페이지 로드 시 초기값 설정
    document.addEventListener('DOMContentLoaded', function() {
        updateSubassetAndCode();
    });
    
</script>