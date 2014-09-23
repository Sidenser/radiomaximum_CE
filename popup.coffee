btn = document.getElementById("btn")
btnVolume = document.getElementById("btn-volume")
progress = document.getElementById("progress")
volumeBar = document.getElementById("volume-bar")

btn.onclick = ()->
	status = if localStorage.status is "play" then "stop" else "play"
	chrome.extension.sendMessage greeting: status
	btnShow status

btnVolume.onclick = ()->
	status = if localStorage.volumeMute is "false" then "true" else "false"
	localStorage["volumeMute"] = status
	chrome.extension.sendMessage greeting: "volumeMute"
	volumeMute status

volumeBar.onclick = (ev)->
	localStorage["volume"] = (100/70) * ev.layerX
	progress.style.width = localStorage["volume"]+"%"
	chrome.extension.sendMessage greeting: "setVolume"

btnShow = (status)->
	if status is "play"
		btn.firstChild.className = "icon-pause"
	else
		btn.firstChild.className = "icon-play"
	true

volumeMute = (status)->
	if status is "false"
		btnVolume.children[0].setAttribute("class", "icon-volume-up")
		progress.style.width = localStorage["volume"]+"%"
	else
		btnVolume.children[0].setAttribute("class", "icon-volume-down")
		progress.style.width = "0%"

btnShow localStorage["status"]

volumeMute localStorage["volumeMute"]


document.getElementById("track-name").innerHTML = localStorage.currentTrack