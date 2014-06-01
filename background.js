(function(){
    var audio = document.createElement('audio');
    chrome.extension.onMessage.addListener( function(request,sender,sendResponse)
    {
        if( request.greeting == "Play" )
        {
			audio.src = 'http://maximum.fmtuner.ru/';
            audio.play();
        }
        else if( request.greeting == "Stop" )
        {
            audio.pause();
        }
    });
})();