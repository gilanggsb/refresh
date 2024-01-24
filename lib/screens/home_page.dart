import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_homeproyek/components/button.dart';
import 'package:my_homeproyek/drawer.dart';
import 'package:my_homeproyek/screens/appointment_page.dart';
import 'package:my_homeproyek/screens/auth_page.dart';
import 'package:my_homeproyek/utils/config.dart';
import 'package:my_homeproyek/utils/text.dart';
import 'package:http/http.dart' as http;
import '../components/login_form.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beranda'),
      ),
      drawer: MyDrawer(), // Tambahkan drawer di sini
      body: Center(
        child: Text('This is the Appointments Page'),
      ),
    );
  }
}
