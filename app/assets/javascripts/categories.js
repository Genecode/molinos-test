$(document).on('turbolinks:load', function() {
  // console.log('there')
  let $nestable = $('.dd');
  // console.log($nestable);
  $nestable.nestable({});

  $('.nestable-menu').on('click', function(e)
  {
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

    let serialized_data = $nestable.nestable('serialize')
    console.log(serialized_data);


    $.ajax({
      dataType: 'json',
      cache: false,
      url: $nestable.data('update-path'),
      type: 'POST',
      data: {
        tree_nodes: serialized_data
      },
      success: function(data) {
        console.log('success');
        console.log(data);
        // let $flash;
        // $flash = $('<div>').addClass('nestable-flash alert alert-success').append($('<button>').addClass('close').data('dismiss', 'alert').html('&times;')).append($('<span>').addClass('body').html(data));
        // $('#rails_admin_nestable').append($flash);
        // return $flash.fadeIn(200).delay(2000).fadeOut(200, function() {
        //   return $(this).remove();
        // });
      }
    });



  })

  // $nestable.on('click', (e)=> console.log(e.target))
});
