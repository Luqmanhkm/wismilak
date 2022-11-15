<?php
class M_basispengetahuan extends CI_Model
{
    public function tampilBP()
    {
        $this->db->select('*');
        $this->db->from('basis_pengetahuan');
        $this->db->join('hamapenyakit', 'hamapenyakit.kode_hp=basis_pengetahuan.kode_hp');
        $this->db->join('gejala', 'gejala.kode_gejala=basis_pengetahuan.kode_gejala');
        $query = $this->db->get();
        return $query;
    }

    public function tampilHP()
    {
        $this->db->select('*');
        $this->db->from('hamapenyakit');
        $query = $this->db->get();
        return $query;
    }

    public function tampilGejala()
    {
        $this->db->select('*');
        $this->db->from('gejala');
        $query = $this->db->get();
        return $query;
    }

    public function tampilEditBP($id)
    {
        $this->db->select('*');
        $this->db->from('basis_pengetahuan');
        $this->db->join('hamapenyakit', 'hamapenyakit.kode_hp=basis_pengetahuan.kode_hp');
        $this->db->join('gejala', 'gejala.kode_gejala=basis_pengetahuan.kode_gejala');
        $this->db->where('basis_pengetahuan.kode_pengetahuan', $id);
        $query = $this->db->get();
        return $query;
    }

    public function tambahBP($data)
    {
        return $this->db->insert('basis_pengetahuan', $data);
    }

    public function updateBP($data, $id)
    {
        return $this->db->where('kode_pengetahuan', $id)->update('basis_pengetahuan', $data);
    }

    public function deleteBP($id)
    {
        return $this->db->where('kode_pengetahuan', $id)->delete('basis_pengetahuan');
    }

    public function kode()
    {
        $cd = $this->db->query("SELECT MAX(RIGHT(kode_pengetahuan,3)) AS kd_max FROM basis_pengetahuan");
        $kd = "";
        if ($cd->num_rows() > 0) {
            foreach ($cd->result() as $k) {
                $tmp = ((int)$k->kd_max) + 1;
                $kd = sprintf("%03s", $tmp);
            }
        } else {
            $kd = "001";
        }
        return "BP" . $kd;
    }
}
