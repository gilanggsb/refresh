import 'package:flutter/material.dart';
import 'package:my_homeproyek/components/login_form.dart';
import 'package:my_homeproyek/utils/config.dart';
import 'package:my_homeproyek/utils/text.dart';

class Authpage extends StatefulWidget {
  const Authpage({super.key});

  @override
  State<Authpage> createState() => _AuthpageState();
}

class _AuthpageState extends State<Authpage> {
  @override
  Widget build(BuildContext context) {
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
              Align(
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
              LoginForm(),
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
    );
  }
}
