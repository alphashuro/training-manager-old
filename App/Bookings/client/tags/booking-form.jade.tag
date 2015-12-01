booking-form
	form.ui.form(onsubmit='{save}')
		
		.field
			.ui.segment.grid
				.ui.eight.wide.column
					.ui.header
						h2 Course
					p {opts.booking.course().title}
				.ui.eight.wide.column
					.ui.input: select.ui.fluid.dropdown(name='courseId' onchange='{changed}' value='{opts.booking.courseId}')
						option(value='') Course
						option(each='{data.courses}' value='{_id}' selected='{_id == courseId.value}') {title}

		.field
			.ui.segment.grid
				.ui.eight.wide.column
					.ui.header
						h2 Learners Booked ({opts.booking.learners().count()} / {opts.booking.course().maxStudents})
					.ui.middle.aligned.divided.list
						.item(each='{opts.booking.learners().fetch()}')
							.right.floated.content: button.ui.button(onclick='{parent.removeLearner}') Remove
							.content {name} ({client().name})
				.ui.eight.wide.column
					.ui.header Select Client
					select.ui.fluid.dropdown(name='clientId' onchange='{changed}')
						option(value='') Client
						option(each='{data.clients}' value='{_id}' selected='{_id == clientId.value}') {name}
					.ui.header Select Learners
					ul: li(each='{data.learners}')
						.ui.checkbox
							input(
								type="checkbox" 
								checked='{ parent.opts.booking.learnerIds.includes(_id) }' 
								onchange='{ parent.learnerToggled }')
							label {name}

		.field
			.ui.segment.grid
				.ui.eight.wide.column
					.ui.header
						h2 Sessions
						p Total hours : { opts.booking.hours() }
						p Total price : R { opts.booking.price() }
					.ui.segment(each='{opts.booking.sessions}')
						p {moment(date).calendar()}
							input(type='datetime-local' value="{moment(date).format('YYYY-MM-DD[T]HH:mm')}")
						p Facilitator: {facilitator().name}
							select.ui.fluid.dropdown(onchange='{ parent.sessionFacilitatorChanged }')
								option(value='') Facilitator
								option(each='{parent.data.facilitators}' value='{_id}' selected='{_id == parent.facilitatorId }') {name}
						p Class: {class().title}
				.ui.eight.wide.column
					.ui.header Select Sessions
					select.ui.fluid.dropdown(name='facilitatorId' onchange='{changed}')
						option(value='') Assign a facilitator to all sessions
						option(each='{data.facilitators}' value='{_id}' selected='{_id == facilitatorId.value}') {name}
					ul: li(each='{data.sessions}')
						p {class().title}
						p {class().description}
						p {class().duration} hrs
						p R {class().price}

		button.ui.button Save
				
	script(type='coffee').
		@on 'mount', ->
			unless @opts.booking
				@opts.booking = new Booking()

		@getMeteorData = ->
			courses: Courses.find().fetch()
			clients: Clients.find().fetch()
			learners: Learners.find({clientId: @clientId.value}).fetch()
			facilitators: Facilitators.find().fetch()
			sessions: Classes.find({courseId: @opts.booking?.courseId}).fetch().map (c) -> 
				new SessionClass
					classId: c._id

		@mixin 'RiotMeteorData'

		@save = (e) ->
			e.preventDefault()

			@opts.booking.save (error) ->
				if error then console.log error
				else console.log 'Booking saved'
	
		@changed = (e) ->
			switch e.target.name

				when 'courseId'
					@opts.booking.set 
						sessions: @data.sessions
						courseId: e.target.value

				when 'facilitatorId'
					@opts.booking.sessions.forEach (session) => session.set facilitatorId: e.target.value

		@learnerToggled = (e) =>
			learner = e.item
			if @opts.booking.learnerIds.includes learner._id
				@opts.booking.pull 'learnerIds', learner._id
			else
				@opts.booking.push 'learnerIds', learner._id

		@removeLearner = (e) =>
			learner = e.item
			@opts.booking.pull 'learnerIds', learner._id 

		@sessionFacilitatorChanged = (e) =>
			session = e.item
			facilitatorId = e.target.value
			session.set { facilitatorId }