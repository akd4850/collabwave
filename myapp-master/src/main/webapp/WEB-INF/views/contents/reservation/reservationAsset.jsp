<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

    <div class="card">
        <div class="content">
        <form id="frm-reservationAsset"
              method="POST"
              action="${contextPath}/reservation/addReservation.page">
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label>구분</label>
                        <select id="asset-type" class="form-control" name="assetType">
                            <!-- for each로 assetCode 불러와서 예약할 품목들 보여주기-->
                            <!-- http://localhost:8090/schedule/registerSchedule.page -->
                        </select>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>시작 시간</label>
                        <input type="text" class="form-control" placeholder="시작 시간" name="startDatetime" value="">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>종료 시간</label>
                        <input type="text" class="form-control" placeholder="종료 시간" name="endDatetime" value="">
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label id="asset-type-label">예약 사유</label>
                <input type="text" class="form-control" id="asset-subname" name="reason" placeholder="예약 사유" value="">
            </div>
    


            <button type="submit" class="btn btn-info btn-fill pull-right">등록</button>
            <div class="clearfix"></div>
        </form>
    </div>
</div>

<script>

    
</script>