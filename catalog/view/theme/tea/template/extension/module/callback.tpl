<section class="form">
  <div class="container">
    <div class="form-wrapper">
      <p><?php echo $text_cooperation; ?></p>
      <span><?php echo $text_contact_iformation; ?></span>
      <div>
        <div class="form-info">
          <input type="text" id="name" class="reset_input" placeholder="Введите Ваше имя">
          <input type="text" id="phone" class="reset_input" placeholder="Введите Ваш номер телефона">
          <input type="text" id="message" class="reset_input" placeholder="Вопрос">
        </div>
        <div class="warning"></div>
        <div class="formname">
            <input id="checkbox" type="checkbox" name="checkbox" onchange="document.getElementById('submit').disabled = !this.checked;" />
            <label for="checkbox"><?php echo $text_politics; ?></label>
            <input type="submit" disabled="disabled" onclick="sendForm();" id="submit" value="Отправить" />
        </div>
      </div>
    </div>
  </div>
</section>
