# H1D023107_Tugas7 - Aplikasi Food Ordering (Flutter)

Proyek ini adalah implementasi tugas praktikum Pemrograman Mobile (Pertemuan 7) menggunakan Framework **Flutter**. Aplikasi ini mendemonstrasikan kemampuan navigasi antar halaman (**Routes**), penggunaan menu samping (**Side Menu**), sistem autentikasi dinamis (**Login & Register**), serta manajemen data lokal sederhana menggunakan **Shared Preferences**.

> **Catatan Pengembangan:** Berbeda dari modul standar yang menggunakan *hardcoded login* ('admin'), aplikasi ini dikembangkan lebih lanjut dengan fitur **Registrasi Pengguna**, **Validasi Login Dinamis**, serta **Desain UI Modern** yang interaktif.

---

##  Fitur Utama

1.  **Sistem Autentikasi (Login & Register):**
    * Pengguna dapat mendaftar akun baru yang datanya disimpan secara lokal.
    * Login memvalidasi input pengguna dengan data yang ada di penyimpanan lokal.
2.  **Splash Screen Otomatis:**
    * Aplikasi mendeteksi status login pengguna saat dibuka. Jika sudah login, langsung diarahkan ke Home Page.
3.  **Desain UI Modern & Interaktif:**
    * Tampilan Home Page yang menarik dengan kombinasi *scroll* vertikal dan horizontal.
    * Efek visual seperti *floating image* dan *shadows* pada kartu makanan.
4.  **Navigasi Detail Makanan (Passing Data):**
    * Setiap item makanan di Home Page dapat diklik untuk membuka halaman detail yang spesifik.
    * Halaman detail menampilkan data (Gambar, Nama, Harga, Deskripsi) sesuai item yang dipilih.
5.  **Kalkulasi Harga Real-time:**
    * Halaman detail memiliki fitur untuk menambah/mengurangi jumlah pesanan (*Qty*) yang otomatis memperbarui total harga.
6.  **Side Menu (Drawer):**
    * Menu navigasi samping yang menampilkan informasi pengguna yang sedang login dan opsi Logout.

---

##  Alur Kerja Aplikasi (Workflow)

Aplikasi ini dirancang dengan alur kerja yang logis dan user-friendly:

1.  **Memulai Aplikasi (Splash Screen):**
    * Saat aplikasi dijalankan, `SplashScreen` akan muncul sejenak.
    * Sistem mengecek `SharedPreferences` untuk variabel `isLoggedIn`.
    * **Kondisi A:** Jika `true` (user pernah login), navigasi langsung ke `HomePage`.
    * **Kondisi B:** Jika `false` (belum login), navigasi ke `LoginPage`.

2.  **Proses Registrasi & Login:**
    * Di halaman Login, pengguna baru dapat menekan tombol "Daftar" untuk ke `RegisterPage`.
    * User memasukkan *Username* dan *Password*, lalu data disimpan ke memori HP.
    * Setelah terdaftar, user login menggunakan kredensial tersebut. Jika sukses, status sesi disimpan dan user masuk ke `HomePage`.

3.  **Eksplorasi Menu (Home Page):**
    * User disuguhkan daftar makanan populer (scroll horizontal) dan rekomendasi lainnya (vertikal).
    * User memilih salah satu makanan dengan mengklik kartu makanan tersebut.

4.  **Pemesanan (Detail Page):**
    * Aplikasi membuka `FoodDetailPage` dengan membawa data makanan yang dipilih.
    * User dapat melihat detail, mengatur jumlah pesanan, dan melihat total harga.

5.  **Logout:**
    * User membuka Side Menu (ikon garis tiga di pojok kiri atas).
    * Menekan tombol **Logout** akan menghapus sesi login dan mengembalikan user ke halaman Login.

---

##  Struktur & Penjelasan Kode

Berikut adalah rincian teknis dari setiap file yang membangun aplikasi ini:

### 1. Konfigurasi Utama
* **`lib/main.dart`**:
    * Titik masuk aplikasi (`runApp`).
    * Mengatur tema visual (`ThemeData`).
    * Mendefinisikan **Named Routes** (`/login`, `/register`, `/home`, `/detail`) untuk mempermudah navigasi antar halaman.

### 2. Halaman Awal & Autentikasi
* **`lib/pages/splash_screen.dart`**:
    * Menggunakan `Future.delayed` untuk simulasi loading.
    * Mengecek status login via `SharedPreferences` untuk menentukan halaman tujuan (Home atau Login).
* **`lib/pages/login_page.dart`**:
    * Formulir login dengan validasi input.
    * Mencocokkan input dengan data di `SharedPreferences`.
    * Menyimpan status `isLoggedIn = true` jika berhasil.
* **`lib/pages/register_page.dart`**:
    * Formulir pendaftaran akun.
    * Menyimpan *username* dan *password* baru ke penyimpanan lokal (`prefs.setString`).

### 3. Halaman Utama & Menu
* **`lib/pages/home_page.dart`**:
    * **UI Layout:** Menggunakan `SingleChildScrollView` untuk konten panjang.
    * **Header Section:** Menampilkan teks sambutan dan tombol promosi.
    * **Horizontal List:** Menggunakan `ListView.builder` dengan scroll horizontal untuk kartu makanan populer.
    * **Logic:** Menyimpan data makanan dalam List `foodItems`. Menggunakan `GestureDetector` pada setiap kartu untuk mendeteksi klik dan melakukan navigasi `Navigator.push` ke halaman detail sambil mengirimkan data item tersebut.
* **`lib/pages/side_menu.dart`**:
    * Widget `Drawer` yang dapat dipanggil dari `Scaffold`.
    * Menampilkan `UserAccountsDrawerHeader` dengan nama pengguna yang diambil dari memori lokal.
    * Tombol Logout yang menghapus sesi dan me-reset navigasi ke halaman login.

### 4. Halaman Detail
* **`lib/pages/food_detail_page.dart`**:
    * **Dynamic Widget:** Menerima parameter (judul, harga, gambar, deskripsi) melalui *Constructor*.
    * **State Management:** Menggunakan `StatefulWidget` untuk mengelola perubahan angka jumlah pesanan (`_quantity`) dan menghitung `_totalPrice` secara otomatis saat tombol tambah/kurang ditekan.

---

##  Tampilan Antarmuka

Berikut adalah pratinjau tampilan aplikasi:

| Login Page | Register Page |
| :---: | :---: |

| Home Page | Side Menu |
| :---: | :---: |


| Detail Page |
| :---: |


https://github.com/user-attachments/assets/e49e84e4-a294-42cd-a5ca-dd081c72f628



---

##  Cara Menjalankan Project

1.  Pastikan **Flutter SDK** telah terinstal dan terkonfigurasi.
2.  Clone repository ini atau ekstrak file zip proyek.
3.  Buka terminal di direktori proyek.
4.  Instal dependensi yang diperlukan (terutama `shared_preferences`):
    ```bash
    flutter pub get
    ```
5.  Jalankan aplikasi di emulator atau perangkat fisik:
    ```bash
    flutter run
    ```

---

**Dibuat oleh:**
Nama: ISMA FADHILATIZZAHRA
NIM: H1D023107
Mata Kuliah: Praktikum Pemrograman Mobile
