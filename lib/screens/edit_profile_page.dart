import 'package:flutter/material.dart';
import '../models/profile.dart';

class EditProfilePage extends StatefulWidget {
  final Profile profile;

  const EditProfilePage({super.key, required this.profile});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  
  late TextEditingController _namaController;
  late TextEditingController _emailController;
  late TextEditingController _hpController;
  late TextEditingController _bioController;

  @override
  void initState() {
    super.initState();
    _namaController = TextEditingController(text: widget.profile.nama);
    _emailController = TextEditingController(text: widget.profile.email);
    _hpController = TextEditingController(text: widget.profile.hp);
    _bioController = TextEditingController(text: widget.profile.bio);
  }

  @override
  void dispose() {
    _namaController.dispose();
    _emailController.dispose();
    _hpController.dispose();
    _bioController.dispose();
    super.dispose();
  }
}