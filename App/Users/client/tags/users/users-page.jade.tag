users-page
	.ui.center.aligned.header
	h1 Users
	.ui.right.aligned.text
		a.ui.button(href='/users/add') New User
	br
	users-table

users-table
	table.ui.table
		thead
			tr
				th Name
				th Email
				th Roles
				th Actions
		tbody
			tr(each="{data.users}")
				td {getName()}
				td {getFirstEmail()}
				td {getRoles()}
				td
					a.ui.primary.button(href='/users/{_id}') Details
					button.ui.button(onclick='{delete}') Delete

	script(type='coffee').
		@getMeteorData = ->
			users: App.API.users.getAll().fetch()
		@mixin 'RiotMeteorData'

		@delete = (e) ->
			user = e.item
			App.API.users.remove user._id
