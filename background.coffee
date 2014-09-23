class Player
	srcAudio:null
	audio:null
	constructor:(url)->
		@saveStatus "stop"
		@srcAudio = url
		@audio = new Audio
		localStorage["volumeMute"] = "false"
		localStorage["volume"] = 100
	play:()->
		@audio.src = @srcAudio
		@audio.play()
		@saveStatus "play"
	stop:()->
		@audio.pause()
		@saveStatus "stop"
	command:(c)->
		if @[c]? 
			@[c]()
	saveStatus:(val)->
		localStorage["status"] = val
	volumeMute:()->
		@audio.muted = !@audio.muted
	setVolume:()->
		@audio.volume = parseFloat(localStorage["volume"]) * 0.01;

player = new Player("http://maximum.fmtuner.ru/")
chrome.extension.onMessage.addListener (request) ->
	player.command request.greeting

showNotification = ()->
	opt = 
		type: "basic", 
		title: "Primary Title",
		message: "Primary message to display",
		iconUrl: "logo.png"	
	chrome.notifications.create "2", opt, ()-> 
