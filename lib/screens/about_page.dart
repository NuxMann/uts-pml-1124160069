import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> keahlianList = [
      "Flutter & Dart Mobile Development",
      "Web Development (PHP, CodeIgniter, Tailwind)",
      "Database Administration (MySQL & PostgreSQL)",
      "Chemical Inventory & Rubber Compound System"
    ];
    final List> pendidikanList = [
      {"jenjang": "Strata 1 (S1) - Teknik Informatika", "institusi": "Institut Teknologi & Bisnis Bina Sarana Global", "tahun": "2024 - Sekarang"},
      {"jenjang": "Sekolah Menengah Atas / Kejuruan", "institusi": "SMK Negeri / Swasta Tangerang", "tahun": "2021 - 2024"}
    ];
  }
}