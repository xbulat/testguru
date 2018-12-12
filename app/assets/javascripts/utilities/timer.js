document.addEventListener('turbolinks:load', function() {
  var timer = document.querySelector('.timer')

  function secondsToMinutes(time){
    return rjust(Math.floor(time / 60)) + ":" + rjust((time % 60));
  }

  function rjust(string) {
    append = string < 10 ? "0" : ""

    return append + string
  }

  function countDown(testTime, object) {
    setInterval(function() {
      if (testTime > 0) {
        testTime -= 1;
      } else {
        document.getElementById('answer').submit();
      }

      object.innerHTML = secondsToMinutes(testTime)
    }, 1000)
  }

  if (timer) {
    var testTime = timer.dataset.time;

    countDown(testTime, timer)
  }
})
