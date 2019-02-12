

$('#button').html('Еще...');

$('#button').on('click', function(e){
  e.preventDefault();

  var
    $this = $(this),
    content = $('#block');


  if(!$this.hasClass('trigger')){
    $this.addClass('trigger');
    $this.html('Скрыть еще...');

    content.slideDown();
  } else {
    $this.removeClass('trigger');
    $this.html('Еще...' );

    content.slideUp();
  }
});
// start slider
$('.owl-carousel').owlCarousel({
loop:true,
margin:10,
nav:true,
responsive:{
0:{
    items:1
},
600:{
    items:1
},
1000:{
    items:1
}
}
})
// end slider

//start maps
ymaps.ready(init);

      function init () {
        var myMap = new ymaps.Map("map", {
          center: [44.425340, 34.059471],
          zoom: 18,
<!--Скрыть элементы управления: controls: []	 -->
          controls: []
        }, {
          searchControlProvider: 'yandex#search'
        });

          if (window.matchMedia("(max-width: 1500px)").matches) {
            myMap.setCenter([44.425340, 34.059471])
          };
          if (window.matchMedia("(max-width: 992px)").matches) {
            myMap.setCenter([44.425340, 34.059471])
          };
          if (window.matchMedia("(max-width: 767px)").matches) {
            myMap.setCenter([44.425340, 34.059471])
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
        .add(new ymaps.Placemark([44.425340, 34.0594713], {
            iconCaption: 'Крутой переулок'
        }, {
            preset: 'islands#greenDotIconWithCaption'
        }))

    }

 //end maps

 // start Stamp
 function Stamp() {
   window.print();
 }
 // end stamp

 // start tab
 function openTabs(evt, cityName) {
   var i, tabcontent, tablinks;
   tabcontent = document.getElementsByClassName("tabcontent");
   for (i = 0; i < tabcontent.length; i++) {
     tabcontent[i].style.display = "none";
   }
   tablinks = document.getElementsByClassName("tablinks");
   for (i = 0; i < tablinks.length; i++) {
     tablinks[i].className = tablinks[i].className.replace(" active", "");
   }
   document.getElementById(cityName).style.display = "block";
   evt.currentTarget.className += " active";
 }

 document.getElementById("defaultOpen").click();
// end Stamp
