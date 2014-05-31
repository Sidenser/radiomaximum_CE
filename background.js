(function(){
    var audio = document.createElement('audio');
    audio.src = 'http://maximum.fmtuner.ru/';
    chrome.extension.onMessage.addListener( function(request,sender,sendResponse)
    {
        if( request.greeting == "Play" )
        {
            audio.play();
        }
        else if( request.greeting == "Stop" )
        {
            audio.pause();
        }
    });
})();