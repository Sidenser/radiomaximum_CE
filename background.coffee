class Player
	srcAudio:null
	audio:null
	constructor:(url)->
		@saveStatus "stop"
		@srcAudio = url
		@audio = document.createElement("audio")
	play:()->
		@audio.src = @srcAudio
		@audio.play()
		@saveStatus "play"
	stop:()->
		@audio.stop()
		@saveStatus "stop"
	command:(c)->
		if @[c]? 
			@[c]()
	saveStatus:(val)->
		localStorage["status"] = val

player = new Player("http://maximum.fmtuner.ru/")
chrome.extension.onMessage.addListener (request) ->
	player.command request.greeting