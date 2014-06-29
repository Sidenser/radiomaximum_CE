btn = document.getElementById("btn")
btn.onclick = ()->
	status = if localStorage.status is "play" then "stop" else "play"
	chrome.extension.sendMessage greeting: status
	btnShow status

btnShow = (status)->
	if status is "play"
		btn.firstChild.className = "icon-pause"
	else
		btn.firstChild.className = "icon-play"
	true

btnShow localStorage["status"]

document.getElementById("track-name").innerHTML = localStorage.currentTrack