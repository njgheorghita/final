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
      // url: "https://thawing-crag-89948.herokuapp.com/api/v1/links/" + linkId,
      url: "/api/v1/links/" + linkId,
      data: { title: linkTitle, url: linkUrl, read: false },
    }).then(updateUnreadCss)
      .fail(displayFailure);
  } else {
    var linkId = parseInt($link.children('.link-id').text());
    var linkTitle = $link.children('.link-title').text();
    var linkUrl =  $link.children('.link-url').text();
    var linkTag = nil;

    $.ajax({
      type: "POST",
      // url: "https://sheltered-shore-41248.herokuapp.com/api/v1/links",
      url: "http://localhost:3001/api/v1/links/",
      data: { url: linkUrl }
    }).then((response) => {
      linkTag = response.tag;
    });

    $.ajax({
      type: "PATCH",
      // url: "https://sheltered-shore-41248.herokuapp.com/api/v1/links/" + linkId,
      url: "/api/v1/links/" + linkId,
      data: { title: linkTitle, url: linkUrl, read: true , tag: linkTag},
    }).then(updateReadCss)
      .fail(displayFailure);
  }
}

function updateReadCss(link) {
  $('#link-' + link.id).children(".read-status").text("true")
  $('#link-' + link.id).children(".mark-as-read").text("Mark as Unread")
  $('#link-' + link.id).css({"text-decoration":"line-through"})
  $('#link-' + link.id).css({"border":"3px solid green"})
}

function updateUnreadCss(link) {
  $('#link-' + link.id).children(".read-status").text("false")
  $('#link-' + link.id).children(".mark-as-read").text("Mark as Read")
  $('#link-' + link.id).css({"border":"3px solid red"})
}

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
}
