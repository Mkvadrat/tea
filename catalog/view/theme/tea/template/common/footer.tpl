    <footer>
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-6">
            <div class="footer-content">
              <div class="footer-nav">
                <?php if($custommenu){ ?>
                <nav>
                  <?php foreach($custommenu as $menu){ ?>
                    <a href="<?php echo $menu['href']; ?>"><?php echo $menu['name']; ?></a>
                  <?php } ?>
                </nav>
                <?php } ?>
              </div>
              <div class="footer-product">
                <?php if($categories){ ?>
                <nav>
                  <?php foreach($categories as $category){ ?>
                    <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
                  <?php } ?>
                </nav>
                <?php } ?>
              </div>
              <div class="footer-company">
                <div class="address-wrapper">
                  <div class="address">
                    <p><?php echo $address; ?></p>
                  </div>
                  <div class="email-footer">
                    <a href="mailto:<?php echo $email; ?>">E-mail: <?php echo $email; ?></a>
                  </div>
                </div>
                <div class="footer-data">
                  <p><?php echo $open; ?></p>
                </div>
                <div class="phone-footer">
                  <?php echo $footer_telephone; ?>
                </div>
              </div>
              <div class="copy">
                <?php echo $wrapper; ?>
              </div>
            </div>
          </div>
          <div class="col-md-6">
            <div class="map">
              <div id="map"></div>

              <?php if($geocode){ ?>
              <script>
                //start maps
                ymaps.ready(init);
                    function init () {
                    var myMap = new ymaps.Map("map", {
                      center: [<?php echo $geocode; ?>],
                      zoom: 18,
                    <!--Скрыть элементы управления: controls: []	 -->
                      controls: []
                    }, {
                      searchControlProvider: 'yandex#search'
                    });

                      if (window.matchMedia("(max-width: 1500px)").matches) {
                      myMap.setCenter([<?php echo $geocode; ?>])
                      };
                      if (window.matchMedia("(max-width: 992px)").matches) {
                      myMap.setCenter([<?php echo $geocode; ?>])
                      };
                      if (window.matchMedia("(max-width: 767px)").matches) {
                      myMap.setCenter([<?php echo $geocode; ?>])
                      };

                  myGeoObject = new ymaps.GeoObject({
                      properties: {
                        iconContent: 'Lorem',
                        hintContent: 'Компания "Lorem"'
                      }
                      }, {

                      preset: 'islands#blackStretchyIcon',

                      draggable: false,
                    });
                  myMap.behaviors
                    .disable('scrollZoom')

                    myMap.geoObjects
                    .add(myGeoObject)
                    .add(new ymaps.Placemark([<?php echo $geocode; ?>], {
                      iconCaption: '<?php echo $geoname ? $geoname : ''?>'
                    }, {
                      preset: 'islands#greenDotIconWithCaption'
                    }))
                  }
                 //end maps


              </script>
              <?php } ?>
            </div>
          </div>
        </div>
      </div>
    </footer>

    <!-- 14.02.19 -->
    <script src="catalog/view/theme/tea/js/libs/mmenu/jquery.mmenu.all.js" type="text/javascript"></script>
    <script>
      jQuery(document).ready(function( $ ) {
        $("#menu").mmenu({
          "extensions": [
            "pagedim-black",
            "theme-dark"
          ]
        });
      });
    </script>
    <!-- 14.02.19 -->
  </body>
</html>
