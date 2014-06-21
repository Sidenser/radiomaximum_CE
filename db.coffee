class Database
	db:null
	constructor:(name, v, description, size)->
		@db = openDatabase(name, v, description, size)
		@db.transaction (tx)->
			tx.executeSql "SELECT COUNT(*) FROM history", [], ((result)->), ((tx, error)->
				tx.executeSql "CREATE TABLE history (id REAL UNIQUE, label TEXT, timestamp REAL)")

	addItemHistory:(name)->
		@db.transaction (tx)->
			tx.executeSql("INSERT INTO history (label, timestamp) values(?, ?)", [name, new Date().getTime()], null, null);


dataBase = new Database("Maximum", "0.1", "Radio maximum", 20000)
window.dataBase = dataBase;