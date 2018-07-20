// player settings;
var is_muted = true;

vex.defaultOptions.className = 'vex-theme-flat-attack'

$(document).on('ready', function() {

    $(document.body).css('visibility', 'visible');

    $('.modal .close').click(function() {
        $('.modal').hide();
    });

    $('a.modal-image').on('click', function(event) {
        event.preventDefault();
        vex.open({
            unsafeContent: '<div class="center shrink"><img src="' + $(this).attr('href') + '"/></div>',
            contentClassName: 'wide',
            showCloseButton: false
        })
    });

    $('a.modal-remote').on('click', function(event) {
        event.preventDefault();

        var href = $(this).attr('href');
        var className = $(this).data('modal-class');

        $.get(href, function(response) {
            vex.open({
                unsafeContent: response,
                contentClassName: className
            })
        })
    });

    $('a.no-action').on('click', function(event) {
        event.preventDefault();
    });

    $('a.rodo').click(function(event) {
        event.preventDefault();

        $.get('/rodo', function(response) {
            vex.dialog.open({
                unsafeMessage: response,
                contentClassName: 'wide-text',
                overlayClosesOnClick: false,
                buttons: [
                    $.extend({}, vex.dialog.buttons.YES, { text: 'Rozumiem' }),
                ]
            });
        });
    });

    $("#heroes-slider").slick({
        dots: false,
        infinite: true,
        centerMode: true,
        slidesToShow: 5,
        slidesToScroll: 5,
        variableWidth: true,
        lazyLoad: 'ondemand'
    })
    .on('mouseenter', '.slick-slide', function (e) {
        $(e.currentTarget).addClass('expanded');
    })
    .on('mouseleave', '.slick-slide', function(e) {
        $(e.currentTarget).removeClass('expanded');
    });

    // Slider
    $("#slajder").slick({
        dots: false,
        vertical: false,
        centerMode: false,
        slidesToShow: 1,
        slidesToScroll: 1,
        autoplay: true,
        infinite: true,
        arrows: false,
        lazyLoad: 'ondemand'
    });

    $("#player").slick({
        dots: false,
        vertical: false,
        centerMode: false,
        slidesToShow: 1,
        slidesToScroll: 1,
        autoplay: false,
        infinite: true,
        arrows: false,
        lazyLoad: 'ondemand'
    });

    $(".box-slider").each(function() {

        console.log($(this).data('per-page'));
        var perPage = parseInt($(this).data('per-page')) || 2;

        $(this).slick({
            variableWidth: true,
            infinite: false,
            slidesToShow: perPage,
            slidesToScroll: perPage,
            lazyLoad: 'ondemand'
        })
        .on('mouseenter', '.slick-slide', function (e) {
            $(e.currentTarget).addClass('expanded-light');
        })
        .on('mouseleave', '.slick-slide', function(e) {
            $(e.currentTarget).removeClass('expanded-light');
        });
    });

    // Player

    // Run autoplay videos to satisfy Chrome
    $("#player video[autoplay]").each(function() { 
        
        this.muted = window.is_muted;

        if (!isMobile.any()) {
            
            var isPlaying = this.currentTime > 0 && !this.paused && !this.ended 
                            && this.readyState > 2;

            if (!isPlaying) {
              this.play();
            }  

        } else {
            this.preload = 'metadata';
            this.autoplay = false;
        }

    });

    // Hide every link so it can be set to display: block in CSS
    $("#player video").each(function(){ $(this).next().next().hide(); });

    // Every video is muted at the begining with overlay to turn sound on
    $('#player .mute').click(function () {
        var mute = $(this);
        var video = $(this).prev()[0];

        window.is_muted = false;
        video.muted = window.is_muted;
        mute.fadeOut();
    });

    // When video is clicked it gets muted back
    $("#player video").click(function () {
        var mute = $($(this).next());
        var video = $(this)[0];

        window.is_muted = true;
        video.muted = window.is_muted;
        mute.fadeIn();
    })

    // When video ended, display a call to action link
        .on('ended', function() {
            var cta = $($(this).next().next());
            var mute = $($(this).next());
            var video = $(this);

            video.hide();
            mute.hide();
            cta.show();

            // show another slick slide after a moment unless there is just one video
            if ($("#player video").size() > 1) {
                setTimeout(function () {
                    $('#player').slick('slickNext');
                    cta.hide();
                }, 1000);
            }
        });

    // make sure video and mute are available
    $('#player').on('beforeChange', function(event, slick, currentSlide, nextSlide) {
        var video = $($(slick.$slides.get(currentSlide)).children('video:first-child')[0]);
        var mute = $($(video).next()[0]);

        if (window.is_muted) {
            mute.show();
        } else {
            mute.hide();
        }

        video.show();
    });

    // and play the video silently
    $('#player').on('afterChange', function(event, slick, currentSlide, nextSlide) {
        var video = $(slick.$slides.get(currentSlide)).children('video:first-child')[0];
        var mute = $($(video).next()[0]);

        if (window.is_muted) {
            mute.show();
        } else {
            mute.hide();
        }

        video.muted = window.is_muted;

        var isPlaying = video.currentTime > 0 && !video.paused && !video.ended 
                           && video.readyState > 2;

        if (!isPlaying) {
          video.play();
        }

    });

    if (window.appEnv == 'production') {
      (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

      ga('create', 'UA-50691492-1', 'konkursiaki.pl');
      ga('send', 'pageview');
    }
});