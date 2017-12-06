<?php
class ControllerModuleCountdowntimer extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('module/countdowntimer');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('countdowntimer', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$data['heading_title'] = $this->language->get('heading_title');
    	$data['text_edit'] = $this->language->get('text_edit');

		$data['tab_product_settings'] = $this->language->get('tab_product_settings');
		$data['tab_category_settings'] = $this->language->get('tab_category_settings');
		$data['tab_help'] = $this->language->get('tab_help');

		$data['entry_show_in_product'] = $this->language->get('entry_show_in_product');
		$data['entry_show_in_category'] = $this->language->get('entry_show_in_category');

		$data['entry_text_timer'] = $this->language->get('entry_text_timer');
		$data['entry_text_timer_help'] = $this->language->get('entry_text_timer_help');
		$data['entry_countdays_timer'] = $this->language->get('entry_countdays_timer');
		$data['entry_countdays_timer_help'] = $this->language->get('entry_countdays_timer_help');
		$data['entry_days_timer'] = $this->language->get('entry_days_timer');
		$data['entry_sec_timer'] = $this->language->get('entry_sec_timer');

		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['text_description'] = $this->language->get('text_description');
		$data['text_help'] = $this->language->get('text_help');


		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		// Product
		if (isset($this->request->post['countdowntimer_product'])) {
			$data['countdowntimer_product'] = $this->request->post['countdowntimer_product'];
		} elseif ($this->config->get('countdowntimer_product')) {
			$data['countdowntimer_product'] = $this->config->get('countdowntimer_product');
		} else {
			$data['countdowntimer_product'] = 0;
		}

		if (isset($this->request->post['countdowntimer_product_texttimer'])) {
			$data['countdowntimer_product_texttimer'] = $this->request->post['countdowntimer_product_texttimer'];
		} elseif ($this->config->get('countdowntimer_product_texttimer')) {
			$data['countdowntimer_product_texttimer'] = $this->config->get('countdowntimer_product_texttimer');
		} else {
			$data['countdowntimer_product_texttimer'] = 0;
		}

		if (isset($this->request->post['countdowntimer_product_countdays'])) {
			$data['countdowntimer_product_countdays'] = $this->request->post['countdowntimer_product_countdays'];
		} elseif ($this->config->get('countdowntimer_product_countdays')) {
			$data['countdowntimer_product_countdays'] = $this->config->get('countdowntimer_product_countdays');
		} else {
			$data['countdowntimer_product_countdays'] = 0;
		}

		if (isset($this->request->post['countdowntimer_product_days'])) {
			$data['countdowntimer_product_days'] = $this->request->post['countdowntimer_product_days'];
		} elseif ($this->config->get('countdowntimer_product_days')) {
			$data['countdowntimer_product_days'] = $this->config->get('countdowntimer_product_days');
		} else {
			$data['countdowntimer_product_days'] = 0;
		}

		if (isset($this->request->post['countdowntimer_product_seconds'])) {
			$data['countdowntimer_product_seconds'] = $this->request->post['countdowntimer_product_seconds'];
		} elseif ($this->config->get('countdowntimer_product_seconds')) {
			$data['countdowntimer_product_seconds'] = $this->config->get('countdowntimer_product_seconds');
		} else {
			$data['countdowntimer_product_seconds'] = 0;
		}

		// Category

		if (isset($this->request->post['countdowntimer_category'])) {
			$data['countdowntimer_category'] = $this->request->post['countdowntimer_category'];
		} elseif ($this->config->get('countdowntimer_category')) {
			$data['countdowntimer_category'] = $this->config->get('countdowntimer_category');
		} else {
			$data['countdowntimer_category'] = 0;
		}

		if (isset($this->request->post['countdowntimer_category_texttimer'])) {
			$data['countdowntimer_category_texttimer'] = $this->request->post['countdowntimer_category_texttimer'];
		} elseif ($this->config->get('countdowntimer_category_texttimer')) {
			$data['countdowntimer_category_texttimer'] = $this->config->get('countdowntimer_category_texttimer');
		} else {
			$data['countdowntimer_category_texttimer'] = 0;
		}

		if (isset($this->request->post['countdowntimer_category_countdays'])) {
			$data['countdowntimer_category_countdays'] = $this->request->post['countdowntimer_category_countdays'];
		} elseif ($this->config->get('countdowntimer_category_countdays')) {
			$data['countdowntimer_category_countdays'] = $this->config->get('countdowntimer_category_countdays');
		} else {
			$data['countdowntimer_category_countdays'] = 0;
		}

		if (isset($this->request->post['countdowntimer_category_days'])) {
			$data['countdowntimer_category_days'] = $this->request->post['countdowntimer_category_days'];
		} elseif ($this->config->get('countdowntimer_category_days')) {
			$data['countdowntimer_category_days'] = $this->config->get('countdowntimer_category_days');
		} else {
			$data['countdowntimer_category_days'] = 0;
		}

		if (isset($this->request->post['countdowntimer_category_seconds'])) {
			$data['countdowntimer_category_seconds'] = $this->request->post['countdowntimer_category_seconds'];
		} elseif ($this->config->get('countdowntimer_category_seconds')) {
			$data['countdowntimer_category_seconds'] = $this->config->get('countdowntimer_category_seconds');
		} else {
			$data['countdowntimer_category_seconds'] = 0;
		}

		//============================================

 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

  		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/countdowntimer', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

		$data['action'] = $this->url->link('module/countdowntimer', 'token=' . $this->session->data['token'], 'SSL');

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');


		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/countdowntimer.tpl', $data));
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/countdowntimer')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
}
?>