class Database
	db:null
	constructor:(name, v, description, size)->
		@db = openDatabase(name, v, description, size)
		@db.transaction (tx)->
			tx.executeSql "CREATE TABLE IF NOT EXISTS history (name TEXT UNIQUE, timestamp REAL)"
	addItemHistory:(name)->
		@db.transaction (tx)->
			tx.executeSql("INSERT INTO history (name, timestamp) values(?, ?)", [name, new Date().getTime()], null, null);


dataBase = new Database("Maximum", "0.1", "Radio maximum", 20000)
window.dataBase = dataBase;