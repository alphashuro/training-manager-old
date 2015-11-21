<course-form>
	<form class="ui form">
		<div class="field">
			<label>Title</label>
			<input 
				type="text" 
				name='title' 
				placeholder='Title' 
				value={opts.course.title} />
		</div>
		<div class="field">
			<label>Description</label>
			<input 
				type="text" 
				name='description' 
				placeholder='Description' 
				value={opts.course.description} />
		</div>
		<div class="field">
			<label>Max Students</label>
			<input 
				type="text" 
				name='maxStudents' 
				placeholder='Max Students' 
				value={opts.course.maxStudents} />
		</div>

		<button class='ui button'>Save</button>
				
	</form>

	<script type='coffee'>
		@on 'mount', ->
			unless @opts.course
				@opts.course = new Course();
	</script>
</course-form>