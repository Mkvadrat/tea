<?php
class ControllerInformationNews extends Controller {
	public function index(){
		$this->load->language('information/news');

		$this->load->model('catalog/news');

		$this->load->model('tool/image');

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'n.date_added';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'DESC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		if (isset($this->request->get['limit'])) {
			$limit = (int)$this->request->get['limit'];
		} else {
			$limit = $this->config->get($this->config->get('config_theme') . '_product_limit');
		}

		$this->document->setTitle($this->language->get('heading_title'));

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_empty'] = $this->language->get('text_empty');

		$data['button_continue'] = $this->language->get('button_continue');
		$data['continue'] = $this->url->link('common/home');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home'),
			'separator' => $this->language->get('text_separator')
		);

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		if (isset($this->request->get['limit'])) {
			$url .= '&limit=' . $this->request->get['limit'];
		}

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('information/news', $url),
			'separator' => $this->language->get('text_separator')
		);

		$filter_data = array(
			'sort' => $sort,
			'order' => $order,
			'start' => ($page - 1) * $limit,
			'limit' => $limit
		);

		$news_total = $this->model_catalog_news->getTotalNews();
		$news_list = $this->model_catalog_news->getNews($filter_data);
		
		$news_setting = array();

		if ($this->config->get('news_setting')) {
			$news_setting = $this->config->get('news_setting');
		}else{
			$news_setting['description_limit'] = '300';
			$news_setting['news_thumb_width'] = '220';
			$news_setting['news_thumb_height'] = '220';
		}
		
		$data['description_blog'] = html_entity_decode($news_setting['description_blog'], ENT_QUOTES, 'UTF-8');
			
		$data['seo_blog'] = html_entity_decode($news_setting['seo_blog'], ENT_QUOTES, 'UTF-8');
		
		$data['news_list'] = array();
		
		if ($news_list) {

			$this->document->setTitle($this->language->get('heading_title'));

			$data['heading_title'] = $this->language->get('heading_title');
			$data['text_empty'] = $this->language->get('text_empty');

			$data['button_grid'] = $this->language->get('button_grid');
			$data['button_list'] = $this->language->get('button_list');

            /*mmr*/
            $data['moneymaker2_catalog_default_view'] = $this->config->get('moneymaker2_catalog_layout_default');
            $data['moneymaker2_catalog_layout_switcher_hide'] = $this->config->get('moneymaker2_catalog_layout_switcher_hide');
            /*mmr*/

			$data['text_sort'] = $this->language->get('text_sort');
			$data['text_limit'] = $this->language->get('text_limit');

			$data['text_more'] = $this->language->get('text_more');

			foreach ($news_list as $result) {

				if($result['image']){
					$image = $this->model_tool_image->resize($result['image'], $news_setting['news_thumb_width'], $news_setting['news_thumb_height']);
				}else{
					$image = $this->model_tool_image->resize('placeholder.png', $news_setting['news_thumb_width'], $news_setting['news_thumb_height']);
				}

				$data['news_list'][] = array(
					'title' => $result['title'],
					'thumb' => $image,
					'viewed' => sprintf($this->language->get('text_viewed'), $result['viewed']),
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $news_setting['description_limit']) . '...',
					'href' => $this->url->link('information/news/info', 'news_id=' . $result['news_id']),
					'posted' => date($this->language->get('date_format_short'), strtotime($result['date_added']))
				);
			}

		}

		$url = '';

		if (isset($this->request->get['limit'])) {
			$url .= '&limit=' . $this->request->get['limit'];
		}

		$data['sorts'] = array();

		$data['sorts'][] = array(
			'text' => $this->language->get('text_title_asc'),
			'value' => 'nd.title-ASC',
			'href' => $this->url->link('information/news', 'sort=nd.title&order=ASC' . $url)
		);

		$data['sorts'][] = array(
			'text' => $this->language->get('text_title_desc'),
			'value' => 'nd.title-DESC',
			'href' => $this->url->link('information/news', 'sort=nd.title&order=DESC' . $url)
		);

		$data['sorts'][] = array(
			'text' => $this->language->get('text_date_asc'),
			'value' => 'n.date_added-ASC',
			'href' => $this->url->link('information/news', 'sort=n.date_added&order=ASC' . $url)
		);

		$data['sorts'][] = array(
			'text' => $this->language->get('text_date_desc'),
			'value' => 'n.date_added-DESC',
			'href' => $this->url->link('information/news', 'sort=n.date_added&order=DESC' . $url)
		);		

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
		
		$data['limits'] = array();

		$limits = array_unique(array($this->config->get($this->config->get('config_theme') . '_product_limit'), 25, 50, 75, 100));

		sort($limits);

		foreach ($limits as $value) {
			$data['limits'][] = array(
				'text' => $value,
				'value' => $value,
				'href' => $this->url->link('information/news', $url . '&limit=' . $value)
			);
		}

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['limit'])) {
			$url .= '&limit=' . $this->request->get['limit'];
		}		

		$pagination = new Pagination();
		$pagination->total = $news_total;
		$pagination->page = $page;
		$pagination->limit = $limit;
		$pagination->url = $this->url->link('information/news', $url . '&page={page}');

		$data['pagination'] = $pagination->render();
		$data['results'] = sprintf($this->language->get('text_pagination'), ($news_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($news_total - $limit)) ? $news_total : ((($page - 1) * $limit) + $limit), $news_total, ceil($news_total / $limit));

		// http://googlewebmastercentral.blogspot.com/2011/09/pagination-with-relnext-and-relprev.html
		if ($page == 1) {
			$this->document->addLink($this->url->link('information/news', '', true), 'canonical');
		} elseif ($page == 2) {
			$this->document->addLink($this->url->link('information/news', '', true), 'prev');
		} else {
			$this->document->addLink($this->url->link('information/news', '&page=' . ($page - 1), true), 'prev');
		}

		if ($limit && ceil($news_total / $limit) > $page) {
			$this->document->addLink($this->url->link('information/news', '&page=' . ($page + 1), true), 'next');
		}

		$data['sort'] = $sort;
		$data['order'] = $order;
		$data['limit'] = $limit;

		$data['continue'] = $this->url->link('common/home');

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('information/news_list', $data));
	}

	public function info(){
		$this->language->load('information/news');

		$this->load->model('catalog/news');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'href' => $this->url->link('common/home'),
			'text' => $this->language->get('text_home'),
			'separator' => $this->language->get('text_separator')
		);

		$data['breadcrumbs'][] = array(
			'href' => $this->url->link('information/news'),
			'text' => $this->language->get('heading_title'),
			'separator' => $this->language->get('text_separator')
		);

		if (isset($this->request->get['news_id'])) {
			$news_id = $this->request->get['news_id'];
		} else {
			$news_id = 0;
		}

		$news_info = $this->model_catalog_news->getNewsStory($this->request->get['news_id']);

		if ($news_info) {

			$this->document->addScript('catalog/view/javascript/jquery/magnific/jquery.magnific-popup.min.js');
			$this->document->addStyle('catalog/view/javascript/jquery/magnific/magnific-popup.css');

			if ($news_info['meta_title']) {
				$this->document->setTitle($news_info['meta_title']);
			} else {
				$this->document->setTitle($news_info['title']);
			}

			$this->document->setDescription($news_info['meta_description']);
			$this->document->setKeywords($news_info['meta_keyword']);

			if ($news_info['meta_h1']) {
				$data['heading_title'] = $news_info['meta_h1'];
			} else {
				$data['heading_title'] = $news_info['title'];
			}

			$data['breadcrumbs'][] = array(
				'text' => $news_info['title'],
				'href' => $this->url->link('information/news/info', 'news_id=' . $news_id),
				'separator' => $this->language->get('text_separator')
			);

			$this->document->addLink($this->url->link('information/news', 'news_id=' . $this->request->get['news_id']),
				'canonical');

			$data['description'] = html_entity_decode($news_info['description']);
			$data['sub_title'] = html_entity_decode($news_info['sub_title']);

			$data['viewed'] = sprintf($this->language->get('text_viewed'), $news_info['viewed']);
			$data['posted'] = date($this->language->get('date_format_short'), strtotime($news_info['date_added']));

			if ($this->config->get('news_setting')) {
				$news_setting = $this->config->get('news_setting');
			}else{
				$news_setting['news_thumb_width']  = '220';
				$news_setting['news_thumb_height'] = '220';
				$news_setting['news_popup_width']  = '560';
				$news_setting['news_popup_height'] = '560';
			}

			if(isset($news_setting['news_share'])){
				$data['news_share'] = $news_setting['news_share'];
			}else{
				$data['news_share'] = false;
			}

			$this->load->model('tool/image');

			if ($news_info['image']) {
				$data['image'] = true;
			} else {
				$data['image'] = false;
			}
			if($news_info['image']){
				$data['thumb'] = $this->model_tool_image->resize($news_info['image'], $news_setting['news_thumb_width'],
				$news_setting['news_thumb_height']);
				$data['popup'] = $this->model_tool_image->resize($news_info['image'], $news_setting['news_popup_width'],
				$news_setting['news_popup_height']);
			}else{
				$data['thumb'] = false;
				$data['popup'] = false;
			}

			$data['button_news'] = $this->language->get('button_news');
			$data['button_continue'] = $this->language->get('button_continue');

			$data['news_list'] = $this->url->link('information/news');
			$data['continue'] = $this->url->link('common/home');

			if (isset($_SERVER['HTTP_REFERER'])) {
				$data['referred'] = $_SERVER['HTTP_REFERER'];
			}

			$data['refreshed'] = 'http://' . $_SERVER['HTTP_HOST'] . '' . $_SERVER['REQUEST_URI'];

			if (isset($data['referred'])) {
				$this->model_catalog_news->updateViewed($this->request->get['news_id']);
			}

			$data['description'] = html_entity_decode($news_info['description'], ENT_QUOTES, 'UTF-8');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('information/news', $data));
		}else{
			$this->document->setTitle($this->language->get('error_page'));
			
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('information/error_news', $data));
		}
	}
}