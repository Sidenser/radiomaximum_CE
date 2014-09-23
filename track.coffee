class Track
	urlUpdate:"http://maximum.ru/getcurrenttrack.aspx?random="
	defaultTrackName:"MAXIMUM"
	timeUpdate:200000
	constructor:()->
		setInterval (=> @update()), @timeUpdate
	update:()->
		urlUpdate = @urlUpdate + Math.random()
		xhr = new XMLHttpRequest;
		xhr.open "GET", urlUpdate, true
		xhr.onload = ()=>
			@loadTrack xhr.responseText.replace(/<\/?[^>]+>/g,'')
		xhr.send()
	loadTrack:(text = @defaultTrackName)->
		console.log(text)
		localStorage.currentTrack = text
		window.dataBase.addItemHistory  text

track = new Track
