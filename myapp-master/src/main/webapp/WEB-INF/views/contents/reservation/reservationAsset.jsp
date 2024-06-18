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
        top: 19%;
        left: 55%;
        transform: translate(-50%, -50%);
        opacity: 0;
        pointer-events: auto;        
    }

    .hidden {
        display: none;
    }

    .form-control {
        width: 100%; /* 모든 입력란의 너비를 100%로 설정 */
    }
    .timeset {
        text-align: center;
    }

    #date-input-start {
        flex-shrink: 0; /* 입력 박스의 크기 축소 방지 */
        margin-left: auto; /* 입력 박스를 우측으로 정렬 */
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
                <h4 class="timeset">
                    <div id="date-display" class="date-display" onclick="showDatePicker()"></div>
                    <input type="date" id="date-input-start" class="date-input" onchange="handleDateChange()">
                </h4>
            </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group time">
                            <label>시작 시간</label>
                            <input type="time" class="form-control time-input" placeholder="시작 시간" id="startTime" min="09:00" max="18:00" onchange="forceMinutesToZero(this)" value="">
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>종료 시간</label>
                            <input type="time" class="form-control" placeholder="종료 시간" id="endTime" min="09:00" max="18:00" onchange="forceMinutesToZero(this)" value="">
                        </div>
                    </div>
                </div>
            <div class="form-group">
                <label id="asset-type-label">예약자</label>
                <input type="text" class="form-control" id="empName" name="empName" placeholder="예약자" value="${sessionScope.emp.empName} ${sessionScope.emp.position.positionName}" readonly>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label>자산 타입</label>
                        <select id="asset-type" class="form-control" name="assetType" onchange="updateAssetVisibility()">
                            <option value="">종류를 선택해주세요.</option>
                            <option value="사무실">사무실</option>
                            <option value="차량">차량</option>
                        </select>
                    </div>
                    <div id="asset-selection" class="hidden">
                        <div class="form-group">
                            <label id="asset-label">예약 자산</label>
                            <select id="roomAssetList" class="form-control" onchange="updateSubassetAndCode()">
                                <option value="">자산을 선택해주세요.</option>
                                <c:forEach items="${roomAssetList}" var="roomAsset" varStatus="vs">
                                    <option value="${roomAsset.ASSET_NAME}" data-subasset="${roomAsset.SUBASSET}" data-assetcode="${roomAsset.ASSET_CODE}">${roomAsset.ASSET_NAME}</option>
                                </c:forEach>
                            </select>
                            <select id="carAssetList" class="form-control hidden" onchange="updateSubassetAndCode()">
                                <option value="">자산을 선택해주세요.</option>
                                <c:forEach items="${carAssetList}" var="carAsset" varStatus="vs">
                                    <option value="${carAsset.ASSET_NAME}" data-subasset="${carAsset.SUBASSET}" data-assetcode="${carAsset.ASSET_CODE}">${carAsset.ASSET_NAME}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 hidden" id="subasset-group">
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
      dateDisplay.textContent = yyyy + '년 ' + mm + '월 ' + dd + '일 ▼';
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

  document.getElementById('date-input-start').addEventListener('click', function() {
      this.showPicker();
  });
  
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

      if (!document.getElementById('asset-type').value || !document.getElementById('roomAssetList').value && !document.getElementById('carAssetList').value) {
          alert('예약 자산을 선택해주세요.');
          return false;
      }

      if (dateInput && startTime && endTime) {
          const startDatetime = dateInput + ' ' + startTime + ':00';
          const endDatetime = dateInput + ' ' + endTime + ':00';

          if (startDatetime >= endDatetime) {
            alert('종료 시간은 시작 시간보다 늦어야 합니다.');
            return false;
        }

          document.getElementById('startDatetime').value = startDatetime;
          document.getElementById('endDatetime').value = endDatetime;
      } else {
          alert('날짜와 시간을 모두 입력해주세요.');
          return false; // 폼 제출 중지
      }
  }

  /* 자산 타입 변경 시 자산 목록을 숨기거나 표시하고 보유 기자재 값을 설정 */
  function updateAssetVisibility() {
      const assetType = document.getElementById('asset-type').value;
      const roomAssetList = document.getElementById('roomAssetList');
      const carAssetList = document.getElementById('carAssetList');
      const assetSelection = document.getElementById('asset-selection');
      const subassetGroup = document.getElementById('subasset-group');

      if (assetType === '사무실') {
          assetSelection.classList.remove('hidden');
          roomAssetList.classList.remove('hidden');
          carAssetList.classList.add('hidden');
          subassetGroup.classList.remove('hidden');
      } else if (assetType === '차량') {
          assetSelection.classList.remove('hidden');
          carAssetList.classList.remove('hidden');
          roomAssetList.classList.add('hidden');
          subassetGroup.classList.add('hidden');
      } else {
          assetSelection.classList.add('hidden');
          subassetGroup.classList.add('hidden');
      }
  }

  /* 자산 선택 시 subasset과 asset code를 업데이트 */
  function updateSubassetAndCode() {
      const assetType = document.getElementById('asset-type').value;
      let selectedAsset;
      const subassetGroup = document.getElementById('subasset-group');

      if (assetType === '사무실') {
          selectedAsset = document.getElementById('roomAssetList').selectedOptions[0];
      } else if (assetType === '차량') {
          selectedAsset = document.getElementById('carAssetList').selectedOptions[0];
      }

      if (selectedAsset) {
          const subasset = selectedAsset.dataset.subasset;
          const assetCode = selectedAsset.dataset.assetcode;
          document.getElementById('subasset').value = subasset;
          document.getElementById('assetCode').value = assetCode;
      } else {
          document.getElementById('subasset').value = '';
          document.getElementById('assetCode').value = '';
      }
  }

  // 페이지 로드 시 초기값 설정
  document.addEventListener('DOMContentLoaded', function() {
      setDefaultDate();
      updateAssetVisibility();
  });
</script>
