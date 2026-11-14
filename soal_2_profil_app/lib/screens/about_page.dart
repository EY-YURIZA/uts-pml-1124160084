import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Saya'),
      ),
      //ini buat listview
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Riwayat Pendidikan',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Card(
            child: ListTile(
              leading: Icon(Icons.school, color: Colors.blueAccent),
              title: Text('Global Institute'),
              subtitle: Text('S1 Teknik Informatika - Software Engineering'),
            ),
          ),
          
          const SizedBox(height: 24),
          
          const Text(
            'Keahlian & Hobi',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Card(
            child: ListTile(
              leading: Icon(Icons.pool, color: Colors.blueAccent),
              title: Text('Berenang'),
            ),
          ),
          const Card(
            child: ListTile(
              leading: Icon(Icons.sports_esports, color: Colors.blueAccent),
              title: Text('Gaming (Mobile Legends, GTA V, Roblox)'),
            ),
          ),
          const Card(
            child: ListTile(
              leading: Icon(Icons.live_tv, color: Colors.blueAccent),
              title: Text('Live Streaming'),
            ),
          ),
        ],
      ),
    );
  }
}