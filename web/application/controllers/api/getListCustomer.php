<?php

defined('BASEPATH') or exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';

use Restserver\Libraries\REST_Controller;

class getListCustomer extends REST_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->database();
    }

    public function index_get()
    {
        $data = $this->db->query("SELECT * FROM customer")->result_array();
        $this->response([
            'status' => TRUE,
            'data' => $data
        ], REST_Controller::HTTP_OK);
    }
}