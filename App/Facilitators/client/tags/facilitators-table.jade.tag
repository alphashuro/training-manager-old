facilitators-table
	table.ui.table
		thead
			tr
				th Name
				th Phone
				th Email
				th Actions
		tbody
			tr(each='{data.facilitators}')
				td {profile.name}
				td {profile.phone}
				td {getFirstEmail()}
				td
					a.ui.primary.button(href='/facilitators/{_id}') Details
					button.ui.button(onclick='{parent.delete}') Delete

	script(type='coffee').
		@getMeteorData = ->
			facilitators : App.API.facilitators.getAll().fetch()
		@mixin 'RiotMeteorData'

		@delete = (e) -> e.item.remove()
