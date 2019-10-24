var x = document.getElementById("audio-1");

function pauseAudio() {
  x.pause();
}

x.addEventListener("timeupdate", () => {
  // if (x.currentTime >= 30) {
  //   pauseAudio();
  // }
});
