class Player
	srcAudio:null
	audio:null
	constructor:(url)->
		@saveStatus "stop"
		@srcAudio = url
		@audio = new Audio
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
