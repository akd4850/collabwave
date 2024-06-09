<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<!-- fullcalendar css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<!-- fullcalendar 언어 설정관련 script -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>

<jsp:include page="../../layout/header.jsp"/>

<div class="main-content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-2">
                <jsp:include page="./scheduleSidebar.jsp"/>
            </div>
            <div class="col-md-10">
                <div class="card card-calendar">
                
                    <!-- 
                    <div id="scheduleCalendar"></div>                    
                    -->
                    
                    <div id='calendar'></div> 
                    
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../../layout/footer.jsp"/>

<script>

document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
      initialView: 'dayGridMonth'
    });
    calendar.render();
  });

$(function(){
	
	var request = $.ajax({
	  url: "/schedule/mySchedule.page",
	  method: "GET",
	  dataType: "json"
	});
	 
	request.done(function( data ) {
		console.log(data);
			
			var calendarEl = document.getElementById('calendar');
			
		    var calendar = new FullCalendar.Calendar(calendarEl, {
		      initialView: 'dayGridMonth',
		      headerToolbar: {
		        left: 'prev,next today',
		        center: 'title',
		        right: 'dayGridMonth,timeGridWeek,timeGridDay'
		      },
		      events: data
		    });
	
		    calendar.render();								
	});
	 
	request.fail(function( jqXHR, textStatus ) {
	  alert( "Request failed: " + textStatus );
	});
});

</script>

<!-- <script type="text/javascript">

document.addEventListener('DOMContentLoaded', function() { 

	$(function () {
		
	var calendarEl = document.getElementById('calendar'); // calendar
	var calendar = new FullCalendar.Calendar(calendarEl, {
		
		initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
	
		headerToolbar : { // 헤더에 표시할 툴 바
			start : 'prev next today',
			center : 'title',
			end : 'dayGridMonth timeGridWeek timeGridDay listWeek'
		},
		
		titleFormat : function( date ) {
			
			return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
			
		},
		
		//initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
		selectable : true, // 달력 일자 드래그 설정가능
		droppable : true,
		editable : true,
		nowIndicator: true, // 현재 시간 마크
		locale: 'ko' // 한국어 설정
		
		// , events: data // JSON 형식으로 불러오기 
		
	});
	calendar.render();
});

});

</script> -->

<!-- <script type="text/javascript">
document.addEventListener('DOMContentLoaded', function () {
	
    //$(function () {
    	
/*         var request = $.ajax({
            url: "/schedule/schedule", // Controller 에 맞게 변경하기
            method: "GET", 
            dataType: "json" // json 형식으로 데이터 불러오기 
        }); */

        request.done(function (data) {
            console.log(data); // log 로 데이터 찍어주기 

            var calendarEl = document.getElementById('calendar'); // 
            var calendar = new FullCalendar.Calendar(calendarEl, {
            	
                // initialDate: '2024-06-07', // 캘린더 초기값 지정, 없으면 오늘 날짜 
                initialView : 'dayGridMonth',
                headerToolbar: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
                },
                editable: true,
                droppable: true, // this allows things to be dropped onto the calendar
                drop: function (arg) {
                    // is the "remove after drop" checkbox checked?
                    if (document.getElementById('drop-remove').checked) {
                        // if so, remove the element from the "Draggable Events" list
                        arg.draggedEl.parentNode.removeChild(arg.draggedEl);
                    }
                },
                /**
                 * data 로 값이 넘어온다. log 값 전달.
                 */
		         		locale: 'ko', // 한국어 설정

                // events: data // 이벤트 불러오기 
            });

            calendar.render();
        });

        request.fail(function( jqXHR, textStatus ) {
            alert( "Request failed: " + textStatus );
        });
    //});

});
</script> -->