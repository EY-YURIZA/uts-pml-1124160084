import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _processLogin() async {
    // ngecek ap kosong atau kurang dari 6 angka 
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true; // animsi login
      });

      // sy ksi waktu 2 detik untuk cek vlidasi
      await Future.delayed(const Duration(seconds: 2));

      if (!mounted) return;
      
      // ini cntoh untuk user dn password ny
      String inputUsername = _usernameController.text;
      String inputPassword = _passwordController.text;

      // dicek apkh benar atau salah 
      if (inputUsername == 'aditya' && inputPassword == '123456') {
        // jdi klo bner dia akan msuk ke tampilan slnjutnya
        Navigator.pushReplacementNamed(context, '/profile');
      } else {
        // trus klo slh dia nampiling peringatan eror sprti user/sandi salah
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Username atau Password salah!'),
            backgroundColor: Colors.redAccent,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.account_circle, size: 100, color: Colors.blueAccent),
                const SizedBox(height: 24),
                const Text(
                  'Selamat Datang',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 32),
                
                // msukin userny
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Username tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                
                // msukin passowrd
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password tidak boleh kosong';
                    }
                    if (value.length < 6) {
                      return 'Password minimal 6 karakter';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                
                // Tombol login ny
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: _isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : ElevatedButton(
                          onPressed: _processLogin,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('LOGIN', style: TextStyle(fontSize: 16)),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}