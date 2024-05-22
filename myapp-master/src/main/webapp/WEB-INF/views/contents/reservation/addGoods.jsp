<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<div class="card">
    <div class="header">
        <h4 class="title">내 정보</h4>
    </div>
    <div class="content">
        <form>
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label>자산코드</label>
                        <input type="text" class="form-control" placeholder="자산코드" value="">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>이름</label>
                        <input type="text" class="form-control" placeholder="스타렉스" value="">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>구분</label>
                        <select name="cities" class="selectpicker" data-title="Single Select" data-style="btn-default btn-block" data-menu-style="dropdown-blue">
                            <option value="">공간</option>
                            <option value="">물품</option>
                        </select>
                    </div>
                </div>
            </div>

            <button type="submit" class="btn btn-info btn-fill pull-right">등록</button>
            <div class="clearfix"></div>
        </form>
    </div>
</div>