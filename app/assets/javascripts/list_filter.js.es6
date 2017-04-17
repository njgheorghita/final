$('document').ready(function() {

  $("#list-filter label input:text").on('keyup', function() {
    var input = $(this).val();
    var allLists = $("#link-list").children();
    if (this.value == "") {
      allLists.show();
      return;
    };
    allLists.hide();

    allLists.filter(function(i,v) {
      var $t = $(this).children('.link-title');
      var $u = $(this).children('.link-url');
      if ($t.is(":contains('" + input + "')") || $u.is(":contains('" + input + "')")) {
        return true;
      }
      return false;
    })
    .show();
  });
});