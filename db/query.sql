DROP VIEW IF EXISTS dat_obat; 
CREATE VIEW dat_obat AS 
SELECT `kode`,`nama`,`suplierid`,`kategori`,`satuan`,`beli`,`jual`,`expired`,`stok` 
FROM tb_obat WHERE STATUS='aktif'; 

DROP VIEW IF EXISTS data_obat; 
CREATE VIEW data_obat AS 
SELECT `kode`,`nama`,`suplierid`,`kategori`,`satuan`,`beli`,`jual`,`expired`,`stok` 
FROM tb_obat; 

UPDATE tb_obat SET STATUS='aktif'; 

DROP VIEW IF EXISTS expire; 
CREATE VIEW expire AS 
SELECT 
  `tb_obat`.`kode` AS `kode`,
  `tb_obat`.`merk` AS `merk`,
  `tb_obat`.`nama` AS `nama`,
  `tb_obat`.`suplierid` AS `suplierid`,
  `tb_obat`.`kategori` AS `kategori`,
  `tb_obat`.`satuan` AS `satuan`,
  `tb_obat`.`beli` AS `beli`,
  `tb_obat`.`jual` AS `jual`,
  `tb_obat`.`expired` AS `expired`,
  `tb_obat`.`stok` AS `stok`,
  `tb_obat`.`status` AS `STATUS`,
  `tb_obat`.`edit` AS `edit`,
  (TO_DAYS(CURDATE()) - TO_DAYS(`db_apotek`.`tb_obat`.`expired`)) AS `selisih`,
  CURDATE() AS `tgl_sekarang`
FROM `tb_obat` WHERE STATUS='aktif'; 

-- Anda tidak perlu DROP VIEW expire karena Anda membuatnya sebelumnya

-- Selanjutnya Anda dapat melanjutkan dengan query-query lainnya

SELECT * FROM data_obat;
