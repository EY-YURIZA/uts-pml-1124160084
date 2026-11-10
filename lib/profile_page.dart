import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        actions: [
          IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
        ],
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                ProfileHeader(),
                SizedBox(height: 24),
                ProfileCards(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Selamat Datang DI Profil Saya')),
          );
        },
        child: const Icon(Icons.thumb_up),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundColor: Colors.deepPurple,
          child: Icon(Icons.person, size: 60, color: Colors.white),
        ),
        const SizedBox(height: 16),
        Text(
          'Aditya Ramadhan Khiang',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'NIM: 1124160084',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 4),
        Text(
          'Teknik Informatika - TI SE 2',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.grey,
          ),
        ),
      ],
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
      leading: Icon(icon, color: Colors.deepPurple),
      title: Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
      subtitle: Text(value),
    );
  }
}

class ProfileCards extends StatelessWidget {
  const ProfileCards({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Kontak Pribadi', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Card(
          elevation: 2,
          margin: EdgeInsets.only(top: 8, bottom: 16),
          child: Column(
            children: [
              InfoTile(icon: Icons.email, label: 'Email', value: 'rafalfinrafin431@gmail.com'),
              InfoTile(icon: Icons.phone, label: 'Nomor HP', value: '08765478875'),
              InfoTile(icon: Icons.class_, label: 'Kelas', value: 'TI SE 2'),
              InfoTile(icon: Icons.code, label: 'GitHub', value: '@EY_YURIZA'),
            ],
          ),
        ),
        Text('Keahlian & Hobi', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Card(
          elevation: 2,
          margin: EdgeInsets.only(top: 8),
          child: Column(
            children: [
              InfoTile(icon: Icons.developer_mode, label: 'Flutter App Developer', value: 'Membuat aplikasi mobile'),
              InfoTile(icon: Icons.terminal, label: 'Python Scripting', value: 'Automasi & Bot'),
              InfoTile(icon: Icons.design_services, label: 'UI/UX Design', value: 'Desain tampilan Figma'),
              InfoTile(icon: Icons.pool, label: 'Berenang', value: 'Olahraga & kebugaran'),
              InfoTile(icon: Icons.sports_esports, label: 'Gaming', value: 'Mobile Legends, GTA V, Roblox'),
            ],
          ),
        ),
      ],
    );
  }
}