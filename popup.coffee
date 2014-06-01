btnPlay = document.getElementById("play")
btnStop = document.getElementById("stop")
btnPlay.onclick = ()->
    chrome.extension.sendMessage greeting: "play"
    btnShow "play"

btnStop.onclick = ()->
    chrome.extension.sendMessage greeting: "stop"
    btnShow "stop"

btnShow = (status)->
	if status is "play"
		btnPlay.style.display = "none"
		btnStop.style.display = "block"
	else
		btnPlay.style.display = "block"
		btnStop.style.display = "none"
	true

btnShow localStorage["status"] 