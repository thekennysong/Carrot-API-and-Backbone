class Person extends Backbone.Model

class PersonCollection extends Backbone.Collection
  model: Person

class PersonItemView extends Backbone.View
  template: templates.person

  render: ->
    console.log @
    html = @template(@model.toJSON())
    @$el.html(html)

class PeopleView extends Backbone.View
  render: ->
    @el.innerHTML = ""

    for model in @collection.models
      view = new PersonItemView(model: model)
      view.render()
      @$el.append(view.el)

$('form').on 'submit', (e) ->
    e.preventDefault()
    $('#results').html('Loading....')

    search($('#search-term').val()).then (data) ->
      peopleCollection = new PersonCollection(data.data)
      peopleView = new PeopleView(collection: peopleCollection, el: '#results')
      peopleView.render()

search = (term) ->
  $.getJSON("http://api.bycarrot.com/staff/#{term}")