import 'package:flutter/material.dart';
import 'package:my_homeproyek/drawer.dart';
import 'package:my_homeproyek/screens/appointment_page.dart';
import 'package:my_homeproyek/screens/home_page.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentPage = 0;
  final PageController _page = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
      ),
      drawer: MyDrawer(),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            'assets/5.png',
            fit: BoxFit.cover,
          ),
          // PageView
          PageView(
            controller: _page,
            onPageChanged: ((value) {
              setState(() {
                currentPage = value;
              });
            }),
          ),
        ],
      ),
    );
  }
}
