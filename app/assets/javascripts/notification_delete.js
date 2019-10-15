$(document).on('turbolinks:load', function () {
  loadButtonDelete();
});

function loadButtonDelete() {
  notifications_btn = $('#error_explanation .delete')

  $(notifications_btn).click(function () {
    event.target.parentNode.remove();
  });
}
