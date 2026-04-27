-- =========================================
-- DATABASE PERPUSTAKAAN LENGKAP
-- =========================================

CREATE DATABASE perpustakaan_lengkap;
USE perpustakaan_lengkap;

-- =========================================
-- 1. TABEL KATEGORI BUKU
-- =========================================
CREATE TABLE kategori_buku (
    id_kategori INT AUTO_INCREMENT PRIMARY KEY,
    nama_kategori VARCHAR(50) NOT NULL UNIQUE,
    deskripsi TEXT,
    is_deleted BOOLEAN DEFAULT FALSE
);

-- =========================================
-- 2. TABEL PENERBIT
-- =========================================
CREATE TABLE penerbit (
    id_penerbit INT AUTO_INCREMENT PRIMARY KEY,
    nama_penerbit VARCHAR(100) NOT NULL,
    alamat TEXT,
    telepon VARCHAR(15),
    email VARCHAR(100),
    is_deleted BOOLEAN DEFAULT FALSE
);

-- =========================================
-- 3. TABEL RAK (BONUS)
-- =========================================
CREATE TABLE rak (
    id_rak INT AUTO_INCREMENT PRIMARY KEY,
    nama_rak VARCHAR(50),
    lokasi VARCHAR(100),
    is_deleted BOOLEAN DEFAULT FALSE
);

-- =========================================
-- 4. TABEL BUKU (SUDAH RELASI)
-- =========================================
CREATE TABLE buku (
    id_buku INT AUTO_INCREMENT PRIMARY KEY,
    kode_buku VARCHAR(20) UNIQUE NOT NULL,
    judul VARCHAR(200) NOT NULL,
    id_kategori INT,
    id_penerbit INT,
    id_rak INT,
    pengarang VARCHAR(100),
    tahun_terbit INT,
    harga DECIMAL(10,2),
    stok INT,
    is_deleted BOOLEAN DEFAULT FALSE,

    FOREIGN KEY (id_kategori) REFERENCES kategori_buku(id_kategori),
    FOREIGN KEY (id_penerbit) REFERENCES penerbit(id_penerbit),
    FOREIGN KEY (id_rak) REFERENCES rak(id_rak)
);

-- =========================================
-- INSERT DATA KATEGORI
-- =========================================
INSERT INTO kategori_buku (nama_kategori, deskripsi) VALUES
('Programming','Buku tentang pemrograman'),
('Database','Buku database'),
('Web Design','Desain web'),
('Networking','Jaringan komputer'),
('AI','Artificial Intelligence');

-- =========================================
-- INSERT DATA PENERBIT
-- =========================================
INSERT INTO penerbit (nama_penerbit, alamat, telepon, email) VALUES
('Informatika','Bandung','0811111111','info@informatika.com'),
('Erlangga','Jakarta','0822222222','info@erlangga.com'),
('Andi','Yogyakarta','0833333333','info@andi.com'),
('Gramedia','Jakarta','0844444444','info@gramedia.com'),
('Graha Ilmu','Yogyakarta','0855555555','info@graha.com');

-- =========================================
-- INSERT DATA RAK
-- =========================================
INSERT INTO rak (nama_rak, lokasi) VALUES
('Rak A','Lantai 1'),
('Rak B','Lantai 1'),
('Rak C','Lantai 2');

-- =========================================
-- INSERT DATA BUKU (MINIMAL 15)
-- =========================================
INSERT INTO buku (kode_buku, judul, id_kategori, id_penerbit, id_rak, pengarang, tahun_terbit, harga, stok) VALUES
('BK-001','Belajar PHP',1,1,1,'Budi',2023,75000,10),
('BK-002','Master MySQL',2,5,2,'Andi',2022,95000,5),
('BK-003','Laravel Advanced',1,1,1,'Siti',2024,125000,8),
('BK-004','Web Design Modern',3,3,2,'Dedi',2023,85000,15),
('BK-005','Network Security',4,2,3,'Rina',2023,110000,3),
('BK-006','AI Dasar',5,4,1,'Ahmad',2024,130000,6),
('BK-007','HTML CSS',3,3,2,'Dewi',2022,70000,12),
('BK-008','JavaScript ES6',1,1,1,'Siti',2023,80000,7),
('BK-009','Python AI',5,4,3,'Budi',2024,140000,9),
('BK-010','Cisco Networking',4,2,2,'Rina',2023,120000,4),
('BK-011','SQL Server',2,5,1,'Andi',2022,90000,6),
('BK-012','React JS',1,1,2,'Siti',2024,115000,11),
('BK-013','UI UX Design',3,3,3,'Dedi',2023,95000,8),
('BK-014','Machine Learning',5,4,1,'Ahmad',2024,150000,5),
('BK-015','Linux Server',4,2,2,'Rina',2023,100000,7);

-- =========================================
-- QUERY JOIN (WAJIB)
-- =========================================

-- 1. Tampilkan buku + kategori + penerbit
SELECT 
    b.judul,
    k.nama_kategori,
    p.nama_penerbit
FROM buku b
JOIN kategori_buku k ON b.id_kategori = k.id_kategori
JOIN penerbit p ON b.id_penerbit = p.id_penerbit;

-- 2. Jumlah buku per kategori
SELECT k.nama_kategori, COUNT(*) AS jumlah
FROM buku b
JOIN kategori_buku k ON b.id_kategori = k.id_kategori
GROUP BY k.nama_kategori;

-- 3. Jumlah buku per penerbit
SELECT p.nama_penerbit, COUNT(*) AS jumlah
FROM buku b
JOIN penerbit p ON b.id_penerbit = p.id_penerbit
GROUP BY p.nama_penerbit;

-- 4. Detail lengkap buku
SELECT 
    b.judul,
    k.nama_kategori,
    p.nama_penerbit,
    r.nama_rak,
    b.harga,
    b.stok
FROM buku b
JOIN kategori_buku k ON b.id_kategori = k.id_kategori
JOIN penerbit p ON b.id_penerbit = p.id_penerbit
JOIN rak r ON b.id_rak = r.id_rak;