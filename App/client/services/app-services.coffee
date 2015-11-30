class Notification
  notify: (message) ->
    console.log message

App.Services.Notify = new Notification()
