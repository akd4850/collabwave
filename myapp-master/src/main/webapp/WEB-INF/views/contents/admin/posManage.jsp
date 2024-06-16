<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

<div class="card">
    <div class="header">
        직급 관리
    </div>
    <div class="content table-responsive table-full-width">

        <button type="button" class="btn btn-info btn-fill" data-toggle="modal" data-target="#posRegisterModal">등록</button>
        
        <table class="table table-hover table-striped">
            
            <thead>
                <tr>
                    <th>직급코드</th>
                    <th>직급명</th>
                    <th>사용인원</th>
                    <th>사용여부</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${posList}" var="pos" varStatus="vs">
                    <tr>
                        <td>${pos.posCode}</td>
                        <td><a data-toggle="modal" id="btn-modify-modal" href="#posModifyModal" onclick="fnSetModalValue();">${pos.posName}</td>
                        <td>${pos.users}</td>
                        <td>${pos.useYn}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        ${paging}
    </div>
</div>


<!-- 모달(직급등록) -->
<div class="modal fade" id="posRegisterModal">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <form method="POST"
                  action="${contextPath}/admin/pos/add.do">
    
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">직급 등록</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body">
                    <div class="form-group">
                        <label>직급코드</label>
                        <input type="text" class="form-control" placeholder="직급코드" id="posCode" name="posCode">
                    </div>
                    <div class="form-group">
                        <label>직급명</label>
                        <input type="text" class="form-control" placeholder="직급명" id="posName" name="posName">
                    </div>
                </div>
        
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="submit" class="btn btn-info btn-fill">등록</button>
                    <button type="button" class="btn btn-danger btn-fill" data-dismiss="modal">취소</button>
                </div>
            </form>
        </div>
    </div>
</div>


<!-- 모달(직급수정) -->
<div class="modal fade" id="posModifyModal">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <form method="POST"
                  action="${contextPath}/admin/pos/modify.do">
    
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">직급 수정</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body">
                    <div class="form-group">
                        <label>직급코드</label>
                        <input type="text" class="form-control" placeholder="직급코드" id="modal-posCode" name="positionCode">
                    </div>
                    <div class="form-group">
                        <label>직급명</label>
                        <input type="text" class="form-control" placeholder="직급명" id="modal-posName">
                    </div>
                </div>
        
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="submit" class="btn btn-info btn-fill">수정</button>
                    <button type="button" class="btn btn-danger btn-fill" data-dismiss="modal">취소</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>

    const fnSetModalValue = () => {
        $.ajax({
            type: 'GET',
            url: '${contextPath}/admin/pos/modalPosInfo.do',
            data: 

        })
        var selectedPosName = event.target.textContent;
        console.log('선택한 직급명: ', selectedPosName);
        $("#modal-posName").val(selectedPosName);
        var selectedIndex = event.target.name;
        console.log('선택한 인덱스: ', selectedIndex);

    };



</script>