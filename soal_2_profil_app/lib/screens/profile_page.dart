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
    final profile = Profile.defaultProfile();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        actions: [
          Switch(
            value: isDark,
            onChanged: onThemeChanged,
            activeColor: Colors.white,
          ),
        ],
      ),
      
      // ini buat menu smping atau sidebar
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blueAccent),
              child: Text(
                'Menu Navigasi',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profil'),
              onTap: () {
                Navigator.pop(context); // ini buat nutup
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Tentang Saya'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/about'); // buat ke aboutpage
              },
            ),
          ],
        ),
      ),
      
     
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Tombol ini belum bisa diklik sebelum kita buat halaman Edit
          Navigator.pushNamed(context, '/edit'); 
        },
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        child: const Icon(Icons.edit),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 32),
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(profile.foto),
            ),
            const SizedBox(height: 16),
            Text(
              profile.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'NIM: ${profile.nim}',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 8),
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