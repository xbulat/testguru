document.addEventListener('turbolinks:load', function() {
  var controls = document.querySelectorAll('.form-inline-link')

  if (controls.length) {
    for (var i = 0; i < controls.length; i++) {
      controls[i].addEventListener('click', formInlineLinkHandler)
    }
  }

  var errors = document.querySelector('.resourse-errors')

  if (errors) {
    var resourseId = errors.dataset.resourseId
    formInlineHandler(resourseId)
  }
})

function formInlineLinkHandler(event) {
  event.preventDefault()

  var testId = this.dataset.testId
  formInlineHandler(testId)
}

function formInlineHandler(testId) {
  var links = document.querySelectorAll('.form-inline-link[data-test-id="' + testId + '"]')
  var testTitle = document.querySelector('.test-title[data-test-id="' + testId + '"]')
  var formInline = document.querySelector('.form-inline[data-test-id="' + testId + '"]')

  if (formInline) {
    if (formInline.classList.contains('hide')) {
      toggleHideClass(testTitle, formInline, links)
    } else {
      toggleHideClass(testTitle, formInline, links)
    }
  }
}

function toggleHideClass(testTitle, formInline, links) {
  testTitle.classList.toggle('hide')
  formInline.classList.toggle('hide')
  for (var i = 0; i < links.length; i++) {
    links[i].classList.toggle('hide')
  }
}
