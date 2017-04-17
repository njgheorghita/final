$('document').ready(function() {

  $("#new_link input:submit").on('click', function() {
    event.preventDefault()

    $("#flash-section").html("")
    var linkTitle = $(this).siblings("#link_title").val();
    var linkUrl =  $(this).siblings("#link_url").val();

    $.ajax({
      type: "POST",
      url: "/links/",
      data: { link: {title: linkTitle, url: linkUrl, read: false} },
    }).then(updateLinks)
      .fail(displayFailure);
  });
});

function updateLinks(successData) {
  if (successData.status == 400) {
    $("#flash-section").prepend("<div style='color:red;'> PLEASE ENTER A PROPER URL </div>")
  } else if (successData.status == 401) {
    $("#flash-section").prepend("<div style='color:red;'> PLEASE FILL OUT THE FIELDS </div>")
  } else {
    $("#link-list").prepend(successData)
  }
}

function displayFailure(failureData){
  console.log("FAILED attempt to create Link: " + failureData.responseText);
}