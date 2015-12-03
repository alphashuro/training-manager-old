edit-user-page
  .ui.center.aligned.header Edit User
  .ui.segment
    user-form(user="{data.user}")
  
  script(type='coffee').
    @getMeteorData = ->
      user: User.findOne @opts.user_id
    @mixin 'RiotMeteorData'
