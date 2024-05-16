<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<style>
    .sidebar-sub1 span, .sidebar-sub1 p {
        font-size: 12px;
        padding-left: 50px;
    }

    .sidebar-sub2 > li > a > span {
        font-size: 11px;
        padding-left: 75px;
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
  
            <a data-toggle="collapse" href="#collapseExample" class="collapsed">
                <span>
                    김민식
                    <b class="caret"></b>
                </span>
            </a>
  
            <div class="collapse" id="collapseExample">
                <ul class="nav">
                    <li>
                        <a href="#pablo">
                            <span class="sidebar-mini"><!--MP--></span>
                            <span class="sidebar-normal">내 정보</span>
                        </a>
                    </li>
  
                    <li>
                        <a href="#pablo">
                            <span class="sidebar-mini"><!--EP--></span>
                            <span class="sidebar-normal">정보 수정</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
      </div>
      <!--[end user]-->
  
      <ul class="nav">

        <li class="active">
          <a href="#">
              <i class="pe-7s-date"></i>
              <p>일정관리</p>
          </a>
        </li>
        
        <li>
            <a href="#">
                <i class="pe-7s-note"></i>
                <p>예약관리</p>
            </a>
        </li>

        <li>
            <a href="#">
                <i class="pe-7s-note2"></i>
                <p>전자결재</p>
            </a>
        </li>
        
        <li>
            <a data-toggle="collapse" href="#componentsExamples">
                <i class="pe-7s-smile"></i>
                <p>커뮤니티
                    <b class="caret"></b>
                </p>
            </a>
            <div class="collapse" id="componentsExamples">
                <ul class="nav sidebar-sub1">
                    <li>
                        <a href="#pablo">
                            <span>자유게시판</span>
                        </a>
                    </li>
                    <li>
                        <a href="#pablo">
                            <span>공지사항</span>
                        </a>
                    </li>
                    <li>
                        <a data-toggle="collapse" href="#community">
                            <p>부서별게시판
                                <b class="caret"></b>
                            </p>
                        </a>
                        <div class="collapse" id="community">
                            <ul class="nav sidebar-sub2">
                                <li>
                                    <a href="#pablo">
                                        <span>보드게임</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
        </li>

        <li>
            <a href="#">
                <i class="pe-7s-network"></i>
                <p>인사관리</p>
            </a>
        </li>

        <!--li>
          <a data-toggle="collapse" href="#componentsExamples">
              <i class="pe-7s-plugin"></i>
              <p>Menu with links
                  <b class="caret"></b>
              </p>
          </a>
          <div class="collapse" id="componentsExamples">
            <ul class="nav">
              <li>
                <a href="#pablo">
                  <span class="sidebar-mini">L1</span>
                  <span class="sidebar-normal">Link 1</span>
                </a>
              </li>
              <li>
                <a href="#pablo">
                  <span class="sidebar-mini">L2</span>
                  <span class="sidebar-normal">Link 2</span>
                </a>
              </li>
              <li>
                <a href="#pablo">
                  <span class="sidebar-mini">L3</span>
                  <span class="sidebar-normal">Link 3</span>
                </a>
              </li>
            </ul>
          </div>
        </li-->
        
      </ul>
  
    </div>
</div>