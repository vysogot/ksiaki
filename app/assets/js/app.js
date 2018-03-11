// Links with confirmation popup
$(document).ready(function() {
  $('.confirmation').on('click', function () {
      return confirm('Na pewno?');
  });
});

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
    slidesToScroll: 1,
    variableWidth: true
  });

  $("#contests-slider, #movies-slider, #box-banners-slider").slick({
    dots: false,
    infinite: true,
    centerMode: true,
    slidesToShow: 4,
    slidesToScroll: 1,
    variableWidth: true
  });
});
