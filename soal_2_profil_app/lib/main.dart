import 'package:flutter/material.dart';
import 'screens/login_page.dart';
import 'screens/profile_page.dart';
import 'screens/edit_profile_page.dart';
import 'screens/about_page.dart';

void main() {
  runApp(const MyApp());
}

//buat ganti tema
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //bisa menyimpan tema
  ThemeMode _themeMode = ThemeMode.light;

  // tombol ganti tema
  void toggleTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil Aditya Ramadhan Khiang',
      debugShowCheckedModeBanner: false,
      
    
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent,
          brightness: Brightness.dark,
        ),
        brightness: Brightness.dark,
      ),
      
     
      themeMode: _themeMode,
      
     
      initialRoute: '/', // ini buat hlaman login dn hlaman slanjutnya
      routes: {
        '/': (context) => const LoginPage(),
        '/profile': (context) => ProfilePage(
              isDark: _themeMode == ThemeMode.dark,
              onThemeChanged: toggleTheme,
            ),
        '/edit': (context) => const EditProfilePage(),
        '/about': (context) => const AboutPage(),
      },
    );
  }
}