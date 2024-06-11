<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>
<nav class="navbar navbar-default">
    <div class="container-fluid">

        <!--div class="navbar-minimize">
            <button id="minimizeSidebar" class="btn btn-warning btn-fill btn-round btn-icon">
                <i class="fa fa-ellipsis-v visible-on-sidebar-regular"></i>
                <i class="fa fa-navicon visible-on-sidebar-mini"></i>
            </button>
        </div-->

        <div class="collapse navbar-collapse">

            <form class="navbar-form navbar-left navbar-search-form" role="search">
                <div class="input-group">
                    <input type="text" value="" class="form-control" placeholder="검색">
                    <span class="input-group-addon"><i class="fa fa-search"></i></span>
                </div>
            </form>

            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-bell-o"></i>
                        <span class="notification">5</span>
                        <p class="hidden-md hidden-lg">
                            Notifications
                            <b class="caret"></b>
                        </p>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Notification 1</a></li>
                        <li><a href="#">Notification 2</a></li>
                    </ul>
                </li>

                <li>
                    <a href="${contextPath}/">
                        <span class="text-primary">
                            <i class="pe-7s-plus"></i>
                                로그인 연장
                            </span>
                        <span> - 09분 30초</span>
                    </a>
                </li>

                <li>
                    <a href="${contextPath}/signout.do" class="text-danger">
                        <i class="pe-7s-close-circle"></i>
                        로그아웃
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>