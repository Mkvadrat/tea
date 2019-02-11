<?php
class ControllerCommonFooter extends Controller {
	public function index() {
		$this->load->language('common/footer');

		$data['scripts'] = $this->document->getScripts('footer');

		$data['text_information'] = $this->language->get('text_information');
		$data['text_service'] = $this->language->get('text_service');
		$data['text_extra'] = $this->language->get('text_extra');
		$data['text_contact'] = $this->language->get('text_contact');
		$data['text_return'] = $this->language->get('text_return');
		$data['text_sitemap'] = $this->language->get('text_sitemap');
		$data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$data['text_voucher'] = $this->language->get('text_voucher');
		$data['text_affiliate'] = $this->language->get('text_affiliate');
		$data['text_special'] = $this->language->get('text_special');
		$data['text_account'] = $this->language->get('text_account');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_wishlist'] = $this->language->get('text_wishlist');
		$data['text_newsletter'] = $this->language->get('text_newsletter');
		
		$data['address'] = html_entity_decode($this->config->get('config_address'), ENT_QUOTES, 'UTF-8');
		$data['open'] = html_entity_decode($this->config->get('config_open'), ENT_QUOTES, 'UTF-8');
		$data['footer_telephone'] = html_entity_decode($this->config->get('config_footer_telephone'), ENT_QUOTES, 'UTF-8');
		$data['email'] = html_entity_decode($this->config->get('config_email'), ENT_QUOTES, 'UTF-8');
		$data['wrapper'] = html_entity_decode($this->config->get('config_wrapper'), ENT_QUOTES, 'UTF-8');
		$data['geocode'] = $this->config->get('config_geocode');
		$data['geoname'] = $this->config->get('config_geoname');
		
		$this->load->model('catalog/information');

		$data['informations'] = array();

		foreach ($this->model_catalog_information->getInformations() as $result) {
			if ($result['bottom']) {
				$data['informations'][] = array(
					'title' => $result['title'],
					'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
				);
			}
		}
		
		//First Menu
		$this->load->model('catalog/category');
				
		$data['categories'] = array();
		
		//2 level category mexica
		
		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {
			if ($category['footer_category']) {	
				$data['categories'][] = array(
					'name'     => $category['name'],
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
			}
		}
		
		//Second Menu
		$this->load->model('design/custommenu_footer');
		
		$custommenus = $this->model_design_custommenu_footer->getcustommenus();
        $custommenu_child = $this->model_design_custommenu_footer->getChildcustommenus();

        foreach($custommenus as $id => $custommenu) {
			$children_data = array();
        
			foreach($custommenu_child as $child_id => $child_custommenu) {
                if (($custommenu['custommenu_id'] != $child_custommenu['custommenu_id']) or !is_numeric($child_id)) {
                    continue;
                }

                $child_name = '';

                if (($custommenu['custommenu_type'] == 'category') and ($child_custommenu['custommenu_type'] == 'category')){
                    $filter_data = array(
                        'filter_category_id'  => $child_custommenu['link'],
                        'filter_sub_category' => true
                    );

                    $child_name = ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : '');
                }

                $children_data[] = array(
                    'name' => $child_custommenu['name'] . $child_name,
                    'href' => $this->getcustommenuLink($custommenu, $child_custommenu)
                );
            }

			$data['custommenu'][] = array(
				'name'     => $custommenu['name'] ,
				'children' => $children_data,
				'column'   => $custommenu['columns'] ? $custommenu['columns'] : 1,
				'href'     => $this->getcustommenuLink($custommenu)
			);
        }

		$data['contact'] = $this->url->link('information/contact');
		$data['return'] = $this->url->link('account/return/add', '', true);
		$data['sitemap'] = $this->url->link('information/sitemap');
		$data['manufacturer'] = $this->url->link('product/manufacturer');
		$data['voucher'] = $this->url->link('account/voucher', '', true);
		$data['affiliate'] = $this->url->link('affiliate/account', '', true);
		$data['special'] = $this->url->link('product/special');
		$data['account'] = $this->url->link('account/account', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['newsletter'] = $this->url->link('account/newsletter', '', true);

		$data['powered'] = sprintf($this->language->get('text_powered'), $this->config->get('config_name'), date('Y', time()));

		// Whos Online
		if ($this->config->get('config_customer_online')) {
			$this->load->model('tool/online');

			if (isset($this->request->server['REMOTE_ADDR'])) {
				$ip = $this->request->server['REMOTE_ADDR'];
			} else {
				$ip = '';
			}

			if (isset($this->request->server['HTTP_HOST']) && isset($this->request->server['REQUEST_URI'])) {
				$url = 'http://' . $this->request->server['HTTP_HOST'] . $this->request->server['REQUEST_URI'];
			} else {
				$url = '';
			}

			if (isset($this->request->server['HTTP_REFERER'])) {
				$referer = $this->request->server['HTTP_REFERER'];
			} else {
				$referer = '';
			}

			$this->model_tool_online->addOnline($ip, $this->customer->getId(), $url, $referer);
		}

		return $this->load->view('common/footer', $data);
	}
	
	public function getcustommenuLink($parent, $child = null) {
		$item = empty($child) ? $parent : $child;

		switch ($item['custommenu_type']) {
			case 'category':
				$route = 'product/category';

				if (!empty($child)) {
					$args = 'path=' . $parent['link'] . '_' . $item['link'];
				} else {
					$args = 'path='.$item['link'];
				}
				break;
			case 'product':
				$route = 'product/product';
				$args = 'product_id='.$item['link'];
				break;
			case 'manufacturer':
				$route = 'product/manufacturer/info';
				$args = 'manufacturer_id='.$item['link'];
				break;
			case 'information':
				$route = 'information/information';
				$args = 'information_id='.$item['link'];
				break;
			default:
				$tmp = explode('&', str_replace('index.php?route=', '', $item['link']));

				if (!empty($tmp)) {
					$route = $tmp[0];
					unset($tmp[0]);
					$args = (!empty($tmp)) ? implode('&', $tmp) : '';
				}
				else {
					$route = $item['link'];
					$args = '';
				}

				break;
		}

		$check = stripos($item['link'], 'http');
		$checkbase = strpos($item['link'], '/');
		if ( $check === 0 || $checkbase === 0 ) {
			$link = $item['link'];
		} else {
			$link = $this->url->link($route, $args);
		}
		return $link;
	}

}
