import 'package:flutter/material.dart';
import 'package:my_homeproyek/components/button.dart';
import 'package:my_homeproyek/main_layout.dart';
import 'package:my_homeproyek/screens/appointment_page.dart';
import 'package:my_homeproyek/screens/auth_page.dart';
import 'package:my_homeproyek/screens/home_page.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Drawer(
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
                          "https://cdn.pixabay.com/photo/2024/01/24/02/59/design-8528673_1280.jpg"),
                      fit: BoxFit.cover)),
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
              title: Text("Pegawai"),
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
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Authpage()),
                  );
                },
                disable: false)
          ],
        ),
      ),
    );
  }
}
