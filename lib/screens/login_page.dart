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
      bio: "Mahasiswa Software Engineering & Enthusiast Mobile Developer.",
      email: "fahry@mhs.globalinstitute.ac.id",
      hp: "081234567890",
      github: "github.com/NuxMann",
    );
    return const Placeholder();
  }
}