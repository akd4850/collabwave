erpModal = {
  showSwal: function(type, title, url) {
    if(type == 'goods') {
      swal({
        title: title,
        html: '<div class="form-group">' +
                '코드 <input type="text" name="goods-code" class="form-control" />' +
              '</div>',
        showCancelButton: true,
        confirmButtonClass: 'btn btn-info btn-fill',
        cancelButtonClass: 'btn btn-danger btn-fill',
        confirmButtonText: '확인',
        cancelButtonText: '취소',
        buttonsStyling: false
      }).then(function(result) {
          /*swal({
              type: 'success',
              html: 'You entered: <strong>' +
                      $('#input-field').val() +
                    '</strong>',
              confirmButtonClass: 'btn btn-info btn-fill',
              buttonsStyling: false
          })*/
      }).catch(swal.noop);
    }
  }
}