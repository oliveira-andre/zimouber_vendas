$(document).on('turbolinks:load', function () {
  $('label').each(function (key, value) {
    var input_id = value.htmlFor;
    var input_required = $(`#${input_id}`).prop('required');
    var already_have_signal = $(value).children()[0] != null;
    if (input_required && !already_have_signal) {
      $(value).append('<small class="has-text-danger">*</small>');
    }
  });
});