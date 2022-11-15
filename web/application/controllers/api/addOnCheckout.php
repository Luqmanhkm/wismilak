<?php

defined('BASEPATH') or exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';

use Restserver\Libraries\REST_Controller;

class addOnCheckout extends REST_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->database();
    }

    public function index_post()
    {
        $kode_customer = $this->input->post('kode_customer');
        $no_nota = $this->input->post('no_nota');
        $salesman = $this->input->post('salesman');
        $void_status = 0;
        $checkNota = $this->db->query("SELECT * FROM checkout WHERE no_nota = '$no_nota'")->num_rows();

        if ($no_nota == '' || $checkNota != 0) {
            $this->response([
                'status' => FALSE,
                'message' => 'Fail Checkout 1!'
            ], REST_Controller::HTTP_BAD_REQUEST);
        } else {
            $checkKode = $this->db->query("SELECT MAX(kode_checkout) AS kd_checkout FROM checkout")->row();
            $urutan = (int) substr($checkKode->kd_checkout, 0);
            $urutan++;
            if ($this->db->query("INSERT INTO checkout (kode_checkout, kode_customer, no_nota, salesman, void_status) VALUES ('$urutan', '$kode_customer', '$no_nota', '$salesman', '$void_status')")) {
                //insert detail
                $checkKode2 = $this->db->query("SELECT MAX(kode_checkout) AS kd_checkout FROM checkout")->row();
                $this->db->query("INSERT INTO detail_checkout (kode_checkout, kode_product, qty, price, subtotal)
                              SELECT '$checkKode2->kd_checkout', kode_product, qty, price, subtotal FROM tempproduct WHERE kode_customer = '$kode_customer'");

                //update stock              
                $this->db->query("UPDATE P SET P.stock = P.stock - T.qty FROM product P INNER JOIN
                                  tempproduct T ON P.kode_product = T.kode_product
                                  WHERE P.kode_product IN (SELECT kode_product FROM tempproduct WHERE kode_customer = '$kode_customer')");

                //delete temp
                $this->db->query("DELETE tempproduct WHERE kode_customer = '$kode_customer'");

                $this->response([
                    'status' => TRUE,
                    'message' => 'Success Checkout!'
                ], REST_Controller::HTTP_OK);
            } else {
                $this->response([
                    'status' => FALSE,
                    'message' => 'Fail Checkout 2!'
                ], REST_Controller::HTTP_BAD_REQUEST);
            }
        }
    }
}