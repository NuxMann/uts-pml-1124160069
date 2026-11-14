import 'package:flutter/material.dart';
import 'package:soal2_profil_app/models/profile.dart';
import '../widgets/info_tile.dart';
import 'edit_profile_page.dart';


class ProfilePage extends StatefulWidget {
  final Profile profile;
  final Function(bool) onThemeChanged;
  final bool isDarkMode;

  const ProfilePage({
    super.key,
    required this.profile,
    required this.onThemeChanged,
    required this.isDarkMode,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Profile _currentProfile;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentProfile = widget.profile;
  }
  // Fungsi untuk membuka halaman edit via Navigator.push dan menerima data balik
  void _navigateToEdit() async {
    final updatedProfile = await Navigator.push<Profile>(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfilePage(profile: _currentProfile),
      ),
    );

    if (updatedProfile != null) {
      setState(() {
        _currentProfile = updatedProfile;
      });
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Profil berhasil diperbarui!")),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Halaman Profil"),
        actions: [
          // Switch Dark/Light Mode langsung di AppBar
          IconButton(
            icon: Icon(widget.isDarkMode ? Icons.dark_mode : Icons.light_mode),
            onPressed: () => widget.onThemeChanged(!widget.isDarkMode),
          ),
        ],
      ),
      // 1. Komponen Scaffold Tambahan: Drawer
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(_currentProfile.nama),
              accountEmail: Text(_currentProfile.email),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
              decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Profil Saya"),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text("Tentang Saya"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/about');
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text("Logout", style: TextStyle(color: Colors.red)),
              onTap: () => Navigator.pushReplacementNamed(context, '/'),
            ),
          ],
        ),
      ),
      // Isi Halaman Profil Utama
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            // Foto diri dari assets dengan CircleAvatar
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
            const SizedBox(height: 16),
            Text(_currentProfile.nama, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text("${_currentProfile.nim} | ${_currentProfile.prodi}", style: const TextStyle(color: Colors.grey)),
            Text(_currentProfile.kelas, style: const TextStyle(fontWeight: FontWeight.w500)),
            const SizedBox(height: 12),
            Card(
              color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.4),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(_currentProfile.bio, textAlign: TextAlign.center, style: const TextStyle(fontStyle: FontStyle.italic)),
              ),
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Informasi Kontak", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 8),
            InfoTile(icon: Icons.email, title: "Email", subtitle: _currentProfile.email),
            InfoTile(icon: Icons.phone, title: "Nomor HP", subtitle: _currentProfile.hp),
            InfoTile(icon: Icons.code, title: "Akun GitHub", subtitle: _currentProfile.github),
          ],
        ),
      ),
      );
  }
}