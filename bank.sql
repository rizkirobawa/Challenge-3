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

-- 1) Create
-- Insert Values Into Table nasabah
INSERT INTO nasabah (no_ktp, nama_depan, nama_belakang, no_telepon, jenis_kelamin, alamat, nama_ibu_kandung) 
VALUES 
('3578012412020001', 'Rizki', 'Robawa', '0821345563145', 'Laki-laki', 'Jl. Mbraon nguling IX/ T - 19', ' Siti Aminah'), 
('1234567890', 'John', 'Doe', '123456789', 'Laki-laki', 'Jl. Estreet No. 1', 'Jane Doe'),
('9876543210', 'Jane', 'Doe', '987654321', 'Perempuan', 'Jl. Neraka No. 2', 'John Doe'),
('5432167890', 'Alice', 'Smith', '555123456', 'Perempuan', 'Jl. Surga No. 3', 'Robert Smith'),
('9876543211', 'Bob', 'Johnson', '555987654', 'Laki-laki', 'Jl. Kemenangan No. 4', 'Sarah Johnson'),
('1234567891', 'Emma', 'Brown', '555111222', 'Perempuan', 'Jl. Chicago No. 5', 'Michael Brown');



-- Insert Values Into Table akun
INSERT INTO akun (username, password, email, no_rekening, pin, saldo, nasabah_id)
VALUES
('rizki_robawa', 'password4684', 'rizkirobawa@gmail.com', '81274814217473', '123456', 10000000.00,1),
('john_doe', 'password123', 'johndoe@example.com', '1234567890123456', '123456', 10000000.00, 2),
('jane_smith', 'password456', 'janesmith@example.com', '9876543210987654', '567812', 25000000.00, 3),
('alice_wonder', 'password789', 'alice@example.com', '5555555555555555', '987623', 20000000.00, 4),
('bob_builder', 'passwordabc', 'bob@example.com', '1111111111111111', '246844', 15000000.00, 5),
('eve_madam', 'passwordev', 'eve@example.com', '125162742727272757', '135712', 13000000.00, 6),
('robawa_rizki', 'ddn123456', 'rizkysetylarln@gmail.com', '33315151358913', '435621', 7500000.00, 1);

-- Insert Values Into Table transaksi
INSERT INTO transaksi (tanggal, no_rekening_tujuan, jumlah, berita, akun_id)
VALUES
('2024-01-01', '9876543210987654', 200000.00, 'Pembayaran tagihan', 2),
('2024-01-02', '5555555555555555', 100000.00, 'Pengiriman uang kepada teman', 3),
('2024-01-03', '1111111111111111', 300000.00, 'Pembelian barang', 4),
('2024-01-04', '9999999999999999', 500000.00, 'Pengiriman uang kepada keluarga', 5),
('2024-01-05', '1234567890123456', 400000.00, 'Penarikan tunai', 6),
('2024-01-06', '1234567890123456', 100000.00, 'Pembayaran tagihan', 6),
('2024-01-07', '9876543210987654', 150000.00, 'Pengiriman uang kepada saudara', 2),
('2024-01-08', '5555555555555555', 200000.00, 'Pembelian makanan', 3),
('2024-01-09', '1111111111111111', 250000.00, 'Pembelian tiket', 4),
('2024-01-10', '9999999999999999', 350000.00, 'Pembayaran tagihan listrik', 5),
('2024-01-11', '1234567890123456', 600000.00, 'Transfer ke akun lain', 6),
('2024-01-12', '1234567890123456', 700000.00, 'Transfer ke akun lain', 6),
('2024-01-13', '9876543210987654', 250000.00, 'Pembayaran tagihan telepon', 2),
('2024-01-14', '5555555555555555', 150000.00, 'Pengiriman uang kepada teman', 3),
('2024-01-14', '5555555555555555', 1500000.00, 'Pembelian tiket konser', 1),
('2024-01-14', '1344815451131341', 2500000.00, 'Pembelian Bitcoin', 1),
('2024-01-10', '1344815451646291', 4400000.00, 'Pembelian Saham', 1),
('2024-01-15', '1111111111111111', 70000.00, 'Pembelian buku', 4);

-- 2) Read
SELECT * FROM nasabah;
 id |      no_ktp      | nama_depan | nama_belakang |  no_telepon   | jenis_kelamin |            alamat             | nama_ibu_kandung
