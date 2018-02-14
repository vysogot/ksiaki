// Links with confirmation popup
$(document).ready(function() {
  $('.confirmation').on('click', function () {
      return confirm('Na pewno?');
  });
});

// Custom sliders
$(document).on('ready', function() {
  $("#banner, #slider").slick({
    dots: false,
    vertical: true,
    centerMode: false,
    slidesToShow: 1,
    slidesToScroll: 1,
    autoplay: true,
    infinite: true,
    arrows: false
  });

  $("#heroes").slick({
    dots: false,
    infinite: true,
    centerMode: true,
    slidesToShow: 5,
    slidesToScroll: 1,
    variableWidth: true
  });
});
