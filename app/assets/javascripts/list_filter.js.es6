$('document').ready(function() {

  $("#list-filter label input:text").on('keyup', function() {
    var input = $(this).val();
    var allLists = $(".filter-content");
    if (this.value == "") {
      allLists.show();
      return;
    };
    allLists.hide();

    allLists.parent().filter(function(i,v) {
      var $t = $(this);
      if ($t.is(":contains('" + input + "')")) {
        return true;
      }
      return false;
    })
    .show();
  });
});