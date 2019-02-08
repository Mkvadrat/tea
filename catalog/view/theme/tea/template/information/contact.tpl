<?php echo $header; ?>
    
  <section class="contacts">
    <div class="container">
      <div class="row">
        <div class="col-md-6">
          <div class="contacts-text">
            <h1>Контакты</h1>
            <p>Васильев Юрий Геннадьевич (зам. ген. директора)</p>
            <a href="tel:+79787528287">+7(978)7528287</a>
            <p>Красовский Андрей Евгеньевич (коммерч. директор)</p>
            <a href="tel:+79787528215">+7(978)7528215</a>
            <p>Менеджер по оптовым продажам Татьяна</p>
            <a href="tel:+79788649637">+7(978)8649637</a>
            <p>Зав. складом Ольга  (по вопросам наличия товара, веса, объема,
              сроков, количества в паке и прочих характеристик товара)</p>
            <a href="tel:+79781417930">+7(978)1417930</a>
            <p>Бухгалтер Ольга (по вопросам оплаты, обработки заказа и прочей документации)</p>
            <a href="tel:+79787614357">+7(978)7614357</a>
            <p>Адрес:<span>Крым, Ялта, г. Алупка, ул.Крутой спуск д.12а Индекс 298676</span></p>
            <p>E-mail:<span><a href="mailto:tea-crimea@yandex.ru">tea-crimea@yandex.ru</a></span></p>
          </div>
        </div>
        <div class="col-md-6">
          <div class="contacts-img ">
            <img src="image/img-contacts.png" alt="" width="600" height="442">
          </div>

        </div>
      </div>
    </div>
  </section>
  <section class="form-contacts">
    <div class="container">
      <div class="contacts-form-wrapper">
        <h2>Обратная связь</h2>
        <p>Оставьте Ваши контактные данные и наш менеджер свяжется с Вами </p>
        <form >
          <div class="form-info">
            <div class="contacts-input">
              <input type="text" name="" value="" required placeholder="Введите Ваше имя">
              <input type="text" name="" value=""  required placeholder="Введите Ваш номер телефона">
            </div>
            <textarea name="name" required placeholder="Вопрос"></textarea>
          </div>
          <div class="formname-contacts">
              <input id="checkbox" type="checkbox" name="checkbox" onchange="document.getElementById('submit').disabled = !this.checked;" />
              <label for="checkbox">Я согласен с <span>политикой конфиденциальности</span></label>
              <input type="submit" disabled="disabled" name="submit" id="submit" value="Отправить" />
          </div>
        </form>
      </div>
    </div>
  </section>
    
<?php echo $footer; ?>
