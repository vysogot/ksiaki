        <div class="footer">
          <div id="static-sites">
            <ul class="bare left">
              <li>O nas</li>
              <li>Dla rodziców</li>
              <li>Regulamin</li>
              <li>Polityka prywatności</li>
              <li>FAQ</li>
              <li>Kontakt</li>
            </ul>
          </div>

          <div id="copyright">
            <p>Copyright</p>
          </div>
        </div>
    </div><!-- close id="wrapper" -->
  </div><!-- close id="page" -->
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
