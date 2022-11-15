<?php
class M_solusi extends CI_Model
{
    public function tampilSolusi()
    {
        $this->db->select('hamapenyakit.nama_hp, hamapenyakit.kategori, solusi.slug');
        $this->db->distinct();
        $this->db->from('solusi');
        $this->db->join('hamapenyakit', 'hamapenyakit.kode_hp=solusi.kode_hp');
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

    public function tampilEditSolusi($id)
    {
        $this->db->select('*');
        $this->db->from('solusi');
        $this->db->join('hamapenyakit', 'hamapenyakit.kode_hp=solusi.kode_hp');
        $this->db->where('solusi.slug', $id);
        $query = $this->db->get();
        return $query;
    }

    public function tambahSolusi($data)
    {
        $this->db->insert_batch('solusi', $data);
        // $this->db->insert_batch('detail_solusi', $data1);
        if ($this->db->trans_status() === FALSE) {
            return "Query Failed";
        } else {
            return "yeay"; // do whatever you want to do on query success
        }
    }

    public function updateSolusi($data)
    {
        return $this->db->where('kode_solusi')->update_batch('solusi', $data);
    }

    public function deleteSolusi($id)
    {
        return $this->db->where('slug', $id)->delete('solusi');
    }

    public function kode()
    {
        $cd = $this->db->query("SELECT MAX(RIGHT(slug,3)) AS kd_max FROM solusi");
        $kd = "";
        if ($cd->num_rows() > 0) {
            foreach ($cd->result() as $k) {
                $tmp = ((int)$k->kd_max) + 1;
                $kd = sprintf("%03s", $tmp);
            }
        } else {
            $kd = "001";
        }
        return "S" . $kd;
    }
}
