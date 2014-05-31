(function(){
    var btnPlay = document.getElementById('play');
    var btnStop = document.getElementById('stop');
    btnPlay.onclick = function()
    {
        btnPlay.style.display = 'none';
        btnStop.style.display = 'block';
        chrome.extension.sendMessage({greeting: "Play"},
            function(response) { var tabURL = response.navURL });
    };
    btnStop.onclick = function()
    {
        btnStop.style.display = 'none';
        btnPlay.style.display = 'block';
        chrome.extension.sendMessage({greeting: "Stop"},
            function(response) { var tabURL = response.navURL });
    };
})();