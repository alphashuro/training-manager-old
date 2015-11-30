FlowRouter.route '/facilitators',
	action: -> 
		RiotLayout.render 'layout', 
			main: '<facilitators-page></facilitators-page>'

FlowRouter.route '/facilitators/add',
	action: ->
		RiotLayout.render 'layout',
			main: '<add-facilitator-page></add-facilitator-page>'

FlowRouter.route '/facilitators/:_id',
	action: (params) ->
		RiotLayout.render 'layout',
			main: """<edit-facilitator-page facilitator_id=#{params._id}></edit-facilitator-page>"""