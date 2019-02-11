<?php
class ControllerInformationContact extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('information/contact');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('tool/image');

		if ($this->config->get('config_image')) {
			$data['image'] = $this->model_tool_image->resize($this->config->get('config_image'), $this->config->get($this->config->get('config_theme') . '_image_location_width'), $this->config->get($this->config->get('config_theme') . '_image_location_height'));
		} else {
			$data['image'] = false;
		}

		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['contacts'] = html_entity_decode($this->config->get('config_contacts'), ENT_QUOTES, 'UTF-8');

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('information/contact', $data));
	}
}
