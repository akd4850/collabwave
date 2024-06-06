<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

    <footer class="footer">
      <div class="container-fluid">
        <nav class="pull-left">
          <ul>
            <li>
              <a href="#">
                <!--Home-->
              </a>
            </li>
          </ul>
        </nav>
          <p class="copyright pull-right">
            &copy; <script>document.write(new Date().getFullYear())</script> <a href="#">COLLABWAVE</a>, GDJ77 3조 Final Project
          </p>
      </div>
    </footer>

  </div>
</div>
  
</body>

  <!--   Core JS Files  -->
  <script src="${contextPath}/resources/js/jquery.min.js" type="text/javascript"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="${contextPath}/resources/js/perfect-scrollbar.jquery.min.js" type="text/javascript"></script>


	<!--  Forms Validations Plugin -->
	<script src="${contextPath}/resources/js/jquery.validate.min.js"></script>

	<!--  Plugin for Date Time Picker and Full Calendar Plugin-->
	<script src="${contextPath}/resources/js/moment.min.js"></script>

  <!--  Date Time Picker Plugin is included in this js file -->
  <script src="${contextPath}/resources/js/bootstrap-datetimepicker.min.js"></script>

  <!--  Select Picker Plugin -->
  <script src="${contextPath}/resources/js/bootstrap-selectpicker.js"></script>

	<!--  Checkbox, Radio, Switch and Tags Input Plugins -->
  <script src="${contextPath}/resources/js/bootstrap-switch-tags.min.js"></script>

	<!--  Charts Plugin -->
	<script src="${contextPath}/resources/js/chartist.min.js"></script>

  <!--  Notifications Plugin    -->
  <script src="${contextPath}/resources/js/bootstrap-notify.js"></script>

  <!-- Sweet Alert 2 plugin -->
	<script src="${contextPath}/resources/js/sweetalert2.js"></script>

  <!-- Vector Map plugin -->
	<!--script src="${contextPath}/resources/js/jquery-jvectormap.js"></!--script-->

  <!--  Google Maps Plugin    -->
  <!--script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></!--script-->

	<!-- Wizard Plugin    -->
  <script src="${contextPath}/resources/js/jquery.bootstrap.wizard.min.js"></script>

  <!--  bootstrap Table Plugin    -->
  <script src="${contextPath}/resources/js/bootstrap-table.js"></script>

	<!--  Plugin for DataTables.net  -->
  <script src="${contextPath}/resources/js/jquery.datatables.js"></script>


  <!--  Full Calendar Plugin    -->
  <script src="${contextPath}/resources/js/fullcalendar.min.js"></script>

  <!-- Light Bootstrap Dashboard Core javascript and methods -->
	<script src="${contextPath}/resources/js/light-bootstrap-dashboard.js?v=1.4.1"></script>

	<!-- Light Bootstrap Dashboard DEMO methods, don't include it in your project! -->
	<script src="${contextPath}/resources/js/demo.js"></script>

  <script src="${contextPath}/resources/js/erp-calendar.js"></script>

  <script src="${contextPath}/resources/js/erp-modal.js"></script>

  <script src="${contextPath}/resources/js/common.js"></script>

  <c:if test="${submenu == 'edsmAddLine.jsp'}">
    <script src="${contextPath}/jstree/dist/jstree.min.js"></script>
    <script src="${contextPath}/resources/js/erp-organization.js"></script>
  </c:if>

  <script>
    $().ready(function() {
      if('${submenu}' === 'main.jsp') {
        demo.initCharts();
      }
      if('${submenu}' === 'publicGoods.jsp') {
        erpCalendar.initGoodsCalendar('goodsCalendar');
      }
      if('${submenu}' === 'schedule.jsp') {
        erpCalendar.initGoodsCalendar('scheduleCalendar');
      }
      if('${submenu}' === 'edsmRequest.jsp' || '${submenu}' === 'departManage.jsp') {
        $("#jstree").jstree({
            "plugins": ["search"],
            'core': {
                'data': [
                  { "id" : "S1", "parent" : "#", "text" : "SI 사업부", "icon" : "glyphicon glyphicon-home" },
                  { "id" : "S2", "parent" : "#", "text" : "솔루션 사업부","alias":"ㅋㅋㅋ" , "icon" : "glyphicon glyphicon-home"  },
                  { "id" : "S3", "parent" : "#", "text" : "AI 사업부", "icon" : "glyphicon glyphicon-home"  },
                  { "id" : "S11", "parent" : "S1", "text" : "공공SI" , "icon" : "glyphicon glyphicon-picture"},
                  { "id" : "S12", "parent" : "S1", "text" : "일반SI", "icon" : "glyphicon glyphicon-picture" },
                  { "id" : "S21", "parent" : "S2", "text" : "그룹웨어" ,"icon" : "glyphicon glyphicon-picture" },
                  { "id" : "S22", "parent" : "S2", "text" : "MES" , "icon" : "glyphicon glyphicon-picture"},
                  { "id" : "S23", "parent" : "S2", "text" : "ERP", "icon" : "glyphicon glyphicon-picture" },
                  { "id" : "S31", "parent" : "S3", "text" : "이미지처리" , "icon" : "glyphicon glyphicon-picture"},
                  { "id" : "S32", "parent" : "S3", "text" : "음성처리" , "icon" : "glyphicon glyphicon-picture"},
                  { "id" : "S33", "parent" : "S3", "text" : "자연어처리" , "icon" : "glyphicon glyphicon-picture"},
                  { "id" : "J01", "parent" : "S11", "text" : "송불곰" , "icon": "glyphicon glyphicon-user" },
                  { "id" : "J02", "parent" : "S31", "text" : "강사자" , "icon": "glyphicon glyphicon-user"},
                  { "id" : "J03", "parent" : "S22", "text" : "송호랑", "icon": "glyphicon glyphicon-user" },
                  { "id" : "J04", "parent" : "S32", "text" : "이늑대" , "icon": "glyphicon glyphicon-user"},
                  { "id" : "J05", "parent" : "S33", "text" : "감여우", "icon": "glyphicon glyphicon-user" },
                  { "id" : "J06", "parent" : "S12", "text" : "공수달" , "icon": "glyphicon glyphicon-user"},
                  { "id" : "J07", "parent" : "S23", "text" : "황악어" , "icon": "glyphicon glyphicon-user"},
                  { "id" : "J08", "parent" : "S22", "text" : "홍문어" , "icon": "glyphicon glyphicon-user"}
                ]
            }
        });
      }
    });
  </script>

</html>