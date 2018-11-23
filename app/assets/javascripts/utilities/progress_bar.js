document.addEventListener('turbolinks:load', function() {
  var bar = document.querySelector('.progress_bar');

  if (bar) {
    var table = bar.querySelector('table');
    var rows = table.querySelectorAll('td');

    if (rows) {
      progress = bar.dataset.progress;
      setProgress(rows, progress)
    }
  }
})

function setProgress(rows, progress) {
  for (var i = 0; i < progress; i++) {
    rows[i].classList.add('bg-success')
  }
}
