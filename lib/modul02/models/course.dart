// Model data untuk mata kuliah
class Course {
  final String code;
  final String name;
  final String lecturer;
  final int sks;
  final double progress; // progres silabus (0.0 - 1.0)
  final String room;
  final String type;

  const Course({
    required this.code,
    required this.name,
    required this.lecturer,
    required this.sks,
    required this.progress,
    this.type = 'Teori',
    this.room = 'Lab Komputer 3',
  });

  // Data dummy untuk bahan praktikum & testing
  static List<Course> getSampleCourses() {
    return const [
      Course(
        code: 'TRPL501',
        name: 'Pemrograman Perangkat Bergerak',
        lecturer: 'Sepyan Purnama Kristanto, S.Kom, M.Kom',
        sks: 4,
        progress: 0.25,
        room: 'Lab Komputer 3',
        type: 'Praktikum',
      ),
      Course(
        code: 'TRPL502',
        name: 'Rekayasa Kebutuhan Perangkat Lunak',
        lecturer: 'Eka Mistiko Rini, S.Kom, M.Kom',
        sks: 3,
        progress: 0.40,
        room: 'Prata B4.05',
        type: 'Teori',
      ),
      Course(
        code: 'TRPL503',
        name: 'Pemrograman Web Lanjut',
        lecturer: 'Devit Suwardiyanto, S.Si, M.Kom',
        sks: 3,
        progress: 0.60,
        room: 'lab Pemrograman 2',
        type: 'Teori',
      ),
      Course(
        code: 'TRPL504',
        name: 'BasisData Lanjut',
        lecturer: 'Diani Yusuf, S.Si, M.Kom',
        sks: 2,
        progress: 0.15,
        room: 'Lab Tuk',
        type: 'Praktikum',
      ),
    ];
  }
}