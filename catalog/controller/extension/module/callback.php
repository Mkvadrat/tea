<?php
class ControllerExtensionModuleCallback extends Controller {
	private $error = array();
	
	public function index() {
		$this->load->language('extension/module/callback');

		$data['text_cooperation'] = $this->language->get('text_cooperation');
		
		$data['text_contact_iformation'] = $this->language->get('text_contact_iformation');
		
		$data['text_politics'] = $this->language->get('text_contact_iformation');
		
		return $this->load->view('extension/module/callback', $data);
	}
	
	public function sendForm(){
		$json = array();
	
		$site_url = $_SERVER['SERVER_NAME'];

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			$mail->smtp_username = $this->config->get('config_mail_smtp_username');
			$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
			
			$mail->setTo($this->config->get('config_email'));
			$mail->setFrom($site_url);
			$mail->setSender(html_entity_decode($this->request->post['name'], ENT_QUOTES, 'UTF-8'));
			$mail->setSubject(html_entity_decode(sprintf($this->language->get('email_subject'), $this->request->post['name']), ENT_QUOTES, 'UTF-8'));
			$mail->setText($this->request->post['message']);
			$this->load->model('extension/module/phe');
			$phe = $this->model_extension_module_phe->getTemplate('callback');
			
			if ($phe && !empty($phe['message'])) { 	
				$phe_data['store_name'] = $this->config->get('config_name');
				$phe_data['url'] = $this->config->get('config_url');
				$phe_data['logo'] = $this->config->get('config_url') . 'image/' . $this->config->get('config_logo');
				
				if (!empty($phe['image'])) {
					$phe_data['logo'] = $this->config->get('config_url') . 'image/' . $phe['image'];
				}
				
				$phe_data['body'] = $phe['body'];
				$phe_data['heading'] = $phe['heading'];
				$phe_data['background'] = $phe['background'];
				
				$message = $phe['message'];
				
				$search = array(
					'{firstname}',
					'{telephone}',
					'{enquiry}',
				);
				
				$replace = array(
					$this->request->post['name'],
					$this->request->post['phone'],
					$this->request->post['message']
				);
				
				$phe_data['subject'] = str_replace($search, $replace, html_entity_decode($phe['subject']));
				$phe_data['message'] = str_replace($search, $replace, html_entity_decode($phe['message']));
				
				$html = $this->load->view('mail/phe', $phe_data);
				
				$mail->setTo($this->config->get('config_email'));
				$mail->setSubject($phe_data['subject']);
				$mail->setFrom($this->config->get('config_email'));
				$mail->setSender($this->config->get('config_name'));
				$mail->setHtml($html);
				$mail->send();
			}else{
				$mail->send();
			}
			
			if ($mail){
				$json = array(
					'status' => 200,
					'success' => 'Ваше сообщение отправлено'
				);
			}		
		}
		
		$this->load->language('extension/module/callback');
		
		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 32)) {
			$json['error'][] = $this->language->get('error_name');
		}
		
		if ((utf8_strlen($this->request->post['phone']) < 3) || (utf8_strlen($this->request->post['phone']) > 32)) {
			$json['error'][] = $this->language->get('error_phone');
		}
		
		if ((utf8_strlen($this->request->post['message']) < 10) || (utf8_strlen($this->request->post['message']) > 3000)) {
			$json['error'][] = $this->language->get('error_message');
		}
		
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	
	protected function validate() {
		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 32)) {
			$this->error['name'] = $this->language->get('error_name');
		}

		if ((utf8_strlen($this->request->post['phone']) < 3) || (utf8_strlen($this->request->post['phone']) > 32)) {
			$this->error['phone'] = $this->language->get('error_phone');
		}

		if ((utf8_strlen($this->request->post['message']) < 10) || (utf8_strlen($this->request->post['message']) > 3000)) {
			$this->error['message'] = $this->language->get('error_message');
		}

		// Captcha
		if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('contact', (array)$this->config->get('config_captcha_page'))) {
			$captcha = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha') . '/validate');

			if ($captcha) {
				$this->error['captcha'] = $captcha;
			}
		}

		return !$this->error;
	}
}