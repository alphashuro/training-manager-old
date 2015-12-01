edit-client-page
  h1 Edit Client
  client-form(client='{data.client}')
  br
  learners-table(client='{data.client}')
  script(type='coffee').
    @getMeteorData = ->
    	client: Clients.findOne @opts.client_id
    @mixin 'RiotMeteorData'
