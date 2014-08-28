$(window).load(function() {
  $(".vote input[type=radio]").on("click", function() {
    $("#maintitle").text($(this).data("tt"));
  });
});
