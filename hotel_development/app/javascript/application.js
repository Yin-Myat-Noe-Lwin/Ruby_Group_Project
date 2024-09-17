// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require turbolinks
//= require jquery
//= require owl.carousel
//= require datatables
//= require chartkick
//= require Chart.bundle

window.ClientSideValidations.callbacks.element.fail = function(element, message, callback) {
  $('.submit').prop("disabled",true);
  callback();
};

window.ClientSideValidations.callbacks.element.pass = function(element, callback) {
  $('.submit').prop("disabled",false);
  callback();
};