----+------------------+------------+---------------+---------------+---------------+-------------------------------+------------------
  1 | 3578012412020001 | Rizki      | Robawa        | 0821345563145 | Laki-laki     | Jl. Mbraon nguling IX/ T - 19 |  Siti Aminah
  2 | 1234567890       | John       | Doe           | 123456789     | Laki-laki     | Jl. Estreet No. 1             | Jane Doe
  3 | 9876543210       | Jane       | Doe           | 987654321     | Perempuan     | Jl. Neraka No. 2              | John Doe
  4 | 5432167890       | Alice      | Smith         | 555123456     | Perempuan     | Jl. Surga No. 3               | Robert Smith
  5 | 9876543211       | Bob        | Johnson       | 555987654     | Laki-laki     | Jl. Kemenangan No. 4          | Sarah Johnson
  6 | 1234567891       | Emma       | Brown         | 555111222     | Perempuan     | Jl. Chicago No. 5             | Michael Brown

SELECT * FROM akun;
 id |   username   |   password   |          email           |    no_rekening     |  pin   |    saldo    | nasabah_id
----+--------------+--------------+--------------------------+--------------------+--------+-------------+------------
  1 | rizki_robawa | password4684 | rizkirobawa@gmail.com    | 81274814217473     | 123456 | 10000000.00 |          1
  2 | john_doe     | password123  | johndoe@example.com      | 1234567890123456   | 123456 | 10000000.00 |          2
  3 | jane_smith   | password456  | janesmith@example.com    | 9876543210987654   | 567812 | 25000000.00 |          3
  4 | alice_wonder | password789  | alice@example.com        | 5555555555555555   | 987623 | 20000000.00 |          4
  5 | bob_builder  | passwordabc  | bob@example.com          | 1111111111111111   | 246844 | 15000000.00 |          5
  6 | eve_madam    | passwordev   | eve@example.com          | 125162742727272757 | 135712 | 13000000.00 |          6
  7 | robawa_rizki | ddn123456    | rizkysetylarln@gmail.com | 33315151358913     | 435621 |  7500000.00 |          1

SELECT * FROM transaksi;
 id |  tanggal   | no_rekening_tujuan |   jumlah   |             berita              | akun_id
----+------------+--------------------+------------+---------------------------------+---------
  1 | 2024-01-01 | 9876543210987654   |  200000.00 | Pembayaran tagihan              |       2
  2 | 2024-01-02 | 5555555555555555   |  100000.00 | Pengiriman uang kepada teman    |       3
  3 | 2024-01-03 | 1111111111111111   |  300000.00 | Pembelian barang                |       4
  4 | 2024-01-04 | 9999999999999999   |  500000.00 | Pengiriman uang kepada keluarga |       5
  5 | 2024-01-05 | 1234567890123456   |  400000.00 | Penarikan tunai                 |       6
  6 | 2024-01-06 | 1234567890123456   |  100000.00 | Pembayaran tagihan              |       6
  7 | 2024-01-07 | 9876543210987654   |  150000.00 | Pengiriman uang kepada saudara  |       2
  8 | 2024-01-08 | 5555555555555555   |  200000.00 | Pembelian makanan               |       3
  9 | 2024-01-09 | 1111111111111111   |  250000.00 | Pembelian tiket                 |       4
 10 | 2024-01-10 | 9999999999999999   |  350000.00 | Pembayaran tagihan listrik      |       5
 11 | 2024-01-11 | 1234567890123456   |  600000.00 | Transfer ke akun lain           |       6
 12 | 2024-01-12 | 1234567890123456   |  700000.00 | Transfer ke akun lain           |       6
 13 | 2024-01-13 | 9876543210987654   |  250000.00 | Pembayaran tagihan telepon      |       2
 14 | 2024-01-14 | 5555555555555555   |  150000.00 | Pengiriman uang kepada teman    |       3
 15 | 2024-01-14 | 5555555555555555   | 1500000.00 | Pembelian tiket konser          |       1
 16 | 2024-01-14 | 1344815451131341   | 2500000.00 | Pembelian Bitcoin               |       1
 17 | 2024-01-10 | 1344815451646291   | 4400000.00 | Pembelian Saham                 |       1
 18 | 2024-01-15 | 1111111111111111   |   70000.00 | Pembelian buku                  |       4