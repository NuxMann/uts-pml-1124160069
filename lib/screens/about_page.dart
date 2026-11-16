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

    return Scaffold(
      appBar: AppBar(title: const Text("Tentang Saya")),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text("Keahlian & Hobi", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ...keahlianList.map((keahlian) => Card(
                child: ListTile(
                  leading: const Icon(Icons.check_circle, color: Colors.green),
                  title: Text(keahlian),
                ),
              )),
          const SizedBox(height: 24),
          const Text("Riwayat Pendidikan", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ...pendidikanList.map((edu) => Card(
                child: ListTile(
                  leading: const Icon(Icons.school, color: Colors.indigo),
                  title: Text(edu["jenjang"]!),
                  subtitle: Text("${edu["institusi"]}\nTahun: ${edu["tahun"]}"),
                  isThreeLine: true,
                ),
              )),
        ],
      ),
    );
  }
}