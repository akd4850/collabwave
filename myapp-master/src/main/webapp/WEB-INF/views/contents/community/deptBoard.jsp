<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>

<style>
.search-input {
    width: 140%; /* 원하는 너비로 조정 */
    font-size: 16px; /* 글꼴 크기 조정 */
    padding: 10px; /* 패딩 조정 */
}
.post-title-column {
  	width: 60%; /* 원하는 너비로 설정 */
}
.postCreateDatetime {
	width: 10%
}
    
</style>

<div class="card">
	<div class="header-container" >
	    <div class="header">부서별 게시판</div>
	    <div class="header" id="deptCode" style=" font-size: 18px;" data-dept-code="${sessionScope.emp.deptCode}" ></div>
	</div>   
    <div class="content table-responsive table-full-width">
        <input type="button"
               class="btn btn-info btn-fill"
               style="margin-left:10px"
               onclick="location.href='/community/dept/write'"
               value="글쓰기">
                
        <table class="table table-hover table-striped">
            <thead>
                <tr>
                	<th></th>
                    <th>글 제목</th>
                    <th>작성자</th>
                    <th>등록일</th>
                    <th>조회수</th>
                </tr>
            </thead>
            <tbody>
			    <c:forEach items="${postList}" var="post" varStatus="vs">
			        <tr>
			            <td id="postOpenYnContainer_${vs.index}">
			                <span id="postOpenYn_${vs.index}">${post.postOpenYn}</span>
			            </td>
                		<td class="post-title-column"><a href="/community/detail?postNo=${post.postNo}">${post.postTitle}</a></td>
			            <td>${post.emp.empName}</td>
                		<td class="postCreateDatetime">${post.postCreateDatetime}</td>
			            <td>${post.postHit}</td>
			        </tr>
			    </c:forEach>
			    
                <% String searchQuery = request.getParameter("query"); %>
				<form action="${contextPath}/community/dept/search" method="get">
				    <tr>
				        <td colspan="5">
				            <div style="display: flex; justify-content: flex-end; align-items: center;">
				                <input type="text" id="search" name="query" class="form-control search-input" placeholder="검색어를 입력해주세요"                        
				                value="<%= searchQuery != null ? searchQuery : "" %>" 
				                style="width: 400px; margin-right: 10px;">
				                <input type="hidden" name="brdCode" id="brdCode" value="DEPT">
				                <button type="submit" class="btn btn-outline-secondary" id="btn-search">검색</button>
				            </div>
				        </td>
				    </tr>
				</form>
                
            </tbody>
        </table>
    </div>
    
    <div>${paging}</div>
    
</div>

<script>
document.addEventListener("DOMContentLoaded", function() {
    var dateElements = document.querySelectorAll('.postCreateDatetime');
    dateElements.forEach(function(element) {
        var originalDate = element.textContent.trim();
        var formattedDate = moment(originalDate).format('YYYY-MM-DD HH:mm');
        element.textContent = formattedDate;
    });
});

document.addEventListener("DOMContentLoaded", function() {
    var deptElement = document.getElementById("deptCode");
    var deptCode = deptElement.getAttribute("data-dept-code");
    
    var deptName = "";
    switch(deptCode) {
        case "d1000":
            deptName = "< 경영지원실 >";
            break;
        case "d1100":
            deptName = "< 인사과 >";
            break;
        case "d1200":
            deptName = "< 총무과 >";
            break;
        case "d1300":
            deptName = "< 회계과 >";
            break;
        case "d2000":
            deptName = "< 영업관리실 >";
            break;
        case "d2100":
            deptName = "< 영업과 >";
            break;
        case "d2200":
            deptName = "< 영업관리과 >";
            break;
        default:
        	return;
    }
    
    deptElement.innerText = deptName;
});

document.addEventListener('DOMContentLoaded', function() {
    var totalPosts = ${postList.size()}; 
    for (var i = 0; i < totalPosts; i++) {
        var container = document.getElementById('postOpenYnContainer_' + i);
        var spanElement = document.getElementById('postOpenYn_' + i);
        var postOpenYn = spanElement.textContent.trim();

        if (postOpenYn === 'Y') {
            spanElement.textContent = '중요';
            spanElement.style.color = 'red'; 
        } else {
            if (spanElement) {
                spanElement.style.display = 'none'; // Hide the span element if 'Y' is not present
            }        
        }
    }
});

</script>