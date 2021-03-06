class Database
	db:null
	constructor:(name, v, description, size)->
		@db = openDatabase(name, v, description, size)
		@db.transaction (tx)->
			tx.executeSql "CREATE TABLE IF NOT EXISTS history (name TEXT UNIQUE, timestamp REAL)"
	addItemHistory:(name)->
		@db.transaction (tx)->
			tx.executeSql("INSERT INTO history (name, timestamp) values(?, ?)", [name, new Date().getTime()], null, null);
	getAll:(callback)->
		@db.transaction (tx)->
			tx.executeSql "SELECT * FROM history",[], (tx, res)->
				len = res.rows.length
				i = 0
				data = []
				while i < len
					data.push(res.rows.item(i))
					i++
				callback(data)


dataBase = new Database("Maximum", "0.1", "Radio maximum", 20000)
window.dataBase = dataBase;