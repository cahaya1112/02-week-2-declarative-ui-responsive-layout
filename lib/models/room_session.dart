// lib/models/room_session.dart

enum SessionStatus { berlangsung, akanDatang, selesai, tersedia }

extension SessionStatusLabel on SessionStatus {
  String get label {
    switch (this) {
      case SessionStatus.berlangsung:
        return 'Berlangsung';
      case SessionStatus.akanDatang:
        return 'Akan Datang';
      case SessionStatus.selesai:
        return 'Selesai';
      case SessionStatus.tersedia:
        return 'Tersedia';
    }
  }
}

class RoomSession {
  final int id;
  final String namaKegiatan;
  final String namaRuang;
  final SessionStatus status;
  final String deskripsi;
  final String waktu;

  const RoomSession({
    required this.id,
    required this.namaKegiatan,
    required this.namaRuang,
    required this.status,
    required this.deskripsi,
    required this.waktu,
  });
}

const List<RoomSession> dummyRoomSessions = [
  RoomSession(
    id: 1,
    namaKegiatan: 'Pelatihan Dasar ESP32 dan Pemrograman Sensor',
    namaRuang: 'Workshop IoT & Mikrokontroler',
    status: SessionStatus.berlangsung,
    deskripsi:
        'Peserta belajar menghubungkan ESP32 dengan sensor suhu dan kelembaban, lalu mengirim data ke server lokal melalui protokol MQTT.',
    waktu: '08.00 - 10.00',
  ),
  RoomSession(
    id: 2,
    namaKegiatan: 'Perakitan Rangkaian Elektronika Dasar',
    namaRuang: 'Workshop Elektronika & Perangkat',
    status: SessionStatus.akanDatang,
    deskripsi:
        'Sesi perakitan komponen elektronika dasar seperti resistor, kapasitor, dan IC pada breadboard.',
    waktu: '10.00 - 12.00',
  ),
  RoomSession(
    id: 3,
    namaKegiatan:
        'Cetak Prototipe 3D Printing untuk Studi Kasus Mahasiswa Tingkat Akhir yang Mengerjakan Proyek Manufaktur Skala Kecil',
    namaRuang: 'Workshop Manufaktur & Prototyping',
    status: SessionStatus.selesai,
    deskripsi:
        'Kegiatan pencetakan prototipe menggunakan mesin 3D printer untuk kebutuhan tugas akhir mahasiswa jurusan teknik.',
    waktu: '13.00 - 15.00',
  ),
  RoomSession(
    id: 4,
    namaKegiatan: 'Uji Coba Lengan Robot Sederhana',
    namaRuang: 'Workshop Robotika & Otomasi',
    status: SessionStatus.tersedia,
    deskripsi:
        'Ruang tersedia di luar jadwal kegiatan, dapat digunakan untuk praktik mandiri robotika.',
    waktu: '-',
  ),
  RoomSession(
    id: 5,
    namaKegiatan: 'Kalibrasi Sensor Jarak dan Sensor Cahaya',
    namaRuang: 'Workshop IoT & Mikrokontroler',
    status: SessionStatus.akanDatang,
    deskripsi:
        'Kalibrasi sensor ultrasonik dan LDR sebelum digunakan pada proyek IoT mahasiswa semester lima.',
    waktu: '13.00 - 14.30',
  ),
  RoomSession(
    id: 6,
    namaKegiatan: 'Soldering Praktik Dasar',
    namaRuang: 'Workshop Elektronika & Perangkat',
    status: SessionStatus.selesai,
    deskripsi:
        'Latihan menyolder komponen elektronik pada papan PCB untuk pemula.',
    waktu: '08.00 - 09.30',
  ),
  RoomSession(
    id: 7,
    namaKegiatan: 'Finishing dan Pengecatan Hasil Cetak Prototipe',
    namaRuang: 'Workshop Manufaktur & Prototyping',
    status: SessionStatus.berlangsung,
    deskripsi:
        'Tahap akhir produksi prototipe berupa proses pembersihan, pengamplasan, dan pengecatan.',
    waktu: '09.00 - 11.00',
  ),
  RoomSession(
    id: 8,
    namaKegiatan: 'Pemrograman Motor Servo pada Lengan Robot',
    namaRuang: 'Workshop Robotika & Otomasi',
    status: SessionStatus.tersedia,
    deskripsi:
        'Ruang tersedia untuk sesi tambahan pemrograman motor servo di luar jadwal reguler.',
    waktu: '-',
  ),
];