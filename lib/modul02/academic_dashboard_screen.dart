import 'package:flutter/material.dart';
import 'models/course.dart';
import 'widgets/course_card.dart';
import 'widgets/header_banner.dart';


class AcademicDashboardScreen extends StatefulWidget {
  const AcademicDashboardScreen({super.key});

  @override
  State<AcademicDashboardScreen> createState() => _AcademicDashboardScreenState();
}

class _AcademicDashboardScreenState extends State<AcademicDashboardScreen> {
  String _selectedCategory = 'Semua';
  // fold(): Menjumlahkan bobot SKS dari seluruh objek Course di dalam list
int get totalSks => _courses.fold(0, (sum, c) => sum + c.sks);
  List<Course> get _filteredCourses {
    if (_selectedCategory =='Semua') {
      return _courses;
    }
    return _courses.where((course) => course.type == _selectedCategory).toList();
  }
  final List<Course> _courses = Course.getSampleCourses();
  bool _isDarkMode = false;

  void _toggleDarkMode() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }
  // Masukkan kode ini tepat di atas daftar mata kuliah
Widget _buildCategoryFilter(){
 return Wrap(
  spacing: 8.0,
  children: ['Semua', 'Teori', 'Praktikum'].map((category) {
    return ChoiceChip(
      label: Text(category),
      selected: _selectedCategory == category,
      onSelected: (selected) {
        if (selected) {
          setState(() {
            _selectedCategory = category;
          });
        }
      },
    );
  }).toList(),
);}
Widget _buildSksWarningIfNeeded (){
if (totalSks <= 24) return const SizedBox.shrink();
return ListTile(
  tileColor: const Color.fromARGB(255, 255, 0, 25),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  leading: const Icon(Icons.warning_amber_rounded, color: Colors.red),
  title: Text(
    'Peringatan: Total SKS ($totalSks SKS) melebihi batas 24 SKS!',
    style: const TextStyle(color: Colors.red, fontSize: 12, fontWeight: FontWeight.bold),
  ),
);
}
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0284C7),
          brightness: _isDarkMode ? Brightness.dark : Brightness.light,
        ),
        useMaterial3: true,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Dashboard Akademik TRPL',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: const Color(0xFF0284C7),
          foregroundColor: Colors.white,
          actions: [
            IconButton(
              icon: Icon(_isDarkMode ? Icons.light_mode_rounded : Icons.dark_mode_rounded),
              tooltip: _isDarkMode ? 'Mode Terang' : 'Mode Gelap',
              onPressed: _toggleDarkMode,
            ),
          ],
        ),
        // LayoutBuilder membaca ukuran layar untuk menentukan tata letak responsif
        body: LayoutBuilder(
          builder: (context, constraints) {
            // Breakpoint 600dp: Tablet / Landscape menggunakan 2 kolom
            if (constraints.maxWidth >= 600) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Kolom kiri: banner profil
                    Expanded(
                      flex: 2,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildSksWarningIfNeeded(),
                            const HeaderBanner(),
                            const SizedBox(height: 16),
                            const Text(
                              'Filter Kategori:',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            _buildCategoryFilter(),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    // Kolom kanan: grid 2 kolom daftar mata kuliah
                    Expanded(
                      flex: 3,
                      child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 1.2,
                        ),
                        itemCount: _courses.length,
                        itemBuilder: (context, index) {
                          return CourseCard(course: _courses[index]);
                        },
                      ),
                    ),
                  ],
                ),
              );
            }

            // Default (smartphone): tata letak 1 kolom vertikal
            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildSksWarningIfNeeded(),
                const HeaderBanner(),
                const SizedBox(height: 16),
                _buildCategoryFilter(),
                const SizedBox(height: 16),
                Text(
                  'Mata Kuliah Semester 3 (${_courses.length} Terdaftar)',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                ..._filteredCourses.map((course) => CourseCard(course: course)),
              ],
            );
          },
        ),
      ),
    );
  }
}