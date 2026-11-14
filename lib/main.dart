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
    return MaterialApp(
      title: 'Profil Mahasiswa',
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      // Tema Terang Kustom
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo, brightness: Brightness.light),
        useMaterial3: true,
      ),
      // Tema Gelap Kustom
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo, brightness: Brightness.dark),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const LoginPage(),
        '/profile': (context) {
          final profile = ModalRoute.of(context)!.settings.arguments as Profile;
          return ProfilePage(
            profile: profile,
            onThemeChanged: toggleTheme,
            isDarkMode: _themeMode == ThemeMode.dark,
          );
        },
        '/about': (context) => const AboutPage(),
      },
      );
  }
}
