<?php

defined('BASEPATH') or exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';

use Restserver\Libraries\REST_Controller;

class addOnTemp extends REST_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->database();
    }

    public function index_post()
    {
        $kode_product = $this->input->post('kode_product');
        $qty = $this->input->post('qty');
        $price = $this->input->post('price');
        $subtotal = $this->input->post('subtotal');

        if ($kode_product == '') {
            $this->response([
                'status' => FALSE,
                'message' => 'Fail Add Product!'
            ], REST_Controller::HTTP_BAD_REQUEST);
        } else {
            $this->db->query("INSERT INTO tempproduct (kode_product, qty, price, subtotal) VALUES ('$kode_product', '$qty', '$price', '$subtotal')");
            $this->response([
                'status' => TRUE,
                'message' => 'Success Add Product!'
            ], REST_Controller::HTTP_OK);
        }
    }
}