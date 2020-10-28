<?php
class ControllerExtensionPaymentPaynet extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/payment/paynet');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('paynet', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=payment', true));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_all_zones'] = $this->language->get('text_all_zones');
		$data['text_true'] = $this->language->get('text_true');
		$data['text_false'] = $this->language->get('text_false');

		$data['entry_paynet_code'] = $this->language->get('entry_paynet_code');
		$data['entry_paynet_user'] = $this->language->get('entry_paynet_user'); // entry_login
		$data['entry_paynet_user_pass'] = $this->language->get('entry_paynet_user_pass');
		$data['entry_paynet_sec_key'] = $this->language->get('entry_paynet_sec_key'); // entry_key
		$data['entry_paynet_mode'] = $this->language->get('entry_paynet_mode'); // method

		$data['entry_total'] = $this->language->get('entry_total');
		$data['entry_order_status'] = $this->language->get('entry_order_status');
		$data['entry_geo_zone'] = $this->language->get('entry_geo_zone');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');

		$data['help_total'] = $this->language->get('help_total');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['error_user'])) {
			$data['error_user'] = $this->error['error_user'];
		} else {
			$data['error_user'] = '';
		}

		if (isset($this->error['user_pass'])) {
			$data['error_user_pass'] = $this->error['error_user_pass'];
		} else {
			$data['error_user_pass'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=payment', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/payment/paynet', 'token=' . $this->session->data['token'], true)
		);

		$data['action'] = $this->url->link('extension/payment/paynet', 'token=' . $this->session->data['token'], true);
		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=payment', true);

		if (isset($this->request->post['paynet_code'])) {
			$data['paynet_code'] = $this->request->post['paynet_code'];
		} else {
			$data['paynet_code'] = $this->config->get('paynet_code');
		}

		if (isset($this->request->post['paynet_user'])) {
			$data['paynet_user'] = $this->request->post['paynet_user'];
		} else {
			$data['paynet_user'] = $this->config->get('paynet_user');
		}

		if (isset($this->request->post['paynet_user_pass'])) {
			$data['paynet_user_pass'] = $this->request->post['paynet_user_pass'];
		} else {
			$data['paynet_user_pass'] = $this->config->get('paynet_user_pass');
		}

		if (isset($this->request->post['paynet_sec_key'])) {
			$data['paynet_sec_key'] = $this->request->post['paynet_sec_key'];
		} else {
			$data['paynet_sec_key'] = $this->config->get('paynet_sec_key');
		}

		if (isset($this->request->post['paynet_mode'])) {
			$data['paynet_mode'] = $this->request->post['paynet_mode'];
		} else {
			$data['paynet_mode'] = $this->config->get('paynet_mode');
		}

		if (isset($this->request->post['paynet_total'])) {
			$data['paynet_total'] = $this->request->post['paynet_total'];
		} else {
			$data['paynet_total'] = $this->config->get('paynet_total');
		}

		if (isset($this->request->post['paynet_order_status_id'])) {
			$data['paynet_order_status_id'] = $this->request->post['paynet_order_status_id'];
		} else {
			$data['paynet_order_status_id'] = $this->config->get('paynet_order_status_id');
		}

		$this->load->model('localisation/order_status');

		$data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

		if (isset($this->request->post['paynet_geo_zone_id'])) {
			$data['paynet_geo_zone_id'] = $this->request->post['paynet_geo_zone_id'];
		} else {
			$data['paynet_geo_zone_id'] = $this->config->get('paynet_geo_zone_id');
		}

		$this->load->model('localisation/geo_zone');

		$data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();

		if (isset($this->request->post['paynet_status'])) {
			$data['paynet_status'] = $this->request->post['paynet_status'];
		} else {
			$data['paynet_status'] = $this->config->get('paynet_status');
		}

		if (isset($this->request->post['paynet_sort_order'])) {
			$data['paynet_sort_order'] = $this->request->post['paynet_sort_order'];
		} else {
			$data['paynet_sort_order'] = $this->config->get('paynet_sort_order');
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/payment/paynet', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/payment/paynet')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->request->post['paynet_user']) {
			$this->error['error_user'] = $this->language->get('error_user');
		}

		if (!$this->request->post['paynet_user_pass']) {
			$this->error['error_user_pass'] = $this->language->get('error_user_pass');
		}

		return !$this->error;
	}
}
