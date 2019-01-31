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

          //Media Queries

          if (window.matchMedia("(max-width: 1500px)").matches) {
            myMap.setCenter([44.425340, 34.059471])
          };
          if (window.matchMedia("(max-width: 992px)").matches) {
            myMap.setCenter([44.425340, 34.059471])
          };
          if (window.matchMedia("(max-width: 767px)").matches) {
            myMap.setCenter([44.425340, 34.059471])
          };

  // Создаем геообъект с типом геометрии "Точка".
  myGeoObject = new ymaps.GeoObject({
          // Описание геометрии.

          // Свойства.
          properties: {
              // Контент метки.
              iconContent: 'Lorem',
              hintContent: 'Компания "Lorem"'
            }
          }, {
          // Опции.
          // Иконка метки будет растягиваться под размер ее содержимого.
          preset: 'islands#blackStretchyIcon',
          // Метку можно перемещать.
          draggable: false,
          // Необходимо указать данный тип макета.
          //iconLayout: 'default#image',
           // Своё изображение иконки метки.
          //iconImageHref: 'img/pin.png',
          // Размеры метки.
          //iconImageSize: [74, 99],
          // Смещение левого верхнего угла иконки относительно
          // её "ножки" (точки привязки).
          //iconImageOffset: [-7, -110]
        });

  myMap.behaviors
      // Отключаем часть включенных по умолчанию поведений:
      //  - drag - перемещение карты при нажатой левой кнопки мыши;
      //  - magnifier.rightButton - увеличение области, выделенной правой кнопкой мыши.
      .disable('scrollZoom')



      myMap.geoObjects
        .add(myGeoObject)
        .add(new ymaps.Placemark([44.425340, 34.0594713], {
            iconCaption: 'Крутой переулок'
        }, {
            preset: 'islands#greenDotIconWithCaption'
        }))

    }
