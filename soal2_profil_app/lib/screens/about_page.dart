import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Deklarasikan variabel list di bagian atas method build (sebelum return)
    final List<String> keahlianList = [
      "Mobile Development",
      "Web Development",
      "Desain Grafis",
      "Inventory Control",
    ];

    final List<Map<String, dynamic>> hobiList = [
      {"hobi": "Bermain Game", "icon": Icons.sports_esports},
      {"hobi": "Sepak Bola", "icon": Icons.sports_soccer},
      {"hobi": "Fotografi", "icon": Icons.camera_alt},
      {"hobi": "Traveling", "icon": Icons.travel_explore},
      {"hobi": "Menonton Film & Serial", "icon": Icons.movie},
      {"hobi": "Menjelajahi Alam / Hiking", "icon": Icons.terrain},
      {"hobi": "Membaca Buku", "icon": Icons.menu_book},
      {"hobi": "Coding", "icon": Icons.code},
    ];

    final List<Map<String, String>> pendidikanList = [
      {
        "jenjang": "Strata 1 (S1) - Teknik Informatika",
        "institusi": "Institut Teknologi & Bisnis Bina Sarana Global",
        "tahun": "2024 - Sekarang"
      },
      {
        "jenjang": "Sekolah Menengah Atas / Kejuruan",
        "institusi": "SMKN 5 Kabupaten Tangerang",
        "tahun": "2019 - 2022"
      }
    ];

    // 2. Gunakan variabel di dalam widget tree
    return Scaffold(
      appBar: AppBar(title: const Text("Tentang Saya")),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            "Keahlian",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ...keahlianList.map((keahlian) => Card(
                child: ListTile(
                  leading: const Icon(Icons.check_circle, color: Colors.green),
                  title: Text(keahlian),
                ),
              )),
          const SizedBox(height: 24),

          const Text(
            "Hobi",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          
          ...hobiList.map((item) => Card(
                child: ListTile(
                  leading: Icon(item["icon"], color: Colors.blue), // Mengambil ikon unik per item
                  title: Text(item["hobi"]!),
                ),
              )),
          
          const SizedBox(height: 24),

          const Text(
            "Riwayat Pendidikan",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
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