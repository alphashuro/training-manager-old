<edit-course-page>
	<h1>Edit Course</h1>
	<course-form course="{data.course}"></course-form>

	<br>
	<classes-table course="{data.course}"></classes-table>

	<script>
	'use strict';
	getMeteorData() {
		return {
			course: Courses.findOne(this.opts.course_id)
		}
	}
	this.mixin('RiotMeteorData');
	</script>
</edit-course-page>