<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>


<style>
.subtab > li {
    padding-top: 10px;
}    
.subtab2 li {
    padding-left: 30px;
}
#new-community {
	margin-left: 10px;
	margin-top: 10px;
}
</style>

<div class="card">
    <div class="header">
        커뮤니티 메뉴
    </div>

		<c:if test="${emp.empCode != null && emp.empCode == 'admin'}">
		    <div>
		    	<button type="button" class="btn btn-info btn-fill" id="new-community">커뮤니티 추가</button>
		    </div>
	    </c:if>

    <div class="content">
        <ul class="list-unstyled subtab" id="community-list">
            <li><a href="/community/notice">공지사항</a></li>
            <li><a href="/community/free">자유게시판</a></li>
            <li><a href="/community/dept">부서별게시판</a></li>
            <li><a href="/community/ref">자료실</a></li>
        </ul>
    </div>
    
</div>


<script>

document.addEventListener('DOMContentLoaded', function () {
    const newCommunityButton = document.getElementById('new-community');
    
    if (newCommunityButton) {
        newCommunityButton.addEventListener('click', function () {
            const communityList = document.getElementById('community-list');
            
            if (communityList) {
                // Prompt the user to enter a new community name
                const communityName = prompt('새로운 커뮤니티 이름을 입력하세요:');
                
                // Check if the user entered a name
                if (communityName) {
                    // Prompt the user to enter a URL-friendly name (English word)
                    const communityUrl = prompt('URL에 사용할 영어 단어를 입력하세요:');
                    
                    // Check if the user entered a URL-friendly name
                    if (communityUrl) {
                        const newCommunityItem = document.createElement('li');
                        const newCommunityLink = document.createElement('a');
                        
                        // Set the new community link's properties
                        newCommunityLink.href = '/community/' + encodeURIComponent(communityUrl);
                        newCommunityLink.textContent = communityName;
                        
                        // Append the link to the new list item
                        newCommunityItem.appendChild(newCommunityLink);
                        
                        // Append the new list item to the community list
                        communityList.appendChild(newCommunityItem);

                        // Show a confirmation popup
                        alert('새로운 커뮤니티가 추가되었습니다.');
                    } else {
                        alert('URL에 사용할 영어 단어를 입력하지 않았습니다.');
                    }
                } else {
                    alert('커뮤니티 이름을 입력하지 않았습니다.');
                }
            }
        });
    }
});
</script>

