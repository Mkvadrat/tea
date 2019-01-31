<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title;  ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta property="og:title" content="<?php echo $title; ?>" />
<meta property="og:type" content="website" />
<meta property="og:url" content="<?php echo $og_url; ?>" />
<?php if ($og_image) { ?>
<meta property="og:image" content="<?php echo $og_image; ?>" />
<?php } else { ?>
<meta property="og:image" content="<?php echo $logo; ?>" />
<?php } ?>
<meta property="og:site_name" content="<?php echo $name; ?>" />

<link rel="stylesheet" href="catalog/view/theme/tea/style/css.css">
<link rel="stylesheet" href="catalog/view/theme/tea/style/fonts.css">
<link rel="stylesheet" href="catalog/view/theme/tea/libs/OwlCarousel2-2.3.4/dist/assets/owl.carousel.css">

<script src="catalog/view/theme/tea/libs/jquery/jquery.min.js"></script>
<script src="catalog/view/theme/tea/libs/OwlCarousel2-2.3.4/dist/owl.carousel.js"></script>
<script src="https://api-maps.yandex.ru/2.1/?lang=ru_RU" type="text/javascript"></script>
<script src="catalog/view/theme/tea/js/slider.js"></script>
<script src="catalog/view/theme/tea/js/map.js"></script>


<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/theme/tea/js/common.js" type="text/javascript"></script>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>
</head>
 <body>
    <header>
        <div class="top-nav">
          <div class="container">
            <div class="top-wrapper">
              <nav>
                <a href="#">Каталог</a>
                <a href="#">Прайс-лист</a>
                <a href="#">Заказ и оплата</a>
                <a href="#">Наши магазины</a>
                <a href="#">Документы</a>
                <a href="#">Франчайзинг</a>
                <a href="#">Контакты</a>
              </nav>
              <div class="entry">
                <a href="#">Вход/</a>
                <a href="#">Регистрация</a>
              </div>
            </div>
          </div>
        </div>
        <div class="header-info">
          <div class="container">
            <div class="header-info-wrapper">
              <div class="logo">
                <a href="#"><img src="img/logo-big.png" alt="logo" width="189" height="81"></a>
              </div>
              <div class="Cooperation">
                <p>Крым,  Ялта,  г. Алупка,<br>
                  ул. Крутой спуск  д. 12 а
                </p>
                <a href="#">Сотрудничество и опт</a>
              </div>
              <div class="data">
                <p>Время работы:<br>
                  Пн-Пт с 9:00 до 18:00
                </p>
              </div>
              <div class="phone">
                <div class="phone-icon">
                  <img src="img/phone.png" alt="phone" width="34" height="34">
                </div>
                <a href="tel:+79788649637">+7(978)8649637</a>
                <a href="tel:+79781417930">+7(978)1417930</a>
              </div>
              <div class="basket">
                <button type="button" name="basket">
                  <img src="img/basket-icon.png" alt="basket-icon" width="32" height="29">
                  <div class="number">
                    <p>10</p>
                  </div>
                  <div class="price">
                    <p>-1 34000p.</p>
                  </div>
                </button>
              </div>
            </div>
          </div>
        </div>
        <div class="bottom-nav">
          <div class="container">
            <nav>
              <a href="#">Фиточаи</a>
              <a href="#">Стевия,травы  </a>
              <a href="#">Медовая продукция</a>
              <a href="#">Крымское варенье </a>
              <a href="#">Восточные сладости</a>
              <a href="#">Пряности</a>
              <a href="#">Эфирные и косметические масла</a>
              <a href="#">Сувениры Живое </a>
              <a href="#">Еще<span><img src="img/link.png" alt="link-icon" width="19" height="4"></span></a>
            </nav>
          </div>
        </div>
    </header>
