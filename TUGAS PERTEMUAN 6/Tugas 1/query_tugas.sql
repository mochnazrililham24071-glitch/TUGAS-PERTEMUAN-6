-- =========================================
-- TUGAS 1: EKSPLORASI DATABASE PERPUSTAKAAN
-- =========================================


-- ===============================
-- 1. STATISTIK BUKU
-- ===============================

-- Query ini digunakan untuk menghitung jumlah total data buku yang tersedia dalam tabel buku
SELECT COUNT(*) AS total_buku 
FROM buku;

-- Query ini digunakan untuk menghitung total nilai inventaris buku (hasil perkalian harga dengan stok setiap buku)
SELECT SUM(harga * stok) AS total_nilai_inventaris 
FROM buku;

-- Query ini digunakan untuk menghitung rata-rata harga dari seluruh buku yang ada
SELECT AVG(harga) AS rata_rata_harga 
FROM buku;

-- Query ini digunakan untuk menampilkan buku dengan harga paling tinggi (termahal)
SELECT judul, harga 
FROM buku 
ORDER BY harga DESC 
LIMIT 1;

-- Query ini digunakan untuk menampilkan buku yang memiliki jumlah stok terbanyak
SELECT judul, stok 
FROM buku 
ORDER BY stok DESC 
LIMIT 1;


-- ===============================
-- 2. FILTER DAN PENCARIAN
-- ===============================

-- Query ini digunakan untuk menampilkan buku dengan kategori Programming dan harga di bawah 100000
SELECT * 
FROM buku 
WHERE kategori = 'Programming' AND harga < 100000;

-- Query ini digunakan untuk mencari buku yang judulnya mengandung kata "PHP" atau "MySQL"
SELECT * 
FROM buku 
WHERE judul LIKE '%PHP%' OR judul LIKE '%MySQL%';

-- Query ini digunakan untuk menampilkan buku yang diterbitkan pada tahun 2024
SELECT * 
FROM buku 
WHERE tahun_terbit = 2024;

-- Query ini digunakan untuk menampilkan buku dengan jumlah stok antara 5 sampai 10
SELECT * 
FROM buku 
WHERE stok BETWEEN 5 AND 10;

-- Query ini digunakan untuk menampilkan buku yang ditulis oleh pengarang bernama Budi Raharjo
SELECT * 
FROM buku 
WHERE pengarang = 'Budi Raharjo';


-- ===============================
-- 3. GROUPING DAN AGREGASI
-- ===============================

-- Query ini digunakan untuk mengelompokkan data buku berdasarkan kategori serta menghitung jumlah buku dan total stok pada setiap kategori
SELECT 
    kategori,
    COUNT(*) AS jumlah_buku,
    SUM(stok) AS total_stok
FROM buku
GROUP BY kategori;

-- Query ini digunakan untuk menghitung rata-rata harga buku pada setiap kategori
SELECT 
    kategori,
    AVG(harga) AS rata_rata_harga
FROM buku
GROUP BY kategori;

-- Query ini digunakan untuk menentukan kategori dengan total nilai inventaris terbesar
SELECT 
    kategori,
    SUM(harga * stok) AS total_nilai
FROM buku
GROUP BY kategori
ORDER BY total_nilai DESC
LIMIT 1;


-- ===============================
-- 4. UPDATE DATA
-- ===============================

-- Query ini digunakan untuk menaikkan harga semua buku dalam kategori Programming sebesar 5 persen
UPDATE buku 
SET harga = harga * 1.05
WHERE kategori = 'Programming';

-- Query ini digunakan untuk menambahkan stok sebanyak 10 pada buku yang memiliki stok kurang dari 5
UPDATE buku 
SET stok = stok + 10
WHERE stok < 5;


-- ===============================
-- 5. LAPORAN KHUSUS
-- ===============================

-- Query ini digunakan untuk menampilkan daftar buku yang perlu dilakukan restocking (stok kurang dari 5)
SELECT * 
FROM buku 
WHERE stok < 5;

-- Query ini digunakan untuk menampilkan lima buku dengan harga tertinggi
SELECT judul, harga 
FROM buku 
ORDER BY harga DESC 
LIMIT 5;