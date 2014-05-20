$( document ).ready(function(){
var Player = Backbone.Model.extend({ 
  urlRoot: app.postPath
});

var PlayerCollection = Backbone.Collection.extend({
  model: Player,
  url: app.postPath
});

var PlayerView = Backbone.View.extend({
  tagName: "li",

  initialize: function() {
    this.listenTo(this.model, "change", this.render);
    this.render();
  },

  events: {
    "click span": "destroy"
  },

  destroy: function() {
    this.model.destroy();
    this.remove();
  },

  render: function() {
    var template = $("script.template").html();
    var rendered = _.template(template, { player: this.model });
    this.$el.html(rendered);
  }
});

var FormView = Backbone.View.extend({
  el: "form",

  events: {
    "submit": "createPlayer"
  },

  createPlayer: function(e) {
    e.preventDefault();
    var name = this.el.elements["name"].value;
    var email = this.el.elements["email"].value;
    this.collection.create({email: email, name: name});
    this.el.reset();
  }
});

var ListView = Backbone.View.extend({
  el: "ul",

  initialize: function() {
    this.listenTo(this.collection, "add", this.addOne);
  },

  addOne: function(player) {
    var view = new PlayerView({model: player});
    this.$el.append(view.el);
  }
});

$(document).ready(function() {
  var players = new PlayerCollection();
  var listView = new ListView({collection: players});
  var formView = new FormView({collection: players});
  players.fetch();
});
});