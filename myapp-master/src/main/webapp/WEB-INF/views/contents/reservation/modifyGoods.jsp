<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

    <div class="card">
        <div class="header">
            자산 수정
        </div>
        <div class="content">
        <form id="frm-addAsset"
              method="POST"
              action="${contextPath}/reservation/modifyAsset.page">
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label>자산타입</label>
                        <input type="text" class="form-control" placeholder="자산타입" name="assetType" value="${asset.assetType}" readonly>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group">
                        <label>자산코드</label>
                        <input type="text" class="form-control" placeholder="자산코드" name="assetCode" value="${asset.assetCode}" readonly>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>자산명</label>
                        <input type="text" class="form-control" placeholder="자산명" name="assetName" value="${asset.assetName}">
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label id="asset-type-label">구분</label>
                <input type="text" class="form-control" id="asset-subname" name="assetSubname" placeholder="구분" value="${asset.assetSubname}">
            </div>
    
               
            <div id="room-fields" class="conditional-input hidden">
                <div class="form-group">
                    <label>보유 기자재</label>
                    <input type="text" class="form-control" name="subasset" placeholder="보유 기자재" value="${asset.subasset}">
                </div>
            </div>

            
            <button type="submit" class="btn btn-info btn-fill pull-right">등록</button>
            <div class="clearfix"></div>
        </form>
    </div>
</div>

<script>
    
    document.addEventListener("DOMContentLoaded", function() {
        var assetType = '${asset.assetType}';
        var assetSubnameInput = document.getElementById('asset-subname');
        var labelElement = document.getElementById('asset-type-label');
        var roomFields = document.getElementById('room-fields');

        function updateFieldsBasedOnAssetType(type) {
            if (type === '차량') {
                assetSubnameInput.placeholder = '차량 번호';
                labelElement.innerText = '차량 번호';
                roomFields.classList.add('hidden');
            } else if (type === '사무실') {
                assetSubnameInput.placeholder = '위치';
                labelElement.innerText = '위치';
                roomFields.classList.remove('hidden');
            } else {
                assetSubnameInput.placeholder = '구분';
                labelElement.innerText = '구분';
                roomFields.classList.add('hidden');
            }
        }

        // 초기 호출
        updateFieldsBasedOnAssetType(assetType);
    });
</script>