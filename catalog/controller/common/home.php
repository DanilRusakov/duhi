<?php
class ControllerCommonHome extends Controller {
	public function index() {
		$this->document->setTitle($this->config->get('config_meta_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));

		if (isset($this->request->get['route'])) {
			$this->document->addLink($this->config->get('config_url'), 'canonical');
		}
        
        $this->load->language('common/home');
        
        $data['text_tax'] = $this->language->get('text_tax');

        $data['button_cart'] = $this->language->get('button_cart');
        $data['button_wishlist'] = $this->language->get('button_wishlist');
        $data['button_compare'] = $this->language->get('button_compare');
        
        $this->load->model('catalog/category');

        $this->load->model('catalog/product');
        
        $this->load->model('tool/image');
        
        $data['categories'] = array();
        
        $config_teaser_order_count = (int)$this->config->get('config_teaser_order_count');
        $now_day = date("j");
        
        if ($now_day < 10) {
            $plus_count = $now_day*10;
        } else {
            $plus_count = ($now_day*10)/2;
        }
        
        if ($now_day%2 && $plus_count < $config_teaser_order_count){
            $config_teaser_order_count -= $plus_count;
        } else {
            $config_teaser_order_count += $plus_count;
        }
        
        $config_teaser_order_count = round(($config_teaser_order_count/1440)*((date('G')*60)+(int)date('i')));
        
        $data['config_teaser_status'] = $this->config->get('config_teaser_status');
        $data['config_teaser_datetime'] = ($this->config->get('config_teaser_datetime')) ? strtotime($this->config->get('config_teaser_datetime') . ':00') : 0;
        $data['config_teaser_order_count'] = $config_teaser_order_count;
        $data['config_catalog_status'] = $this->config->get('config_catalog_status');
        
        if ($this->config->get('config_catalog_status')) {
            $data['config_catalog_menu_status'] = $this->config->get('config_catalog_menu_status');
            
            $categories = $this->model_catalog_category->getCategories(0);

            foreach ($categories as $category) {
                $filter_data = array(
                    'filter_category_id'  => $category['category_id'],
                    // 'start'               => '0',
                    // 'limit'               => '4'
                );
                
                $product_count = 0;
                if ($this->config->get('config_catalog_menu_status')) {
                    $product_count = $this->model_catalog_product->getTotalProducts($filter_data);
                }
                
                $products = array();
                
                $results = $this->model_catalog_product->getProducts($filter_data);
                
                if ($results) {
                    
                    foreach ($results as $result) {
                        if ($result['image']) {
                            $image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
                        } else {
                            $image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
                        }

                        if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
                            $price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                            $product_clear_price = $result['price'];
                        } else {
                            $price = false;
                            $product_clear_price = false;
                        }

                        if ((float)$result['special']) {
                            $special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                            $product_clear_special = $result['special'];
                        } else {
                            $special = false;
                            $product_clear_special = false;
                        }
                        
                        $special_percent = 0;
                        if ($product_clear_special) {
                            $special_percent = round(100-(($product_clear_special*100)/$product_clear_price));
                        }

                        if ($this->config->get('config_tax')) {
                            $tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price'], $this->session->data['currency']);
                        } else {
                            $tax = false;
                        }

                        if ($this->config->get('config_review_status')) {
                            $rating = $result['rating'];
                        } else {
                            $rating = false;
                        }
                        
                        $options = $this->model_catalog_product->getProductOptions($result['product_id']);
                        
                        $min_price = 0;
                        $max_price = 0;
                        
                        foreach ($options as $option) {
                            foreach ($option['product_option_value'] as $option_value) {
                                if ($product_clear_price && $option_value['price']) {
                                    if ($option_value['price_prefix'] == '+') {
                                        $product_option_clear_price = ($product_clear_price+$option_value['price']);
                                    } else {
                                        $product_option_clear_price = ($product_clear_price-$option_value['price']);
                                    }
                                } else {
                                    $product_option_clear_price = false;
                                }
                                
                                if ($product_clear_special && $option_value['price']) {
                                    if ($option_value['price_prefix'] == '+') {
                                        $product_option_clear_special = ($product_clear_special+$option_value['price']);
                                    } else {
                                        $product_option_clear_special = ($product_clear_special-$option_value['price']);
                                    }
                                } else {
                                    $product_option_clear_special = false;
                                }
                                
                                if ($product_option_clear_special) {
                                    $product_option_clear_price = $product_option_clear_special;
                                }
                                
                                if (!$min_price || ($product_option_clear_price && $product_option_clear_price < $min_price)) {
                                    $min_price = $product_option_clear_price;
                                }
                                
                                if (!$max_price || ($product_option_clear_price && $product_option_clear_price > $max_price)) {
                                    $max_price = $product_option_clear_price;
                                }
                            }
                        }
                        
                        if ($min_price) {
                            $min_price = $this->currency->format($this->tax->calculate($min_price, $result['tax_class_id'], $this->config->get('config_tax') ? 'P' : false), $this->session->data['currency']);
                        }
                        
                        if ($max_price) {
                            $max_price = $this->currency->format($this->tax->calculate($max_price, $result['tax_class_id'], $this->config->get('config_tax') ? 'P' : false), $this->session->data['currency']);
                        }

                        $products[] = array(
                            'product_id'  => $result['product_id'],
                            'thumb'       => $image,
                            'name'        => $result['name'],
                            'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
                            'price'       => $price,
                            'min_price'   => $min_price,
                            'max_price'   => $max_price,
                            'special'     => $special,
                            'percent'     => $special_percent,
                            'tax'         => $tax,
                            'rating'      => $rating,
                            'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'])
                        );
                    }
                
                    $data['categories'][] = array(
                        'category_id'   => $category['category_id'],
                        'name'          => $category['name'],
                        'description'   => html_entity_decode($category['description']),
                        'product_count' => $product_count,
                        'products'      => $products,
                        'href'          => $this->url->link('product/category', 'path=' . $category['category_id'])
                    );
                }
            }
        }

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('common/home', $data));
	}
}
