    <script>
      jQuery(document).ready(function( $ ) {
      $("header .cooperation a").on('click', function(event){
			event.preventDefault()
			$('.overlay').addClass('open');
      })
      $(".button-card .opt-price").on('click', function(event){
			event.preventDefault()
			$('.overlay').addClass('open');
      })
      });
      $(document).mouseup(function (e) {
        var container = $(".opt-form");
        if (container.has(e.target).length === 0){
          $('.overlay').removeClass('open');
        }
      });
    </script>
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

    <!-- BEGIN JIVOSITE CODE {literal} -->
    <script type='text/javascript'>
    (function(){ var widget_id = 'M0bvWFT5Rz';var d=document;var w=window;function l(){
    var s = document.createElement('script'); s.type = 'text/javascript'; s.async = true; s.src = '//code.jivosite.com/script/widget/'+widget_id; var ss = document.getElementsByTagName('script')[0]; ss.parentNode.insertBefore(s, ss);}if(d.readyState=='complete'){l();}else{if(w.attachEvent){w.attachEvent('onload',l);}else{w.addEventListener('load',l,false);}}})();</script>
    <!-- {/literal} END JIVOSITE CODE -->
      
    <!-- Yandex.Metrika counter --> <script type="text/javascript" >   (function(m,e,t,r,i,k,a){m[i]=m[i]||function(){(m[i].a=m[i].a|| []).push(arguments)};   m[i].l=1*new Date();k=e.createElement(t),a=e.getElementsByTagName(t) [0],k.async=1,k.src=r,a.parentNode.insertBefore(k,a)})   (window, document, "script", "https://mc.yandex.ru/metrika/tag.js", "ym");
   ym(53202022, "init", {        clickmap:true,        trackLinks:true,        accurateTrackBounce:true,        webvisor:true   }); </script> <noscript><div><img src="https://mc.yandex.ru/watch/53202022" style="position:absolute; left:-9999px;" alt="" /></div></noscript> <!-- /Yandex.Metrika counter -->

	
	
  </body>
</html>
