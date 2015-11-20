<course-form>
	<form class="ui form">
		<div class="field">
			<label>Title</label>
			<input type="text" name='title' placeholder='Title' value={course.title} />
		</div>
		<div class="field">
			<label>Description</label>
			<input type="text" name='description' placeholder='Description' value={course.description} />
		</div>
		<div class="field">
			<label>Max Students</label>
			<input type="text" name='maxStudents' placeholder='Max Students' value={course.maxStudents} />
		</div>

		<button class='ui button'>Save</button>
				
	</form>

	<script>
		this.on('mount', () => {
			if(this.opts.course)
				this.course = this.opts.course;
			else
				this.course = new Course();
		});
	</script>
</course-form>