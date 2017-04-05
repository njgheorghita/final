$( document ).ready(function(){
  $("body").on("click", ".mark-as-read", updateLink)
})

function updateLink(e) {
  e.preventDefault();
  
  var $link = $(this).parent();
  var linkReadStatus = ($link.children('.read-status').text() == 'true')

  if (linkReadStatus == true) {
    var linkId = parseInt($link.children('.link-id').text());
    var linkTitle = $link.children('.link-title').text();
    var linkUrl =  $link.children('.link-url').text();

    $.ajax({
      type: "PATCH",
      url: "/api/v1/links/" + linkId,
      data: { title: linkTitle, url: linkUrl, read: false },
    }).then(updateUnreadCss)
      .fail(displayFailure);
  } else {
    var linkId = parseInt($link.children('.link-id').text());
    var linkTitle = $link.children('.link-title').text();
    var linkUrl =  $link.children('.link-url').text();

    $.ajax({
      type: "PATCH",
      url: "/api/v1/links/" + linkId,
      data: { title: linkTitle, url: linkUrl, read: true },
    }).then(updateReadCss)
      .fail(displayFailure);
  }
}

// function makeAjaxCall() {
//   $.ajax({
//     type: 
//   })
// }

function updateReadCss(link) {
  $('#link-' + link.id).children(".read-status").text("true")
  $('#link-' + link.id).children(".mark-as-read").text("Mark as Unread")
  $('#link-' + link.id).css({"text-decoration":"line-through"})
}

function updateUnreadCss(link) {
  $('#link-' + link.id).children(".read-status").text("false")
  $('#link-' + link.id).children(".mark-as-read").text("Mark as Read")
  $('#link-' + link.id).css({"text-decoration":"none"})
}

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
}
