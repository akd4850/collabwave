<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<div class="card">
    <div class="content table-responsive table-full-width">
        <table class="table table-hover table-striped">
            <tbody>
                <tr>
                    <th style="width:100px">작성자</th>
                    <td>김민식</td>
                </tr>
                <tr>
                    <th>작성날짜</th>
                    <td>2023-05-23</td>
                </tr>
                <tr>
                    <th>제목</th>
                    <td>공지사항 필독바랍니다</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <textarea name="" id="" style="width:100%;height:500px">
                            얼룩말이 동물원을 탈출했습니다.
                            어서 잡아오십시오.
                        </textarea>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        첨부파일 없음
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <button type="button" class="btn btn-info btn-fill">수정</button>
                        <button type="button" class="btn btn-info btn-fill">삭제</button>
                        <button type="button" class="btn btn-info btn-fill">취소</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</div>