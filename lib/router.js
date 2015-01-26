Router.configure({
  layoutTemplate: 'layout',
  loadingTemplate: 'loading',
  notFoundTemplate: 'notFound',
  waitOn: function() {
    //return [Meteor.subscribe('cities'), Meteor.subscribe('cityDatasets')];
  }
});

Router.route('/', {name: 'landingPage'});
Router.route('/login', {name: 'siteLogin'});