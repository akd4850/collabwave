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

</html>