<?php

function cek_login()
{
    $login = get_instance();
    if (!$login->session->userdata('username')) {
        redirect('Auth');
    }
}
