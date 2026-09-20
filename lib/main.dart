import 'package:flutter/material.dart';
import 'modul_01/profile_screen.dart';
import 'modul02/academic_dashboard_screen.dart';
import 'modul_03/modul_03_app.dart';
import 'modul_04/modul_04_app.dart';
import 'modul02/studi_kasus/ruang_praktikum.dart';

void main() {
  runApp(const RuangKitaApp());
}

const List<Color> seedColorByDigit = [
  Colors.red,
  Colors.pink,
  Colors.purple,
  Colors.indigo,
  Colors.blue,
  Colors.cyan,
  Colors.green,
  Colors.lime,
  Colors.teal,
  Colors.orange,
];

class RuangKitaApp extends StatefulWidget {
  const RuangKitaApp({super.key});

  @override
  State<RuangKitaApp> createState() => _RuangKitaAppState();
}

class _RuangKitaAppState extends State<RuangKitaApp> {
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color seedColor = seedColorByDigit[8];

    return MaterialApp(
      title: 'RuangKita',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: seedColor,
          brightness: Brightness.light,
        ),
      ),

      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: seedColor,
          brightness: Brightness.dark,
        ),
      ),

      themeMode: isDarkMode
          ? ThemeMode.dark
          : ThemeMode.light,

      home: RuangPraktikum(
        isDarkMode: isDarkMode,
        onToggleTheme: toggleTheme,
      ),
    );
  }
}