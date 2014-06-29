// Generated by CoffeeScript 1.7.1
(function() {
  var Track, track;

  Track = (function() {
    Track.prototype.urlUpdate = "";

    Track.prototype.timeUpdate = 120000;

    function Track() {
      setInterval(((function(_this) {
        return function() {
          return _this.update();
        };
      })(this)), this.timeUpdate);
    }

    Track.prototype.update = function() {
      var xhr;
      this.urlUpdate = "http://maximum.ru/getcurrenttrack.aspx?random=" + Math.random();
      xhr = new XMLHttpRequest;
      xhr.open("GET", this.urlUpdate, true);
      xhr.onload = (function(_this) {
        return function() {
          console.log(_this);
          return _this.loadTrack(xhr.responseText.replace(/<\/?[^>]+>/g, ''));
        };
      })(this);
      return xhr.send();
    };

    Track.prototype.loadTrack = function(text) {
      localStorage.currentTrack = text;
      return window.dataBase.addItemHistory(text);
    };

    return Track;

  })();

  track = new Track;

}).call(this);
