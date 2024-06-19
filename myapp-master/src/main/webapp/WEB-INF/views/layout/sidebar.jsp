<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<style>
    .sidebar-sub {
        padding-left: 50px;
    }
</style>

<!--[sidebar]-->
<div class="sidebar" data-color="blue" data-image="${contextPath}/resources/img/full-screen-image-3.jpg">
    <div class="logo">
        <a href="#" class="simple-text logo-mini">
            GD
        </a>
  
        <a href="" class="simple-text logo-normal">
            CollabWave
        </a>
    </div>
  
    <div class="sidebar-wrapper">
  
      <!--[user]-->
        <div class="user">
            <div class="info">
                <div class="photo">
                    <c:choose>
                        <c:when test="${sessionScope.emp.profileFileName == null}">
                            <img src="${contextPath}/resources/img/new_logo.png" alt="기본 프로필" loading="lazy"/>
                        </c:when>
                        <c:otherwise>
                            <img src="${sessionScope.emp.profileFileName}" alt="프로필 이미지" loading="lazy"/>
                        </c:otherwise>
                    </c:choose>
                </div>
  
                <a data-toggle="collapse" href="#">
                    <span>
                        ${sessionScope.emp.empName}
                    </span>
                </a>
  
                <divid="collapseExample">
                    <ul class="nav">
                        <li class="sidebar-sub">
                            <a href="/myPage/myInfo.page?empCode=${sessionScope.emp.empCode}">
                                <span class="sidebar-mini"><!--MP--></span>
                                <span class="sidebar-normal">내 정보</span>
                            </a>
                        </li>
                        <li class="sidebar-sub">
                            <a href="/myPage/workLeave.page?empCode=${sessionScope.emp.empCode}">
                                <span class="sidebar-mini"><!--MP--></span>
                                <span class="sidebar-normal">근퇴 관리</span>
                            </a>
                        </li>
                    </ul>
                </divid=>
            </div>
        </div>
        <!--[end user]-->
  
        <ul class="nav">
            
            <li>
                <a href="/main.page">
                    <i class="pe-7s-home"></i>
                    <p>홈</p>
                </a>
            </li>

            <li>
                <a href="/schedule/mySchedule.page">
                    <i class="pe-7s-date"></i>
                    <p>일정관리</p>
                </a>
            </li>
        
            <li>
                <a href="/reservation/management.page"">
                    <i class="pe-7s-note"></i>
                    <p>예약관리</p>
                </a>
            </li>

            <li>
                <a href="/edsm/edsmMain.page">
                    <i class="pe-7s-note2"></i>
                    <p>전자결재</p>
                </a>
            </li>
        
            <li>
                <a href="/community/notice">
                    <i class="pe-7s-note2"></i>
                    <p>커뮤니티</p>
                </a>
            </li>

            <c:if test="${sessionScope.emp.deptCode == 'd1100'}">
            <li>
                <a href="/admin/emp/management.page">
                    <i class="pe-7s-network"></i>
                    <p>조직관리</p>
                </a>
            </li>
            </c:if>

            <li>
                <a href="/edsm/organizationChart.page">
                    <i class="pe-7s-network"></i>
                    <p>조직도</p>
                </a>
            </li>
        
        </ul>
  
    </div>
</div>