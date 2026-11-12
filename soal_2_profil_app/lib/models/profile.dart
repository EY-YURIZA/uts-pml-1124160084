class Profile {
  String name;
  String nim;
  String prodi;
  String kelas;
  List<String>hobi;
  String email;
  String phone;
  String github;
  String foto;

  Profile({
    required this.name,
    required this.nim,
    required this.prodi,
    required this.kelas,
    required this.hobi,
    required this.email,
    required this.phone,
    required this.github,
    required this.foto,
  });
static Profile defaultProfile() {
    return Profile(
      name: 'Aditya Ramadhan Khiang',
      nim: '1124160084',
      prodi: 'Teknik Informatika - Software Engineering',
      kelas: 'TI SE 2',
      hobi: ['Berenang', 'Gaming (Mobile Legends, GTA V, Roblox)', 'Live Streaming'],
      email: 'rafalfinrafin431@gmail.com',
      phone: '08474747878',
      github: '@EY_YURIZA',
      foto: 'assets/images/aditya.jpg',
    );
  }
}