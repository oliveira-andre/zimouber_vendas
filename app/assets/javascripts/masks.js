$(document).on('turbolinks:load', function () {
  loadMasks();
});

function loadMasks() {
  $('.money').maskMoney().trigger('mask.maskMoney');
}