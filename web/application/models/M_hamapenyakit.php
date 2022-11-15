<?php
class M_hamapenyakit extends CI_Model
{
    public function tampilHP()
    {
        $this->db->select('*');
        $this->db->from('hamapenyakit');
        $query = $this->db->get();
        return $query;
    }

    public function tampilEditHP($id)
    {
        $this->db->select('*');
        $this->db->from('hamapenyakit');
        $this->db->where('kode_hp', $id);
        $query = $this->db->get();
        return $query;
    }

    public function tambahHP($data)
    {
        return $this->db->insert('hamapenyakit', $data);
    }

    public function updateHP($data, $id)
    {
        return $this->db->where('kode_hp', $id)->update('hamapenyakit', $data);
    }

    public function deleteHP($id)
    {
        $delete = $this->db->where('kode_hp', $id)->delete('solusi');
        $delete = $this->db->where('kode_hp', $id)->delete('hamapenyakit');
        return $delete;
    }

    public function kode()
    {
        $cd = $this->db->query("SELECT MAX(RIGHT(kode_hp,2)) AS kd_max FROM hamapenyakit");
        $kd = "";
        if ($cd->num_rows() > 0) {
            foreach ($cd->result() as $k) {
                $tmp = ((int)$k->kd_max) + 1;
                $kd = sprintf("%02s", $tmp);
            }
        } else {
            $kd = "01";
        }
        return "P" . $kd;
    }
}
