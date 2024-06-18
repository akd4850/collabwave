<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<div class="card">
    <div class="header">
        자산 관리
    </div>
    <div class="content table-responsive table-full-width">
        <input type="button"
                class="btn btn-info btn-fill"
                style="margin-left:10px"
                onclick="location.href='/reservation/addGoods.page'"
                value="자산 추가">
        <table class="table table-hover table-striped">
            <thead>
                <tr>
                    <th>타입</th>
                    <th>상세</th>
                    <th>이름</th>
                    <th>보조</th>
                    <th>수정</th>
                    <th>삭제</th>
                </tr>
            </thead>
            <tbody class="asset-list">
              
            </tbody>
        </table>
        <div id="paging"></div>
    </div>
</div>

<script>
    var page = 1;
    
    const fnGetAssetList = () => {
        $.ajax({
            type: 'GET',
            url: '${contextPath}/reservation/getAssetList.do',
            data: 'page=' + page,
            dataType: 'json',
            success: (resData) => {
                let paging = $('#paging');
                $('.asset-list').empty();
                $.each(resData.assetList, (i, asset) => {
                    let str = '<tr>';
                    str += '<td>' + asset.assetType + '</td>';
                    str += '<td>' + asset.assetSubname + '</td>';
                    str += '<td>' + asset.assetName + '</td>';
                    str += '<td>' + (asset.subasset ? asset.subasset : '') + '</td>';
                    str += '<td><button type="button" class="btn btn-info btn-fill edit-button" data-code="' + asset.assetCode + '">수정</button></td>';
                    str += '<td><button type="button" class="btn btn-danger btn-fill delete-button" data-code="' + asset.assetCode + '">삭제</button></td>';
                    str += '</tr>';
                    $('.asset-list').append(str);
                });
                paging.append(resData.paging);

                $('.edit-button').on('click', function() {
                    var assetCode = $(this).data('code');
                    window.location.href = '${contextPath}/reservation/editAsset.page?assetCode=' + assetCode;
                });

                $('.delete-button').on('click', function() {
                    var assetCode = $(this).data('code');
                    window.location.href = '${contextPath}/reservation/removeAsset.page?assetCode=' + assetCode;
                });

            },
            error: (jqXHR) => {
                alert(jqXHR.statusText + '(' + jqXHR.status + ')');
            }
        });
    }

    fnGetAssetList();
</script>
