// Generated by CoffeeScript 1.8.0
var Database, dataBase;

Database = (function() {
  Database.prototype.db = null;

  function Database(name, v, description, size) {
    this.db = openDatabase(name, v, description, size);
    this.db.transaction(function(tx) {
      return tx.executeSql("CREATE TABLE IF NOT EXISTS history (name TEXT UNIQUE, timestamp REAL)");
    });
  }

  Database.prototype.addItemHistory = function(name) {
    return this.db.transaction(function(tx) {
      return tx.executeSql("INSERT INTO history (name, timestamp) values(?, ?)", [name, new Date().getTime()], null, null);
    });
  };

  Database.prototype.getAll = function(callback) {
    return this.db.transaction(function(tx) {
      return tx.executeSql("SELECT * FROM history", [], function(tx, res) {
        var data, i, len;
        len = res.rows.length;
        i = 0;
        data = [];
        while (i < len) {
          data.push(res.rows.item(i));
          i++;
        }
        return callback(data);
      });
    });
  };

  return Database;

})();

dataBase = new Database("Maximum", "0.1", "Radio maximum", 20000);

window.dataBase = dataBase;
