$(function() {
  $("a").click(function() {
    $("body").load(this.href + " #devices");
    return false;
  });
});