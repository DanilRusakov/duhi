<?php
class ModelExtensionTotalSubTotal extends Model {
	public function getTotal($total) {
		$this->load->language('extension/total/sub_total');

		$sub_total = $this->cart->getSubTotal();

		if (!empty($this->session->data['vouchers'])) {
			foreach ($this->session->data['vouchers'] as $voucher) {
				$sub_total += $voucher['amount'];
			}
		}

		$total['totals'][] = array(
			'code'       => 'sub_total',
			'title'      => $this->language->get('text_sub_total'),
			'value'      => $sub_total,
			'sort_order' => $this->config->get('sub_total_sort_order')
		);
        
        $discount_total = $this->cart->getDiscountTotal();
        
        if ($discount_total) {
        $total['totals'][] = array(
            'code'       => 'discount_total',
            'title'      => $this->language->get('discount_total'),
            'value'      => $discount_total,
            'sort_order' => $this->config->get('sub_total_sort_order') + 0.5
        );
        }

		$total['total'] += $sub_total;
	}
}
