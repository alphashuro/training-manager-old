bookings-page
	.ui.center.aligned.header
		h1 Bookings
	.ui.right.aligned.text
		a.ui.button(href='/bookings/add') New Booking
	br
	#bookings.ui.top.attached.tabular.menu
		a.item.active(data-tab="table") Table
		a.item.calendar-tab(data-tab="calendar") Calendar
	.ui.bottom.attached.tab.segment.active(data-tab="table")
		bookings-table
	.ui.bottom.attached.tab.segment(data-tab="calendar")
		bookings-calendar

	script(type='coffee').
		@on 'mount', ->
			$('#bookings.menu .item').tab
				onVisible: ->
						$('#calendar').fullCalendar 'render'
				