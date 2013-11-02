jsdom = require 'jsdom'

module.exports = ->
	jsdom.env './html/basic.html', ["http://code.jquery.com/jquery.js"], (errors, window) ->
		
		people = [] # a place to store names & numbers
		
		# the jQuery object becomes a member of the window object passed to the handler.
		window.$('table tr').each((k,tr) ->
			tr = window.$(tr)
			if (tr.find('td')[0]) # skip the header row
				person = 
					name: tr.find('td:first').html() # name is in first td
					phone: tr.find('td:last').html() # phone is in last td
				people.push person
		)
		console.log people
	