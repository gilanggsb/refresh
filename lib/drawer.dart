import 'package:flutter/material.dart';
import 'package:my_homeproyek/components/button.dart';
import 'package:my_homeproyek/main_layout.dart';
import 'package:my_homeproyek/screens/stock_request.dart';
import 'package:my_homeproyek/screens/auth_page.dart';
import 'package:my_homeproyek/screens/home_page.dart';

class MyDrawer extends StatelessWidget {
  Future<void> _showLogoutConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout Confirmation'),
          content: const Text('Are you sure you want to logout?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup pop-up
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Logika logout di sini
                // Misalnya, hapus token sesi atau reset status autentikasi

                // Contoh sederhana: hapus status autentikasi dan arahkan ke layar login
                // (Pastikan untuk mengganti dengan logika sesuai kebutuhan Anda)
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Authpage()),
                  (route) => false,
                );
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Drawer(
      child: WillPopScope(
        onWillPop: () async {
          // Logika logout saat tombol back ditekan
          // Pastikan untuk membersihkan sesi atau informasi pengguna yang diperlukan
          // Misalnya, Anda bisa memanggil fungsi logout di sini
          // Jangan lupa untuk mengatur Navigator.pop jika diperlukan

          // Tampilkan pop-up konfirmasi logout
          await _showLogoutConfirmationDialog(context);

          // Setelah logika logout selesai, kembalikan false untuk mencegah kembali
          return false;
        },
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text(
                "",
                style: TextStyle(color: Colors.black),
              ),
              accountEmail: Text(
                "\n",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(
                    "https://cdn.pixabay.com/photo/2024/01/26/06/34/design-8533480_1280.jpg"),
                fit: BoxFit.cover,
              )),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Beranda"),
              onTap: () {
                Navigator.pop(context); // Tutup drawer
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainLayout()));
              },
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text("Stock Request"),
              onTap: () {
                Navigator.pop(context); // Tutup drawer
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AppointmentPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.money),
              title: Text("Transaksi"),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.emoji_emotions),
              title: Text("Profil"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("Tentang"),
              onTap: () {},
            ),
            Button(
              width: double.infinity,
              title: 'Logout',
              onPressed: () {
                // Logika logout di sini
                // Misalnya, hapus token sesi atau reset status autentikasi

                // Contoh sederhana: hapus status autentikasi dan arahkan ke layar login
                // (Pastikan untuk mengganti dengan logika sesuai kebutuhan Anda)
                _showLogoutConfirmationDialog(context);
              },
              disable: false,
            ),
          ],
        ),
      ),
    ));
  }
}
