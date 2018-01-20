  </main>
  <footer>
    <div class="wrapper-full">
      <section id="static-sites">
        <div class="wrapper">
          <ul class="bare left">
            <li><a href="#">O nas</a></li>
            <li><a href="#">Dla rodziców</a></li>
            <li><a href="#">Regulamin</a></li>
            <li><a href="#">Polityka prywatności</a></li>
            <li><a href="#">FAQ</a></li>
            <li><a href="#">Kontakt</a></li>
          </ul>
        </div>
      </section>

      <section id="copyright">
        <div class="wrapper">
          <p>© Media Service Zawada sp. z o.o.</p>
        </div>
      </section>
    </div>
  </footer>

  <script src="<?php echo Config::get('URL'); ?>js/jquery-1.11.0.min.js" type="text/javascript"></script>
  <script src="<?php echo Config::get('URL'); ?>js/slick.js" type="text/javascript" charset="utf-8"></script>
  <script type="text/javascript">
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
  </script>

</body>
</html>
