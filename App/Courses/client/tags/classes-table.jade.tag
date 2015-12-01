classes-table
  table.ui.celled.table
    thead
      tr
        th Title
        th Description
        th Duration
        th Price
        th Actions
    tbody
      tr
        td
          .ui.input
            input(type='text', name='title', placeholder='Title')
        td
          .ui.input
            input(type='text', name='description', placeholder='Description')
        td
          .ui.input
            input(type='text', name='duration', placeholder='Duration')
        td
          .ui.input
            input(type='text', name='price', placeholder='Price')
        td
          button.ui.button(type='button', onclick='{add}') Add
      tr(each='{data.classes}')
        td {title}
        td {description}
        td {duration}
        td {price}
        td
          button.ui.button(onclick='{parent.delete}') Delete
  script(type='coffee').
    @getMeteorData = ->
      classes: @opts.course?.classes().fetch()
    @mixin 'RiotMeteorData'
    @delete = (e) -> e.item.remove()
    @add = ->
      c = new Class
        title: @title.value
        description: @description.value
        duration: @duration.value
        price: @price.value
        courseId: @opts.course._id

      c.save()
