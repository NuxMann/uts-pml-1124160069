import 'package:flutter/material.dart';
import 'package:soal2_profil_app/models/profile.dart';


class ProfilePage extends StatefulWidget {
  final Profile profile;
  final Function(bool) onThemeChanged;
  final bool isDarkMode;

  ProfilePage({
    super.key,
    required this.profile,
    required this.onThemeChanged,
    required this.isDarkMode,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}