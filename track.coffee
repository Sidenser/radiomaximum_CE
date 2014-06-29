class Track
	urlUpdate:""
	timeUpdate:20000
	constructor:()->
		setInterval (=> @update()), @timeUpdate
	update:()->
		@urlUpdate = "http://maximum.ru/getcurrenttrack.aspx?random="+ Math.random()
		xhr = new XMLHttpRequest;
		xhr.open "GET", @urlUpdate, true
		xhr.onload = ()=>
			console.log @
			@loadTrack xhr.responseText.replace(/<\/?[^>]+>/g,'')
		xhr.send()
	loadTrack:(text)->
		localStorage.currentTrack = text
		window.dataBase.addItemHistory  text

track = new Track



