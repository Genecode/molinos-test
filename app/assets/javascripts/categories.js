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
      return response.json();
    }).then(function(data) {
      console.log(data);
    });

    //   success: function(data) {
    //      console.log('success');
    //     let $flash;
    //     $flash = $('<div>').addClass('nestable-flash alert alert-success').append($('<button>').addClass('close').data('dismiss', 'alert').html('&times;')).append($('<span>').addClass('body').html(data));
    //     $('#rails_admin_nestable').append($flash);
    //     return $flash.fadeIn(200).delay(2000).fadeOut(200, function() {
    //       return $(this).remove();
    //     });
    //   }
  })
});


