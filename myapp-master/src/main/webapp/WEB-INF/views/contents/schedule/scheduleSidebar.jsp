<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<style>
.subtab > li {
    padding-top: 10px;
}    
.subtab2 li {
    padding-left: 30px;
}
.checkbox-container {
    display: flex;
    align-items: center;
}

.checkbox-container input[type="checkbox"] {
    display: none;
}

.checkbox-container label {
    margin-left: 8px;
    cursor: pointer;
}

.checkbox-container .color-box {
    width: 16px;
    height: 16px;
    display: inline-block;
    margin-right: 8px;
    border: 1px solid #000;
}

.checkbox-container input[type="checkbox"]:checked + .color-box {
    background-color: #007bff; /* 체크된 경우 색상 */
}

.checkbox-container input[type="checkbox"]:not(:checked) + .color-box {
    background-color: #ccc; /* 체크되지 않은 경우 색상 */
}

.checkbox-container span {
    display: inline-flex;
    align-items: center;
}

/* 추가된 CSS */
.checkbox-label {
    font-size: 16px;
    cursor: pointer;
}

.checked-company {
    color: blue;
}

.checked-mine {
    color: green;
}

.unchecked {
    color: black;
}
</style>

<div class="card">
    <div class="header">
        일정 관리 메뉴
    </div>
    <div class="content">
    
        <div>
            <button type="button" class="btn btn-info btn-fill" onclick="location.href='/schedule/registerSchedule.page'">
            일정 등록
            </button>
        </div>
        
        <hr>
        
        	  <button type="button" class="btn btn-info btn-fill" onclick="location.href='/schedule/mySchedule.page'">
            일정 확인
            </button>
        
        <!-- 
        <ul class="list-unstyled subtab">
            <li>
            <a href="/schedule/mySchedule.page">
            일정 확인
            </a>
            </li>
        </ul>
        -->
        
        <div class="checkbox">
            <input id="checkboxCompany" type="checkbox" checked onchange="updateLabelColor()"> 
            <label id="labelCompany" for="checkboxCompany" class="checkbox-label checked-company">
                전사 일정
            </label>
            <br>
            
            <input id="checkboxMine" type="checkbox" checked onchange="updateLabelColor()"> 
            <label id="labelMine" for="checkboxMine" class="checkbox-label checked-mine">
                개인 일정	
            </label>
            <br>
        </div>
        
    </div>
</div>

<script>

function updateLabelColor() {
    var checkboxCompany = document.getElementById('checkboxCompany');
    var labelCompany = document.getElementById('labelCompany');
    var checkboxMine = document.getElementById('checkboxMine');
    var labelMine = document.getElementById('labelMine');
    
    if (checkboxCompany.checked) {
        labelCompany.classList.remove('unchecked');
        labelCompany.classList.add('checked-company');
    } else {
        labelCompany.classList.remove('checked-company');
        labelCompany.classList.add('unchecked');
    }
    
    if (checkboxMine.checked) {
        labelMine.classList.remove('unchecked');
        labelMine.classList.add('checked-mine');
    } else {
        labelMine.classList.remove('checked-mine');
        labelMine.classList.add('unchecked');
    }
}

// 페이지 로드 시 초기 상태 업데이트
document.addEventListener('DOMContentLoaded', updateLabelColor);

</script>
