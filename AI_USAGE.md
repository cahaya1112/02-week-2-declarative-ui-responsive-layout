# Pengungkapan Penggunaan AI (AI Usage Disclosure)

## 1. Alat yang Digunakan

**Alat / Model AI:** Claude

## 2. Tujuan Penggunaan

AI digunakan sebagai alat bantu dalam memahami instruksi tugas, menyusun dan memahami struktur kode Flutter, membantu penerapan layout responsif, serta membantu mencari solusi ketika terjadi masalah pada tampilan dan kode aplikasi.

## 3. Bagian Kode yang Dibantu

Bagian yang mendapatkan bantuan antara lain:

* `lib/main.dart`
* `lib/models/room_session.dart`
* `lib/widgets/room_session_card.dart`
* `lib/modul02/studi_kasus/ruang_praktikum.dart`

## 4. Bentuk Bantuan

Bantuan AI digunakan untuk:

* Membuat dan menyesuaikan contoh data lokal `RoomSession`.
* Membantu penerapan `LayoutBuilder`.
* Membantu menentukan breakpoint responsive layout.
* Membantu penerapan `Wrap` dan `ChoiceChip`.
* Membantu penerapan `Stack` dan `Positioned` untuk badge status.
* Membantu menangani teks panjang menggunakan `maxLines` dan `TextOverflow.ellipsis`.
* Membantu penerapan Light Mode dan Dark Mode.
* Membantu penerapan `showModalBottomSheet` dan `StatefulBuilder`.
* Membantu menganalisis masalah `RenderFlex overflow` pada tampilan Compact.
* Membantu memahami penggunaan `Expanded` pada `Column` dan `Row`.

## 5. Modifikasi dan Pemahaman Mandiri

Kode tidak langsung digunakan tanpa pemeriksaan. Beberapa bagian disesuaikan dengan kebutuhan tugas, terutama:

* Domain aplikasi disesuaikan menjadi **Bengkel / Workshop** berdasarkan digit terakhir NIM.
* Nama aplikasi disesuaikan menjadi **RuangKita - Dashboard Ketersediaan Ruang Workshop**.
* Kode identitas UI disesuaikan menjadi **M02-2038**.
* Breakpoint layout ditetapkan menjadi `< 600dp`, `600–839dp`, dan `>= 840dp`.
* Data `RoomSession` disesuaikan dengan skenario kegiatan pada ruang workshop.
* Tampilan `RoomSessionCard` disesuaikan dengan informasi kegiatan, ruang, waktu, status, dan deskripsi.
* Filter kategori dan status disesuaikan dengan data yang digunakan pada aplikasi.
* Tampilan Light Mode dan Dark Mode disesuaikan dengan kebutuhan aplikasi.
* Beberapa perbaikan kode dilakukan setelah pengujian langsung pada ukuran layar yang berbeda.

Penggunaan AI dilakukan sebagai alat bantu pembelajaran. Kode tetap diperiksa, dijalankan, diuji, dan dipahami sebelum digunakan dalam tugas.

## 6. Tautan Percakapan AI

Dokumentasi percakapan dengan AI (Claude) dapat dilihat melalui tautan berikut:

**Link Conversation Claude:** https://claude.ai/share/b5e14f46-c029-4f2c-9f14-16a9e602a009

Link tersebut diberikan agar dosen dapat melihat proses penggunaan AI, termasuk prompt yang diberikan dan respons AI selama pengerjaan Modul 02.