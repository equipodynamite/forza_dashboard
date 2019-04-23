var matching_users = new Bloodhound({
  datumTokenizer: Bloodhound.tokenizers.obj.whitespace("value"),
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  remote: {
    url: "/search_members/%QUERY",
    wildcard: "%QUERY",
    cache: false
  }
});

document.addEventListener("turbolinks:load", function() {
  $(document).ready(function() {
    $(".typeahead").typeahead(
      {
        highlight: true
      },
      {
        name: "user",
        display: "username",
        source: matching_users
      }
    );
  });
});
