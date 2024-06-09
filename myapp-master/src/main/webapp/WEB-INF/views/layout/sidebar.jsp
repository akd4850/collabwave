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
                    <img src="${contextPath}/resources/img/avatar.jpg" />
                </div>
  
                <a data-toggle="collapse" href="#">
                    <span>
                        김민식
                    </span>
                </a>
  
                <divid="collapseExample">
                    <ul class="nav">
                        <li class="sidebar-sub">
                            <a href="/myPage/workLeave.page">
                                <span class="sidebar-mini"><!--MP--></span>
                                <span class="sidebar-normal">근퇴 관리</span>
                            </a>
                        </li>
                        <li class="sidebar-sub">
                            <a href="/myPage/myInfo.page">
                                <span class="sidebar-mini"><!--MP--></span>
                                <span class="sidebar-normal">내 정보</span>
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
                <a href="/community/notice.page">
                    <i class="pe-7s-note2"></i>
                    <p>커뮤니티</p>
                </a>
            </li>            

            <li>
                <a href="/admin/adminMain.page">
                    <i class="pe-7s-network"></i>
                    <p>조직관리</p>
                </a>
            </li>
        
        </ul>
  
    </div>
</div>