<?php
class M_diagnosa extends CI_Model
{
    public function getHasilPenyakit($list_penyakit)
    {
        $array_hasil_penyakit = array();

        foreach ($list_penyakit as $id_penyakit => $nilai) {
            // $penyakit_temp = $this->tampilHP('kode_hp', $id_penyakit);
            $penyakit_temp = $this->db->get_where('hamapenyakit', ['kode_hp' => $id_penyakit])->row_array();
            $penyakit = array(
                'kode_hp' => $penyakit_temp['kode_hp'],
                'nama_hp' => $penyakit_temp['nama_hp'],
                'nama_latin' => $penyakit_temp['nama_latin'],
                'kategori' => $penyakit_temp['kategori'],
                'gambar' => $penyakit_temp['gambar'],
                'nilai_perhitungan' => number_format($nilai * 100, 2),
            );

            // * menambahkan penyakit ke array penyakit
            array_push($array_hasil_penyakit, $penyakit);
        }

        return $array_hasil_penyakit;
    }

    public function getHasilGejala($list_gejala)
    {

        $array_hasil_gejala = array();

        foreach ($list_gejala as $id_gejala => $id_kondisi) {
            if ($id_kondisi == 1) {
                $id_kondisi = "Sedikit Yakin";
            } elseif ($id_kondisi == 2) {
                $id_kondisi = "Cukup Yakin";
            } elseif ($id_kondisi == 3) {
                $id_kondisi = "Yakin";
            } elseif ($id_kondisi == 4) {
                $id_kondisi = "Sangat Yakin";
            }
            // $gejala_temp = $this->getGejala('id_gejala', $id_gejala);
            $gejala_temp = $this->db->get_where('gejala', ['kode_gejala' => $id_gejala])->row_array();
            $gejala = array(
                'kode_gejala' => $gejala_temp['kode_gejala'],
                'nama_gejala' => $gejala_temp['nama_gejala'],
                'nama_kondisi' => $id_kondisi,
            );

            // * menambahkan gejala ke array gejala
            array_push($array_hasil_gejala, $gejala);
        }

        return $array_hasil_gejala;
    }
}