class Notification
  notify: (message, type = 'log') ->
    console.log message
    switch type
      when 'log', 'error', 'success', 'warning'
        alertify[type] message
  log: (message) ->
    console.log message

App.Services.Notification = new Notification()
