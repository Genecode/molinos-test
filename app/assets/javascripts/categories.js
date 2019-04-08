$(document).ready(function() {
  let $nestable = $('.dd');
  $nestable.nestable({});

  $('.nestable-menu').on('click', function(e) {
    let target = $(e.target),
      action = target.data('action');
    if (action === 'expand-all') {
      $nestable.nestable('expandAll');
    }
    if (action === 'collapse-all') {
      $nestable.nestable('collapseAll');
    }
  });

  $('.btn-update-categories').on('click', function (e){

    fetch('./private/categories/commit', {
      method: 'post',
      body: JSON.stringify({'categories': $nestable.nestable('serialize')}),
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': Rails.csrfToken()
      },
      credentials: 'same-origin'
    }).then(function(response) {
      if(response.code == 200) {addAlert('Success update')};
      return response.json();
    }).then(function (data) {
      console.log(data)
    }).catch( error => console.log(error));
  });

  function addAlert(message) {
    $('.container').prepend(
      '<div class="alert fade in show alert-success">' +
      '<button type="button" class="close" data-dismiss="alert">' +
      '&times;</button>' + message + '</div>');
  }
});


