chance = new Chance 'facilitators'

chance.mixin
	facilitator: -> {
			name: chance.name()
			email: chance.email()
			phone: chance.phone()
		}

@createFacilitators = (count = 5) ->
	_.times count, ->
		facilitator = new Facilitator chance.facilitator()
		facilitator.save()

@resetFacilitators = -> Facilitators.remove({})