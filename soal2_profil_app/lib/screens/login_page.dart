import 'package:flutter/material.dart';
import '../models/profile.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final initialProfile = Profile(
      nama: "Fahry Achmad Wibowo",
      nim: "1124160069",
      prodi: "Teknik Informatika",
      kelas: "TI SE 24 Malam",
      bio: "Hanya Manusia Biasa Yang Suka Coding.",
      email: "fahryamd06@gmail.com",
      hp: "085156714674",
      github: "github.com/NuxMann",
    );
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.school, size: 80, color: Colors.indigo),
              const SizedBox(height: 16),
              const Text("Aplikasi Profil Mahasiswa", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text("Silakan masuk untuk melihat profil akademik", style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  // Navigasi ke Halaman Profil dan kirim data awal
                  Navigator.pushReplacementNamed(
                    context,
                    '/profile',
                    arguments: initialProfile,
                  );
                },
                icon: const Icon(Icons.login),
                label: const Text("LOGIN", style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}