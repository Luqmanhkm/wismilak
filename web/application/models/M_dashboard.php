<?php

class M_dashboard extends CI_model
{

    function jmlh_HP()
    {
        $this->db->select('*, COUNT(kode_hp) as total');
        $this->db->from('hamapenyakit');
        $hasil = $this->db->get();
        return $hasil;
    }


    function jmlh_gejala()
    {
        $this->db->select('*, COUNT(kode_gejala) as total');
        $this->db->from('gejala');
        $hasil = $this->db->get();
        return $hasil;
    }

    function jmlh_pengetahuan()
    {
        $this->db->select('*, COUNT(kode_pengetahuan) as total');
        $this->db->from('basis_pengetahuan');
        $hasil = $this->db->get();
        return $hasil;
    }

    function graph()
    {
        $this->db->select('*, COUNT(*) as total');
        $this->db->from('solusi');
        $this->db->group_by('kode_hp');
        $hasil = $this->db->get();
        return $hasil;
    }

    public function tampilHP()
    {
        $this->db->select('*');
        $this->db->from('hamapenyakit');
        $query = $this->db->get();
        return $query;
    }
}
