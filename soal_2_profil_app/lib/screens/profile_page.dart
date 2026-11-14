import 'package:flutter/material.dart';
import '../models/profile.dart';
import '../widgets/info_tile.dart';

class ProfilePage extends StatelessWidget {
  final bool isDark;
  final Function(bool) onThemeChanged;

  const ProfilePage({
    super.key,
    required this.isDark,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    // buat mnggil data yg ad di model, profil.dart ny
    final profile = Profile.defaultProfile();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        actions: [
          // ini buat gnti tema ny
          Switch(
            value: isDark,
            onChanged: onThemeChanged,
            activeColor: Colors.white,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 32),
            // buat mnculin foto ny 
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(profile.foto),
            ),
            const SizedBox(height: 16),
            
            // Nama dn nim
            Text(
              profile.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'NIM: ${profile.nim}',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            
            // Prodi dn kelas
            Text(
              '${profile.prodi} | ${profile.kelas}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            
            const Divider(),
            
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Informasi Kontak', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
            
            // ini mnggil widget info_tile ny
            InfoTile(
              icon: Icons.email,
              title: 'Email',
              subtitle: profile.email,
            ),
            InfoTile(
              icon: Icons.phone,
              title: 'Nomor HP',
              subtitle: profile.phone,
            ),
            InfoTile(
              icon: Icons.link,
              title: 'GitHub',
              subtitle: profile.github,
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}