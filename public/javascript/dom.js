var x = document.getElementById("audio-1");

function pauseAudio() {
  x.pause();
}

setInterval(() => {
  if (x.currentTime >= 30) {
    pauseAudio();
  }
}, 100);
