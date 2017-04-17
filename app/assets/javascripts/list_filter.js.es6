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

  $("#show-read").on('click', function() {
    var status = "true"
    var allLists = $("#link-list").children();

    allLists.hide();

    allLists.filter(function(i,v) {
      var $t = $(this).children('.read-status').text();
      if ($t == status) {
        return true;
      }
      return false;
    })
    .show();
  })

  $("#show-unread").on('click', function() {
    var status = "false"
    var allLists = $("#link-list").children();

    allLists.hide();

    allLists.filter(function(i,v) {
      var $t = $(this).children('.read-status').text();
      if ($t == status) {
        return true;
      }
      return false;
    })
    .show();
  })
});