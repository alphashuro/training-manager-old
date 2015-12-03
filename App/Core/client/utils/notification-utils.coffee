# a default callback
# used for notifying users when there is an error
# or when an operation is successful
# ** takes message and error arguments
notify = (message, error) ->
  type = ''
  if error
    message = error.reason
    type = 'error'
  else
    type = 'success'
  App.Services.Notification.notify message, type

App.Utils.notify = notify
