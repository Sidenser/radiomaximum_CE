// Generated by CoffeeScript 1.8.0
(function() {
  var btn, btnShow;

  btn = document.getElementById("btn");

  btn.onclick = function() {
    var status;
    status = localStorage.status === "play" ? "stop" : "play";
    chrome.extension.sendMessage({
      greeting: status
    });
    return btnShow(status);
  };

  btnShow = function(status) {
    if (status === "play") {
      btn.firstChild.className = "icon-pause";
    } else {
      btn.firstChild.className = "icon-play";
    }
    return true;
  };

  btnShow(localStorage["status"]);

  document.getElementById("track-name").innerHTML = localStorage.currentTrack;

}).call(this);

//# sourceMappingURL=popup.js.map
