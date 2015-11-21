<edit-course-page>
	<h1>Edit Course</h1>
	<course-form course="{data.course}"></course-form>

	<br>
	<classes-table course="{data.course}"></classes-table>

	<script type='coffee'>
		@getMeteorData = ->
			course: Courses.findOne @opts.course_id
		@mixin 'RiotMeteorData'
	</script>
</edit-course-page>