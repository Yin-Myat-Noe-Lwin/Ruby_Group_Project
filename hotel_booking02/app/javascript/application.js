// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require jquery
//= require owl.carousel

$('.owl-carousel').owlCarousel({
  center: true,
  items: 3,
  loop: true,
  margin: 50,
  autoplay: true,
  autoplayTimeout: 2000,
  responsive: {
    0: {
      items: 1
    },
    600: {
      items: 2
    },
    1000: {
      items: 3
    }
  }
});

