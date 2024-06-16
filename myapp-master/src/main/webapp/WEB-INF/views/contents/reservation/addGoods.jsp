<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

    <div class="card">
        <div class="header">
            자산 추가
        </div>
        <div class="content">
        <form id="frm-addAsset"
              method="POST"
              action="${contextPath}/reservation/addAsset.page">
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label>구분</label>
                        <select id="asset-type" class="form-control" name="assetType">
                            <option value="">선택</option>
                            <option value="사무실">사무실</option>
                            <option value="차량">차량</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>자산코드</label>
                        <input type="text" class="form-control" placeholder="자산코드" name="assetCode" value="">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>자산명</label>
                        <input type="text" class="form-control" placeholder="자산명" name="assetName" value="">
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label id="asset-type-label">구분</label>
                <input type="text" class="form-control" id="asset-subname" name="assetSubname" placeholder="구분" value="">
            </div>
    
               
            <div id="room-fields" class="conditional-input hidden">
                <div class="form-group">
                    <label>보유 기자재</label>
                    <input type="text" class="form-control" name="subasset" placeholder="보유 기자재" value="">
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

    // 구분 선택란의 변경 감지
    document.getElementById('asset-type').addEventListener('change', function() {
        var assetType = this.value;
        var assetSubnameInput = document.getElementById('asset-subname');
        var labelElement = document.getElementById('asset-type-label');

        
        // 선택된 구분에 따라 assetSubname 설정
        if (assetType === 'car') {
            assetSubnameInput.placeholder = '차량 번호';
            labelElement.innerText = '차량 번호';
        } else if (assetType === 'room') {
            assetSubnameInput.placeholder = '위치';
            labelElement.innerText = '위치';
        }

    });

    
</script>