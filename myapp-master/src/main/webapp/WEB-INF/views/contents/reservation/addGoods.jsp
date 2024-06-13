<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

    <div class="card">
        <div class="content">
        <form >
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label>구분</label>
                        <select id="asset-type" class="form-control">
                            <option value="">선택</option>
                            <option value="room">사무실</option>
                            <option value="car">차량</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>자산코드</label>
                        <input type="text" class="form-control" placeholder="자산코드" value="">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>자산명</label>
                        <input type="text" class="form-control" placeholder="자산명" value="">
                    </div>
                </div>
            </div>

            <div id="car-fields" class="conditional-input hidden">
                <div class="form-group">
                    <label>차량 번호</label>
                    <input type="text" class="form-control" placeholder="차량 번호" value="">
                </div>
            </div>

            <div id="room-fields" class="conditional-input hidden">
                <div class="form-group">
                    <label>위치</label>
                    <input type="text" class="form-control" placeholder="위치" value="">
                </div>
                <div class="form-group">
                    <label>보유 기자재</label>
                    <input type="text" class="form-control" placeholder="보유 기자재" value="">
                </div>
            </div>

            <button type="submit" class="btn btn-info btn-fill pull-right">등록</button>
            <div class="clearfix"></div>
        </form>
    </div>
</div>

<script>
    $(document).ready(function() {
        $('#asset-type').change(function() {
            var selectedValue = $(this).val();
            $('.conditional-input').addClass('hidden');
            if (selectedValue === 'car') {
                $('#car-fields').removeClass('hidden');
            } else if (selectedValue === 'room') {
                $('#room-fields').removeClass('hidden');
            }
        });
    });


    
</script>