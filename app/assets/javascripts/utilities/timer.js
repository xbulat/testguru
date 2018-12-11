document.addEventListener('turbolinks:load', function() {
  var timer = document.querySelector('.timer')

  function secondsToMinutes(time){
    return (time / 60 < 10 ? "0" : "") + Math.floor(time / 60) + ":" + (time % 60 < 10 ? "0" : "") + time % 60;
  }

  function countDown(testTime, testId, object) {
    setInterval(function() {
      if (testTime > 0) {
        testTime -= 1;
      } else {
        window.location.replace('/user_passed_tests/' + testId + '/result');
      }

      object.innerHTML = secondsToMinutes(testTime)
    }, 1000)
  }

  if (timer) {
    var testTime = timer.dataset.time;
    var userTestId = timer.dataset.id;

    countDown(testTime, userTestId, timer)
  }
})
