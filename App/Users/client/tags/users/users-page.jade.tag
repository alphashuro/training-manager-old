users-page
  .ui.center.aligned.header Users
  users-table
  
users-table
  table.ui.table
    thead
      tr
        th Name
        th Email
        th Roles
        th Actions
    tbody
      tr(each="{data.users}")
        td {getName()}
        td {getFirstEmail()}
        td {getRoles()}
        td 
          a.ui.primary.button(href='/users/{_id}') Details
          button.ui.button(onclick='{delete}') Delete

  script(type='coffee').
    @getMeteorData = ->
      users: User.find().fetch()      
    @mixin 'RiotMeteorData'