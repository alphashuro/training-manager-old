learners-table
  table.ui.celled.table
    thead
      tr
        th Name
        th Phone
        th Email
        th Actions
    tbody
      tr
        td
          .ui.input
            input(type='text', name='name', placeholder='Name')
        td
          .ui.input
            input(type='text', name='phone', placeholder='Phone')
        td
          .ui.input
            input(type='text', name='email', placeholder='Email')
        td
          button.ui.button(type='button') Add
      tr(each='{data.learners}')
        td {name}
        td {phone}
        td {email}
        td
          button.ui.button(onclick='{parent.delete}') Delete
  script(type='coffee').
    @getMeteorData = ->
    	learners: @opts.client?.learners().fetch()
    @mixin 'RiotMeteorData'
    @delete = (e) -> e.item.remove()
    @add = ->
	    l = new Learner
		    name: @name.value
		    phone: @phone.value
		    email: @email.value
		    clientId: @opts.client._id
	    l.save()
