<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<jsp:include page="../../layout/header.jsp" />
<div class="main-content">
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-2">
        <jsp:include page="./scheduleSidebar.jsp" />
      </div>
      <div class="col-md-10">
        <div class="card">
          <div class="header">
            <h4 class="title">일정 등록</h4>
          </div>
          <div class="content table-responsive table-full-width">
            <form id="frm-scdl-register" method="POST" action="${contextPath}/schedule/register.do" onsubmit="adjustEndDate()">
              <table class="table table-hover table-striped">
                <tbody>
                  <tr>
                    <td class="center-align">구 분</td>
                    <td>
                      <div class="center-content">
                        <div class="radio-option">
                          <input type="radio" id="personal" name="scdlPublicYn" value="N" checked onchange="toggleOpenCheckbox(this)">
                          <label for="personal">개인일정</label>
                        </div>
                        <div class="radio-option">
                          <input type="radio" id="company" name="scdlPublicYn" value="Y" onchange="toggleOpenCheckbox(this)">
                          <label for="company">전사일정</label>
                        </div>
                        <div class="checkbox-option">
                          <input type="checkbox" id="open" name="scdlOpenYn" value="Y">
                          <label for="open">공개</label>
                        </div>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td class="center-align">기 간</td>
                    <td>
                      <div class="center-content">
                        <input type="date" id="date-input-start" name="startDate" class="date-input" required onchange="checkDates()">
                        ~
                        <input type="date" id="date-input-end" name="endDate" class="date-input" required onchange="checkDates()">
                        <div id="time-inputs" style="display: none;">
                          <input type="time" id="time-input-start" name="startTime" class="time-input">
                          ~
                          <input type="time" id="time-input-end" name="endTime" class="time-input">
                          <input type="checkbox" id="checkboxAllday" onclick="toggleTimeInputs()">
                          <label for="checkboxAllday">종일</label>
                        </div>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td class="center-align">제 목</td>
                    <td colspan="2">
                      <input type="text" class="form-control" name="scdlTitle" placeholder="제목을 입력하세요" required>
                    </td>
                  </tr>
                  <tr>
                    <td class="center-align">내 용</td>
                    <td colspan="2">
                      <textarea class="form-control" name="scdlContents" rows="5" placeholder="내용을 입력하세요" required></textarea>
                    </td>
                  </tr>
                  <tr style="text-align: right">
                    <td colspan="3">
                      <input type="hidden" name="empCode" value="${sessionScope.emp.empCode}"> 
                      <button type="submit" class="btn btn-info btn-fill">등록</button>
                      <a href="${contextPath}/schedule/mySchedule.page">
                      <button type="button" class="btn btn-info btn-fill">취소</button>
                      </a>
                    </td>
                  </tr>
                </tbody>
              </table>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<jsp:include page="../../layout/footer.jsp" />

<style>
  .time-input {
    display: inline-block;
    width: auto;
  }
  .time-input:disabled {
    background-color: #f0f0f0; /* disabled background color */
    color: #a0a0a0; /* disabled text color */
  }
  .checkbox-group {
    display: flex;
  }
  .checkbox-group div {
    display: flex;
  }
  .checkbox-group input[type="checkbox"] {
    margin-right: 5px;
  }
  tr {
    height: 90px;
  }
  .center-align {
    text-align: center;
    vertical-align: middle;
  }
</style>

<script>
  function toggleTimeInputs() {
    var checkbox = document.getElementById('checkboxAllday');
    var timeInputs = document.querySelectorAll('.time-input');
    
    timeInputs.forEach(function(input) {
      input.disabled = checkbox.checked;
      if (checkbox.checked) { // 종일 일정 선택 시
        input.value = ''; // 시간 input 없음 
      }
    });
  }

  function toggleOpenCheckbox(radio) {
    var openCheckbox = document.getElementById('open');
    if (radio.value === 'Y') { // 전사 일정 선택 시 
      openCheckbox.disabled = true;
      openCheckbox.checked = true;
    } else { // 개인 일정 선택 시 
      openCheckbox.disabled = false;
      openCheckbox.checked = false;
    }
  }

  function checkDates() {
    var startDate = document.getElementById('date-input-start').value;
    var endDate = document.getElementById('date-input-end').value;
    var timeInputsDiv = document.getElementById('time-inputs');
    
    if (startDate === endDate) {
      timeInputsDiv.style.display = 'block';
    } else {
      timeInputsDiv.style.display = 'none';
    }
  }

  function adjustEndDate() {
	  
    var startDate = document.getElementById('date-input-start').value;
    var endDateInput = document.getElementById('date-input-end');
    var endDate = new Date(endDateInput.value);
    if (startDate !== endDateInput.value) {
      endDate.setDate(endDate.getDate() + 1);
      endDateInput.value = endDate.toISOString().split('T')[0];
    }
    
  }
</script>
