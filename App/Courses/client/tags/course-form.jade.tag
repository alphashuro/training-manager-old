course-form
	form.ui.form(onsubmit='{save}')

		.field
			label Title
			input(
				type="text" 
				name='title' 
				placeholder='Title' 
				value='{opts.course.title}' )
		
		.field
			label Description
			input(
				type="text" 
				name='description' 
				placeholder='Description' 
				value='{opts.course.description}' )
		
		.field
			label Max Students
			input(
				type="text" 
				name='maxStudents' 
				placeholder='Max Students' 
				value='{opts.course.maxStudents}' )
		
		button.ui.button Save

	script(type='coffee').
		@on 'mount', ->
			unless @opts.course
				@opts.course = new Course()

		@save = (e) ->
			e.preventDefault()
			@opts.course.set
				title: @title.value
				description: @description.value
				maxStudents: @maxStudents.value

			@opts.course.save (error) ->
				if error then console.log error
				else console.log 'Course saved'