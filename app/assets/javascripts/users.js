$(document).ready(function() {
  $('.updateStatsButton').on('click', function () {
    var $btn = $(this).button('loading');
    var user = $btn.data("user");

    $.get("/api/v1/users/" + user + "/exercisms", function ( data ) {
      var $parent = $btn.parent();

      if ($parent.siblings('.total').text() != data.completed_exercism_count) {
        $parent.parent().addClass("success");
        $parent.parent().removeClass("danger");
      }

      $parent.siblings('.ruby').text(data.exercism_stats.Ruby);
      $parent.siblings('.js').text(data.exercism_stats.JavaScript);
      $parent.siblings('.total').text(data.completed_exercism_count);

      $btn.button('complete').addClass('btn-success');
    });
  });
});
