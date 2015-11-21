FlowRouter.route '/clients',
	action: -> 
		RiotLayout.render 'layout', 
			main: '<clients-page></clients-page>'

FlowRouter.route '/clients/add',
	action: -> 
		RiotLayout.render 'layout', 
			main: '<add-client-page></add-client-page>'

FlowRouter.route '/clients/:_id',
	action: (params) -> 
		RiotLayout.render 'layout', 
			main: "<edit-client-page client_id=#{params._id}></edit-client-page>"