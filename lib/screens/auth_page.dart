import 'package:flutter/material.dart';
import 'package:my_homeproyek/components/login_form.dart';
import 'package:my_homeproyek/utils/config.dart';
import 'package:my_homeproyek/utils/text.dart';

import '../utils/storage.dart';

class Authpage extends StatefulWidget {
  const Authpage({super.key});

  @override
  State<Authpage> createState() => _AuthpageState();
}

class _AuthpageState extends State<Authpage> {
  StorageService storageService = StorageService.instance;
  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    await storageService.initStorage();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Align(
                    alignment: Alignment.topCenter,
                    child: Image(
                      image: NetworkImage(
                          "https://cdn.pixabay.com/photo/2024/01/26/06/34/design-8533480_1280.jpg"),
                      fit: BoxFit.cover,
                      width: 150,
                      height: 150,
                    )),
                // Text(
                //   AppText.enText['welcome_text']!,
                //   style: const TextStyle(
                //     fontSize: 36,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                Config.spaceSmall,
                Text(
                  AppText.enText['SignIn_text']!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Config.spaceSmall,
                const LoginForm(),
                Config.spaceSmall,
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      AppText.enText['forgot-password']!,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
