import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil : Fahry Achmad Wibowo',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightBlueAccent,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const ProfilePage(),
    );
  }
}

class InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const InfoTile({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.lightBlueAccent),
      title: Text(label),
      subtitle: Text(value),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        actions: [
          IconButton(
            onPressed: () {
              print("Edit Belum Fungsi");
            },
            icon: const Icon(Icons.edit),
            tooltip: 'Edit Profil',
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              
              // --- TAHAP 2c: BAGIAN KEPALA PROFIL (RATA TENGAH & HIERARKI TEKS THEME) ---
              const CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, size: 60, color: Colors.white),
              ),
              const SizedBox(height: 20),
              
              // Nama Lengkap menggunakan headlineSmall dari Theme.of(context).textTheme
              Text(
                'Fahry Achmad Wibowo',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              
              // NIM menggunakan bodyMedium dari Theme.of(context).textTheme
              Text(
                'NIM: 1124160069',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w500,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              
              Text(
                'Teknik Informatika - TI SE 24 Malam',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.lightBlueAccent,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    children: const [
                      InfoTile(
                        icon: Icons.email,
                        label: 'Email',
                        value: 'fahryamd06@gmail.com',
                      ),
                      Divider(),
                      InfoTile(
                        icon: Icons.phone,
                        label: 'Nomor HP',
                        value: '+6285128005481',
                      ),
                      Divider(),
                      InfoTile(
                        icon: Icons.class_,
                        label: 'Kelas',
                        value: 'TI SE 24 Malam',
                      ),
                      Divider(),
                      InfoTile(
                        icon: Icons.code,
                        label: 'Akun GitHub',
                        value: 'github.com/NuxMann',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    children: const [
                      InfoTile(
                        icon: Icons.phone_android,
                        label: 'Mobile Development',
                        value: 'Flutter & Dart',
                      ),
                      Divider(),
                      InfoTile(
                        icon: Icons.web,
                        label: 'Web Development',
                        value: 'PHP CodeIgniter 4, MySQL, HTML/CSS',
                      ),
                      Divider(),
                      InfoTile(
                        icon: Icons.games,
                        label: 'Hobi & Gaming',
                        value: 'Valorant (Yoru/Neon), Game Development',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    print("Tombol Edit Profil Ditekan");
                  },
                  icon: const Icon(Icons.edit),
                  label: const Text('Edit Profil'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Terima kasih telah melihat profil saya"),
              duration: Duration(seconds: 2),
            ),
          );
        },
        child: const Icon(Icons.thumb_up),
        tooltip: 'Sapa',
      ),
    );
  }
}

