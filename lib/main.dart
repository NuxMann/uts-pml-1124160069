import 'package:flutter/material.dart';

void main() {
  runApp(const ProfilApp());
}

class ProfilApp extends StatefulWidget {
  const ProfilApp({super.key});

  @override
  State<ProfilApp> createState() => _ProfilAppState();
}

class _ProfilAppState extends State<ProfilApp> {
  // State global untuk Mode Gelap/Terang
  ThemeMode _themeMode = ThemeMode.light;

  void toggleTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
