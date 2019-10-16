previewImage = (input) =>
  return unless input
  reader = new FileReader()
  reader.onload = (e) =>
    $('#preview').html('<img id="submited_input" src="'+e.target.result+'">')
  reader.readAsDataURL(input)

$(document).on 'turbolinks:load', ->
  $('#advertisement_image').change =>
      previewImage $('#advertisement_image')[0].files[0]