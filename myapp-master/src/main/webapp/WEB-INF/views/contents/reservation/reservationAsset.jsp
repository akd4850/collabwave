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
      pointer-events: none;
    }

</style>

    <div class="card">
        <div class="header">
            자산 예약
        </div>
        <div class="content">
        <form id="frm-reservationAsset"
              method="POST"
              action="${contextPath}/reservation/addReservation.page">
              
        
              <div class="center-content">
                <h4>
                    <div id="date-display" class="date-display" onclick="showDatePicker()"></div>
                    <input type="date" id="date-input-start" name="startDate" class="date-input" onchange="handleDateChange()">
                </h4>
                </div>

                <div class="form-group">
                    <label id="asset-type-label">예약자</label>
                    <input type="text" class="form-control" id="empCode" name="reason" placeholder="예약 사유" value="${emp.empName} ${emp.position.positionName}" readonly>
                </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label>구분</label>
                        <select id="asset-type" class="form-control" name="assetType">
                            <c:forEach items="${assetList}" var="asset" varStatus="vs">
                                    <option>${asset.assetName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="container mt-4">
                    <div class="row">
                      <div class="col-md-4">
                        <div class="form-group">
                          <label>시작 시간</label>
                          <input type="time" class="form-control" placeholder="시작 시간" name="startDatetime" id="startDatetime" onchange="forceMinutesToZero(this)">
                        </div>
                      </div>
                      <div class="col-md-4">
                        <div class="form-group">
                          <label>종료 시간</label>
                          <input type="time" class="form-control" placeholder="종료 시간" name="endDatetime" id="endDatetime" onchange="forceMinutesToZero(this)">
                        </div>
                      </div>
                    </div>
                  </div>
            </div>

            <div class="form-group">
                <label id="asset-type-label">예약 사유</label>
                <input type="text" class="form-control" id="asset-subname" name="reason" placeholder="예약 사유" value="">
            </div>
    

            <input type="hidden" id="empCode" name="empCode" vlaue="empCode">
            <button type="submit" class="btn btn-info btn-fill pull-right">등록</button>
            <div class="clearfix"></div>
        </form>
    </div>

        
</div>

<script>

const assetSubnameInput = document.getElementById('asset-subname');

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
      dateDisplay.textContent = yyyy + '년' + mm + '월' + dd+'일';
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

    function forceMinutesToZero(input) {
      if (input.value) {
        const timeParts = input.value.split(':');
        if (timeParts.length === 2) {
          input.value = timeParts[0] + ':00';
        }
      }
    }


</script>