<?php
// Sambungkan ke database
include '../../config.php';

// Query untuk mengambil data suplier
$query = "SELECT * FROM suplier";
$result = $connect->query($query);

// Buat variabel untuk menyimpan opsi suplier
$options = "";

// Loop melalui hasil query dan tambahkan opsi suplier
while ($row = $result->fetch_assoc()) {
    $options .= "<option value='" . $row['id_suplier'] . "'>" . $row['nama_suplier'] . "</option>";
}

// Kembalikan opsi suplier dalam format HTML
echo $options;
?>
