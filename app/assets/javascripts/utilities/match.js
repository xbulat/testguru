document.addEventListener('turbolinks:load', function() {
  var password = document.querySelector('.password');
  var confirmation = document.querySelector('.confirmation');

  if (password && confirmation) {
    password.addEventListener('keyup', checkPasswords)
    confirmation.addEventListener('keyup', checkPasswords)
  }
})

function updateClass(elements, removeClass, addClass) {
  for (var i = 0; i < elements.length; i++) {
    if (removeClass) { elements[i].classList.remove(...removeClass) }
    if (addClass) { elements[i].classList.add(...addClass) }
  }
}

function checkPasswords() {
  inputs = document.querySelectorAll('.has-feedback');

  if (document.getElementById('user_password').value ==
    document.getElementById('user_password_confirmation').value) {
    updateClass(inputs, ["has-error"], ["has-success"])
  } else {
    updateClass(inputs, ["has-success"], ["has-error"])
  }

  if (document.getElementById('user_password').value == "" &&
    document.getElementById('user_password_confirmation').value == "") {
    updateClass(inputs, ["has-error", "has-success"], false)
  }
}
