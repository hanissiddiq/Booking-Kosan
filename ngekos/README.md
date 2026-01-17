# 📸 Sistem Informasi Sewa Kosan (Ngekos)

Ngekos adalah aplikasi berbasis web yang digunakan untuk melakukan pencarian kos-kosan terbaik.  
Aplikasi ini dibangun menggunakan **Laravel 11**, **MySQL**, **PHP 8.2**, dan **CSS** untuk styling dasar dan juga **Filament** untuk CMS Admin.

---

## 🚀 Tech Stack
- **Framework**: Laravel 11
- **Bahasa Pemrograman**: PHP 8.2
- **Database**: MySQL 8+
- **Frontend**: Blade Template + CSS
- **Web Server**: Apache / Nginx

---


## 📂 Struktur Folder (Utama)
```
/sirapo
 ├── app
 ├── bootstrap
 ├── config
 ├── database
 │    ├── migrations
 │    └── seeders
 ├── public
 ├── resources
 │    ├── css
 │    ├── js
 │    └── views
 ├── routes
 │    └── web.php
 ├── storage
 └── tests
```

---

## 🔧 Instalasi & Konfigurasi

### 1️⃣ Clone Repository
```bash
git clone https://github.com/username/booking-kosan.git
cd booking-kosan/ngekos
```

### 2️⃣ Install Dependencies
```bash
composer install
npm install && npm run dev
```

### 3️⃣ Konfigurasi Environment
Salin file `.env-asli` menjadi `.env` lalu sesuaikan konfigurasi database:
```env
APP_NAME=Ngekos
APP_ENV=local
APP_KEY=base64:xxx
APP_DEBUG=true
APP_URL=http://localhost

DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=db_ngekos
DB_USERNAME=root
DB_PASSWORD=
```

### 4️⃣ Generate Key
```bash
php artisan key:generate
```

### 5️⃣ Migrasi Database & Seeder
```bash
php artisan migrate --seed
```
atau bisa juga impor database yang sudah ada di root project ke phpmyadmin
```bash
db_ngekos.sql
```


### 6️⃣ Jalankan Server Lokal
```bash
php artisan serve
```
Akses aplikasi melalui [http://localhost:8000](http://localhost:8000)

---

## 👥 Roles Default
- **Admin**
  - Akses http://localhost:8000/admin
  - Email: `admin@ngekos.com`
  - Password: `password`

- **User**
  - Registrasi melalui halaman register

---

## 🔄 Alur Pengguna (Use Case Flow)

```
[User] → Registrasi/Login → Pilih Paket Foto → Pilih Jadwal → Konfirmasi Reservasi
    ↓
[Admin] → Terima Reservasi → Kelola Jadwal & Paket → Cetak Laporan
```

---

## 🛠️ Pengembangan
- Gunakan `php artisan make:model`, `make:controller`, `make:migration` untuk menambah fitur.
- Jalankan `php artisan migrate:fresh --seed` untuk reset database.
- Gunakan `php artisan tinker` untuk mencoba query secara cepat.

---

## 📜 Lisensi
Proyek ini menggunakan lisensi **MIT**.  
Silakan gunakan, modifikasi, dan distribusikan dengan bebas sesuai kebutuhan.

---

## ✨ Kontributor
- **[Nama Anda]** – Developer Utama
- Tim Dokumentasi & QA
