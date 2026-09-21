# Laporan Tugas Rumah Modul 02: Declarative UI & Responsive Layout

* **Nama**: Cahaya Wulandari
* **NIM**: 362558302038
* **Kelas / Prodi**: 2C / Sarjana Terapan Teknologi Rekayasa Perangkat Lunak
* **Digit Terakhir NIM**: 8
* **Dosen Pengampu**: Sepyan Purnama Kristanto, M.Kom.
* **Domain Aplikasi**: Bengkel / Workshop
* **Nama Aplikasi**: RuangKita - Dashboard Ketersediaan Ruang Workshop
* **Kode Identitas UI Wajib**: M02-2038
* **Mata Kuliah**: Pemrograman Perangkat Bergerak

---

## 1. Arsitektur Widget

RuangKita - Dashboard Ketersediaan Ruang Workshop merupakan aplikasi Flutter yang digunakan untuk menampilkan informasi kegiatan workshop, nama ruang, waktu kegiatan, status kegiatan, dan deskripsi kegiatan.

Aplikasi menggunakan konsep Declarative UI dengan Material Design 3. Data kegiatan disimpan secara lokal menggunakan model `RoomSession`, sedangkan tampilan kartu kegiatan dibuat menggunakan widget terpisah `RoomSessionCard`.

Halaman utama menggunakan `StatefulWidget` karena terdapat beberapa bagian yang membutuhkan perubahan state, yaitu filter kategori, filter status, dan perubahan Light Mode / Dark Mode.

Responsivitas tampilan menggunakan `LayoutBuilder` dengan tiga kondisi layar, yaitu layar mobile dengan satu kolom, tablet dengan dua kolom, dan layar lebar dengan tiga kolom.

---

## 2. Layout Responsif

| Lebar | Layout |
|---|---|
| < 600 dp | ListView — 1 kolom |
| 600–839 dp | GridView — 2 kolom |
| ≥ 840 dp | GridView — 3 kolom |

Layout ditentukan menggunakan `LayoutBuilder`.

Pada aplikasi ini `LayoutBuilder` berada di dalam `Expanded`. `Expanded` digunakan agar bagian daftar card mendapatkan sisa ruang yang tersedia di dalam `Column`, sehingga `ListView` atau `GridView` mendapatkan batas tinggi yang jelas. Setelah itu `LayoutBuilder` membaca `constraints.maxWidth` untuk menentukan layout yang digunakan.

---

## 3. Komponen Utama

`Wrap + ChoiceChip` untuk filter kategori dan status.

`LayoutBuilder` untuk responsive layout.

`Stack + Positioned` untuk badge status.

`Expanded` untuk memberikan ruang yang sesuai pada widget di dalam `Column` dan `Row`.

`showModalBottomSheet` untuk menampilkan detail kegiatan.

`StatefulBuilder` untuk mengatur perubahan Switch pada Bottom Sheet.

Material 3 dengan Light/Dark Mode.

---

## 4. Bukti Tangkapan Layar Running App

Seluruh screenshot aplikasi harus menampilkan kode identitas **M02-2038** pada header aplikasi.

### 4.1 Mobile Light Mode — Compact

**Ukuran:** `< 600dp`

**Layout:** 1 kolom

![Mobile Light](./screenshots/mobile%20light.png)

Tampilan mobile menggunakan satu kolom agar informasi pada setiap card tetap mudah dibaca pada layar yang memiliki ruang terbatas.

### 4.2 Tablet Light Mode — Medium

**Ukuran:** `600–839dp`

**Layout:** 2 kolom

![Tablet Light](./screenshots/tablet%20light.png)

Tampilan tablet menggunakan dua kolom sehingga ruang layar yang lebih lebar dapat dimanfaatkan.

### 4.3 Desktop Light Mode — Expanded

**Ukuran:** `≥ 840dp`

**Layout:** 3 kolom

![Expanded Light](./screenshots/expanded.png)

Tampilan Expanded menggunakan tiga kolom karena lebar layar sudah mencukupi untuk menampilkan lebih banyak card secara bersamaan.

### 4.4 Tablet Dark Mode

**Ukuran:** `600–839dp`

**Layout:** 2 kolom

![Tablet Dark](./screenshots/tablet%20dark.png)

Screenshot ini menunjukkan perubahan tampilan aplikasi setelah tombol mode tema pada AppBar ditekan.

### 4.5 Mobile Dark Mode

**Ukuran:** `< 600dp`

**Layout:** 1 kolom

![Mobile Dark](./screenshots/mobile%20dark.png)

Screenshot ini menunjukkan tampilan aplikasi pada ukuran mobile setelah Dark Mode diaktifkan.

---

## 5. Tautan Commit Final Repository

**Tautan Commit Final GitHub**: https://github.com/cahaya1112/02-week-2-declarative-ui-responsive-layout.git

Commit yang digunakan selama pengerjaan Modul 02:

1. `feat(m02): add room session model`
2. `feat(m02): build compact room cards UI mobile 1 kolom`
3. `feat(m02): add responsive breakpoints LayoutBuilder medium/expanded`
4. `feat(m02): add filters and bottom sheet setState + interaction`
5. `fix(m02): handle overflow and dark theme`

---

## 6. Jawaban Pertanyaan Refleksi Teknis

### (1) Mengapa `Expanded` Membantu Widget `Text` di Dalam `Row`?

`Row` memiliki ruang horizontal yang terbatas, sehingga teks yang terlalu panjang dapat menyebabkan `RenderFlex overflow`. Dengan menggunakan `Expanded`, widget `Text` akan menyesuaikan diri dengan sisa ruang yang tersedia. Jika dikombinasikan dengan `maxLines` dan `TextOverflow.ellipsis`, teks yang terlalu panjang dapat dipotong tanpa menyebabkan overflow.

### (2) Mengapa `LayoutBuilder` Cocok untuk Layout Lokal?

`MediaQuery` digunakan untuk mengetahui ukuran layar secara keseluruhan, sedangkan `LayoutBuilder` membaca batas ukuran dari parent widget secara langsung melalui `BoxConstraints`. Karena pada aplikasi ini layout perlu menyesuaikan dengan ruang yang tersedia pada bagian daftar card, `LayoutBuilder` digunakan untuk menentukan jumlah kolom berdasarkan `constraints.maxWidth`.

Pada aplikasi ini pembagiannya adalah kurang dari 600 dp menggunakan satu kolom, 600–839 dp menggunakan dua kolom, dan 840 dp atau lebih menggunakan tiga kolom.

### (3) Apa yang Terjadi Ketika `setState()` Dipanggil?

Ketika `setState()` dipanggil, Flutter menandai `State` sebagai perlu diperbarui dan menjalankan kembali metode `build()`. Pada aplikasi ini `setState()` digunakan pada filter kategori dan status. Ketika pilihan filter berubah, data pada `_filteredSessions` akan dihitung kembali sehingga card yang ditampilkan menyesuaikan dengan filter yang dipilih.

---