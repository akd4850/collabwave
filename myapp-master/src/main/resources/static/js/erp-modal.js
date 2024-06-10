erpModal = {
  showSwal: function(type, title) {
    if(type == 'edsm') {
      swal({
        title: title,
        html: `결재양식 선택<br>
              <select name="payform" class="selectpicker" data-title="--결재양식 선택--" data-style="btn-default btn-block" data-menu-style="dropdown-blue">
                <option value="">업무협조</option>
                <option value="">휴가신청</option>
              </select>
              <div style="margin:10px;padding-bottom:100px;border:1px solid;">
                업무협조 양식 미리보기
              </div>`,
        showCancelButton: true,
        confirmButtonClass: 'btn btn-info btn-fill',
        cancelButtonClass: 'btn btn-danger btn-fill',
        confirmButtonText: '확인',
        cancelButtonText: '취소',
        buttonsStyling: false
      }).then(function(result) {
        if(result == true) location.href = '/edsm/edsmRequest.page';
      }).catch(swal.noop);
    }
    
    else if(type == 'emp') {
      swal({
        title: title,
        showCancelButton: true,
        confirmButtonClass: 'btn btn-info btn-fill',
        cancelButtonClass: 'btn btn-danger btn-fill',
        confirmButtonText: '확인',
        cancelButtonText: '취소',
        buttonsStyling: false
      }).then(function(result) {
        if(result == true) location.href = '/admin/emp/management.page';
      }).catch(swal.noop);
    }
    
  }
}