import 'package:flutter/material.dart';
import 'package:h1d023107_tugas7/pages/side_menu.dart'; 
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _username = "";
  String _password = "";

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('username') ?? "Tidak ditemukan";
      _password = prefs.getString('password') ?? "Tidak ditemukan";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      drawer: const SideMenu(), 
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Informasi Akun Anda:', style: TextStyle(fontSize: 22)),
              const SizedBox(height: 20),
              Text('Username: $_username', style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 10),
              Text('Password: $_password', style: const TextStyle(fontSize: 18)), 
            ],
          ),
        ),
      ),
    );
  }
}