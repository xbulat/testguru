document.addEventListener('turbolinks:load', function() {
  var password = document.querySelector('.password')
  var confirmation = document.querySelector('.confirmation')

  if (password && confirmation) {
    password.addEventListener('keyup', checkPasswords)
    confirmation.addEventListener('keyup', checkPasswords)
  }
})

function showErrors(elements) {
  for (var i = 0; i < elements.length; i++) {
    elements[i].classList.remove('has-success')
    elements[i].classList.add('has-error')
  }
}

function showSuccess(elements) {
  for (var i = 0; i < elements.length; i++) {
    elements[i].classList.remove('has-error')
    elements[i].classList.add('has-success')
  }
}

function clearInputs(elements) {
  for (var i = 0; i < elements.length; i++) {
    elements[i].classList.remove('has-error')
    elements[i].classList.remove('has-success')
  }
}

function checkPasswords() {
  inputs = document.querySelectorAll('.has-feedback')

  if (document.getElementById('user_password').value ==
    document.getElementById('user_password_confirmation').value) {
    showSuccess(inputs)
  } else {
    showErrors(inputs)
  }

  if (document.getElementById('user_password').value == "" &&
    document.getElementById('user_password_confirmation').value == "") {
      clearInputs(inputs)
  }
}
