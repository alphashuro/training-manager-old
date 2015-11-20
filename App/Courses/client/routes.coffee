FlowRouter.route '/courses',
	action: -> 
		RiotLayout.render 'layout', 
			main: '<courses-page></courses-page>'

FlowRouter.route '/courses/add', 
	action: ->
		RiotLayout.render 'layout',
			main: '<add-course-page></add-course-page>'

FlowRouter.route '/facilitators/:_id',
	action: ->
		RiotLayout.render 'layout',
			main: """<edit-course-page course_id="#{params._id}"></edit-course-page>"""