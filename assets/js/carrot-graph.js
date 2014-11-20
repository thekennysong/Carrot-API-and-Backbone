var personsCollection;
var searchTerm;
var Person = Backbone.Model.extend({

});

var PersonCollection = Backbone.Collection.extend({

    model: Person
});


var PersonItemView = Backbone.View.extend({
    template: Handlebars.compile($('#page-template').html()),

    render: function(){
        var html = this.template(this.model.toJSON());
        this.$el.html(html);

    }
});

var PersonsView = Backbone.View.extend({
    render: function(){
        this.el.innerHTML = "";
        
        this.collection.each(function(model){
            var view = new PersonItemView({
                model: model
            });

            view.render();
            
            this.$el.append(view.el);

        }, this);

        //loop over the collection
        //for each model, create a new ReviewItemView, view that manages a single review
        //render ReviewView
    }
});
var personsView = new PersonsView({
    collection: personsCollection,
    el: '#page-template'
});


function search(searchTerm){
    return $.getJSON("http://api.bycarrot.com/staff/" + searchTerm);

}

$('form').on('submit', function(e){
    e.preventDefault();

    searchTerm = $('#search-term').val();

    $('#results').html('Loading....');

    search(searchTerm).then(function(data){

        personsCollection = new PersonCollection(data.data);

        var personsView = new PersonsView({
            collection: personsCollection,
            el: '#results'
        });


        personsView.render();
        //$('#container').append(personsView.el);
    })
});
