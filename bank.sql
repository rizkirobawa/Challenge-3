-- Create Database
CREATE Database bank_challenge3;

-- Create Table nasabah
CREATE Table nasabah (
    id BIGSERIAL PRIMARY KEY,
    no_ktp VARCHAR(20) UNIQUE NOT NULL, 
    nama_depan VARCHAR(50) NOT NULL, 
    nama_belakang VARCHAR(50) NOT NULL,
    no_telepon VARCHAR(20) NOT NULL, 
    jenis_kelamin VARCHAR(10) NOT NULL, 
    alamat TEXT NOT NULL, 
    nama_ibu_kandung VARCHAR(100) NOT NULL
);

-- Create Table akun
CREATE Table akun (
    id BIGSERIAL PRIMARY KEY, 
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    no_rekening VARCHAR(20) UNIQUE NOT NULL,
    pin VARCHAR(6) NOT NULL,
    saldo DECIMAL(15, 2) NOT NULL,
    nasabah_id INT NOT NULL
);

-- Create Table transaksi
CREATE Table transaksi (
    id BIGSERIAL PRIMARY KEY,
    tanggal DATE NOT NULL, 
    no_rekening_tujuan VARCHAR(20) NOT NULL, 
    jumlah DECIMAL(15,2) NOT NULL, 
    berita VARCHAR(50) NOT NULL,
    akun_id INT NOT NULL
);