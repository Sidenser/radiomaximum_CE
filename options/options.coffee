class Options
	constructor:()->
		@trackHistoryLoad()
	trackHistoryLoad:()->
		window.dataBase.getAll (data)->
			table = document.getElementById "tracks-history"
			for i of data
				tr = document.createElement "tr"
				tdDate = document.createElement "td"
				date = new Date (data[i].timestamp)
				tdDate.innerHTML = date.getDay() + '.' + date.getMonth() + '.' + date.getFullYear();
				tdName = document.createElement "td"
				tdName.innerHTML = data[i].name
				tr.appendChild tdDate
				tr.appendChild tdName
				table.appendChild(tr)
window.options = new Options();