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

  let anc = '';
  function ancFn (arr) {
    this.push({id: arr.id, ancestry: anc});
    if('children' in arr){
      if (arr.children.length > 0){
        anc = arr.id;
        arr.children.forEach(ancFn,this);
        anc = '';
      }
    }
  }

  $('.btn-update-categories').on('click', function (e){
    let category = [];
    $nestable.nestable('serialize').forEach(ancFn, category);

    $.ajax({
      dataType: 'json',
      cache: false,
      url: 'private/categories/collection',
      type: 'PATCH',
      data: {category},
      success: function(data) {
         console.log('success');
        let $flash;
        $flash = $('<div>').addClass('nestable-flash alert alert-success').append($('<button>').addClass('close').data('dismiss', 'alert').html('&times;')).append($('<span>').addClass('body').html(data));
        $('#rails_admin_nestable').append($flash);
        return $flash.fadeIn(200).delay(2000).fadeOut(200, function() {
          return $(this).remove();
        });
      }
    });
  })
});


