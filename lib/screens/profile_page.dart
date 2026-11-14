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
      ),);
  }
}