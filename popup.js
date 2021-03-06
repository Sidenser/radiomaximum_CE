// Generated by CoffeeScript 1.8.0
var btn, btnShow, btnVolume, progress, volumeBar, volumeMute;

btn = document.getElementById("btn");

btnVolume = document.getElementById("btn-volume");

progress = document.getElementById("progress");

volumeBar = document.getElementById("volume-bar");

btn.onclick = function() {
  var status;
  status = localStorage.status === "play" ? "stop" : "play";
  chrome.extension.sendMessage({
    greeting: status
  });
  return btnShow(status);
};

btnVolume.onclick = function() {
  var status;
  status = localStorage.volumeMute === "false" ? "true" : "false";
  localStorage["volumeMute"] = status;
  chrome.extension.sendMessage({
    greeting: "volumeMute"
  });
  return volumeMute(status);
};

volumeBar.onclick = function(ev) {
  localStorage["volume"] = (100 / 70) * ev.layerX;
  progress.style.width = localStorage["volume"] + "%";
  return chrome.extension.sendMessage({
    greeting: "setVolume"
  });
};

btnShow = function(status) {
  if (status === "play") {
    btn.firstChild.className = "icon-pause";
  } else {
    btn.firstChild.className = "icon-play";
  }
  return true;
};

volumeMute = function(status) {
  if (status === "false") {
    btnVolume.children[0].setAttribute("class", "icon-volume-up");
    return progress.style.width = localStorage["volume"] + "%";
  } else {
    btnVolume.children[0].setAttribute("class", "icon-volume-down");
    return progress.style.width = "0%";
  }
};

btnShow(localStorage["status"]);

volumeMute(localStorage["volumeMute"]);

document.getElementById("track-name").innerHTML = localStorage.currentTrack;
