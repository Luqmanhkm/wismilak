<?php

defined('BASEPATH') or exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';

use Restserver\Libraries\REST_Controller;

class getListTemp extends REST_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->database();
    }

    public function index_get()
    {
        $kode_customer = $this->input->get('kode_customer');
        if ($kode_customer == '') {
            $this->response([
                'status' => false,
                'message' => 'No Data'
            ], REST_Controller::HTTP_BAD_REQUEST);
        } else {
            $checkData = $this->db->query("SELECT * FROM tempproduct WHERE kode_customer = '$kode_customer'")->num_rows();
            if ($checkData == 0) {
                $this->response([
                    'status' => false,
                    'message' => 'No Data'
                ], REST_Controller::HTTP_BAD_REQUEST);
            } else {
                $data = $this->db->query("SELECT * FROM tempproduct WHERE kode_customer = '$kode_customer'")->result_array();
                $this->response([
                    'status' => true,
                    'data' => $data
                ], REST_Controller::HTTP_OK);
            }
        }
    }
}