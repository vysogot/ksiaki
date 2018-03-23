// Custom sliders
$(document).on('ready', function() {
  $("#banner, #slajder").slick({
    dots: false,
    vertical: true,
    centerMode: false,
    slidesToShow: 1,
    slidesToScroll: 1,
    autoplay: true,
    infinite: true,
    arrows: false
  });

  $("#heroes-slider").slick({
    dots: false,
    infinite: true,
    centerMode: true,
    slidesToShow: 5,
    slidesToScroll: 5,
    variableWidth: true
  })
  .on('mouseenter', '.slick-slide', function (e) {
    $(e.currentTarget).addClass('expanded');
  })
  .on('mouseleave', '.slick-slide', function(e) {
    $(e.currentTarget).removeClass('expanded');
  });

  $("#contests-slider, #movies-slider, #box-banners-slider").slick({
    variableWidth: true,
    infinite: true,
    slidesToShow: 4,
    slidesToScroll: 4
  })
  .on('mouseenter', '.slick-slide', function (e) {
    $(e.currentTarget).addClass('expanded-light');
  })
  .on('mouseleave', '.slick-slide', function(e) {
    $(e.currentTarget).removeClass('expanded-light');
  });
});
