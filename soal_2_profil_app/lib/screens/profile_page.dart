import 'package:flutter/material.dart';
import '../models/profile.dart';
import '../widgets/info_tile.dart';

class ProfilePage extends StatefulWidget {
  final bool isDark;
  final Function(bool) onThemeChanged;

  const ProfilePage({
    super.key,
    required this.isDark,
    required this.onThemeChanged,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // untuk nyimpen profil
  late Profile _currentProfile;

  @override
  void initState() {
    super.initState();
    //ngambil data awal
    _currentProfile = Profile.defaultProfile();
  }

  
  Future<void> _navigateAndEditProfile(BuildContext context) async {
   
    final updatedProfile = await Navigator.pushNamed(context, '/edit');

    
    if (updatedProfile != null && updatedProfile is Profile) {
      setState(() {
        _currentProfile = updatedProfile;
      });
      
    
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Profil berhasil diperbarui!'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        actions: [
          Switch(
            value: widget.isDark,
            onChanged: widget.onThemeChanged,
            activeColor: Colors.white,
          ),
        ],
      ),
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
                Navigator.pop(context); 
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Tentang Saya'),
              onTap: () {
                Navigator.pop(context); 
                Navigator.pushNamed(context, '/about'); 
              },
            ),
          ],
        ),
      ),
      // 
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateAndEditProfile(context),
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
              backgroundImage: AssetImage(_currentProfile.foto), 
            ),
            const SizedBox(height: 16),
            Text(
              _currentProfile.name, 
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'NIM: ${_currentProfile.nim}',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Text(
              '${_currentProfile.prodi} | ${_currentProfile.kelas}',
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
              subtitle: _currentProfile.email,
            ),
            InfoTile(
              icon: Icons.phone,
              title: 'Nomor HP',
              subtitle: _currentProfile.phone,
            ),
            InfoTile(
              icon: Icons.link,
              title: 'GitHub',
              subtitle: _currentProfile.github,
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}