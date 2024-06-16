<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<div class="card">
    <div class="header">
        직급 관리
    </div>
    <div class="content table-responsive table-full-width">

        <button type="button" class="btn btn-info btn-fill" data-toggle="modal" data-target="#myModal">등록</button>

        
        <!-- The Modal -->
        <div class="modal fade" id="myModal">
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
                        <td><a href="/admin/pos/detail.do?posCode=${pos.posCode}">${pos.posName}</a></td>
                        <td>${pos.users}</td>
                        <td>${pos.useYn}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        ${paging}
    </div>
</div>
