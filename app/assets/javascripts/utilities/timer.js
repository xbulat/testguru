document.addEventListener('turbolinks:load', function() {
  var timer = document.querySelector('.timer')

  function secondsToMinutes(time){
    return rzero(Math.floor(time / 60)) + ":" + rzero((time % 60));
  }

  function rzero(number) {
    append = number < 10 ? "0" : ""

    return append + number
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
