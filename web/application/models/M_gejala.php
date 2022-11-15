<?php
class M_gejala extends CI_Model
{
    public function tampilGejala()
    {
        $this->db->select('*');
        $this->db->from('gejala');
        $query = $this->db->get();
        return $query;
    }

    public function tampilEditGejala($id)
    {
        $this->db->select('*');
        $this->db->from('gejala');
        $this->db->where('kode_gejala', $id);
        $query = $this->db->get();
        return $query;
    }

    public function tambahGejala($data)
    {
        return $this->db->insert('gejala', $data);
    }

    public function updateGejala($data, $id)
    {
        return $this->db->where('kode_gejala', $id)->update('gejala', $data);
    }

    public function deleteGejala($id)
    {
        return $this->db->where('kode_gejala', $id)->delete('gejala');
    }

    public function kode()
    {
        $cd = $this->db->query("SELECT MAX(RIGHT(kode_gejala,3)) AS kd_max FROM gejala");
        $kd = "";
        if ($cd->num_rows() > 0) {
            foreach ($cd->result() as $k) {
                $tmp = ((int)$k->kd_max) + 1;
                $kd = sprintf("%03s", $tmp);
            }
        } else {
            $kd = "001";
        }
        return "G" . $kd;
    }
}
