import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_homeproyek/components/button.dart';
import 'package:my_homeproyek/utils/config.dart';
import 'package:my_homeproyek/utils/text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> medCat = [
    {
      "icon": FontAwesomeIcons.userDoctor,
      "category": "General",
    },
    {
      "icon": FontAwesomeIcons.heartPulse,
      "category": "Cardiology",
    },
    {
      "icon": FontAwesomeIcons.lungs,
      "category": "Respirations",
    },
    {
      "icon": FontAwesomeIcons.hand,
      "category": "Dermatology",
    },
    {
      "icon": FontAwesomeIcons.personPregnant,
      "category": "Gynecology",
    },
    {
      "icon": FontAwesomeIcons.teeth,
      "category": "Dental",
    },
  ];
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Adhit',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/profile1.jpg'),
                    ),
                  ),
                ],
              ),
              Config.spaceMedium,
              const Text(
                'Category',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Config.spaceSmall,
              SizedBox(
                height: Config.heightSize * 0.05,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List<Widget>.generate(medCat.length, (index) {
                    return Card(
                      margin: const EdgeInsets.only(right: 20),
                      color: Config.PrimaryColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            FaIcon(
                              medCat[index]['icon'],
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              medCat[index]['category'],
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const Text(
                'Appointment Today',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Config.spaceSmall,
              const Text(
                'Top Doctors',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Config.spaceSmall,
            ])),
      ),
    );
  }
}

// Widget _buildDrawer(BuildContext context) {
//   return SizedBox(
//     //membuat menu drawer
//     child: Drawer(
//       //membuat list,
//       //list digunakan untuk melakukan scrolling jika datanya terlalu panjang
//       child: ListView(
//         padding: EdgeInsets.zero,
//         //di dalam listview ini terdapat beberapa widget drawable
//         children: [
//           UserAccountsDrawerHeader(
//             //membuat gambar profil

//             currentAccountPicture:
//                 Image(image: AssetImage('assets/profile1.jpg')),
//             //membuat nama akun
//             accountName: Text("Adhitya Hadi Saputra"),
//             //membuat nama email
//             accountEmail: Text(""),
//             //memberikan background
//             decoration: BoxDecoration(
//                 image: DecorationImage(
//                     image: NetworkImage(
//                         "https://cdn.pixabay.com/photo/2016/04/24/20/52/laundry-1350593_960_720.jpg"),
//                     fit: BoxFit.cover)),
//           ),
//           //membuat list menu
//           ListTile(
//             leading: Icon(Icons.home),
//             title: Text("Beranda"),
//             onTap: () {},
//           ),
//           ListTile(
//             leading: Icon(Icons.people),
//             title: Text("Pegawai"),
//             onTap: () {},
//           ),
//           ListTile(
//             leading: Icon(Icons.money),
//             title: Text("Transaksi"),
//             onTap: () {},
//           ),
//           Divider(),
//           ListTile(
//             leading: Icon(Icons.emoji_emotions),
//             title: Text("Profil"),
//             onTap: () {},
//           ),
//           ListTile(
//             leading: Icon(Icons.info),
//             title: Text("Tentang"),
//             onTap: () {},
//           ),
//           Button(
//               width: double.infinity,
//               title: 'Logout',
//               onPressed: () {
//                 Navigator.of(context).pushNamed('logout');
//               },
//               disable: false)
//         ],
//       ),
//     ),
//   );
// }
