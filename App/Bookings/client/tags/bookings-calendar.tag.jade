bookings-calendar
	h3 Calendar
	#calendar

	script(type='coffee').
		@getMeteorData = ->
			bookings = Bookings.find().fetch()
			events = bookings.map (b) -> b.events()
			result = _.flatten events

			$('#calendar').fullCalendar 'refetchEvents'

			{
				bookings
				events: result
			}
		@mixin 'RiotMeteorData'

		@on 'mount', ->
			$('#calendar').fullCalendar
				weekends: no
				defaultView: 'agendaWeek'
				eventSources: [
					events: @data.events
				]
				minTime: "08:00"
				maxTime: "16:30"
				eventStartEditable: false
				eventDrop: (event, delta, revert) ->
					[bookingId, classId] = event.id.split '/'
					booking = Bookings.findOne bookingId
					sessions = booking.sessions
					session = _.findWhere sessions, { classId }

					# something is adding an extra 2 hours to event.start
					session.set 'date', event.start.toDate()
					booking.save (error) =>
						if (error) console.log error
						else console.log "Saved session: #{session} for booking: #{booking}"