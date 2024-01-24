// login_form.dart
import 'package:flutter/material.dart';
import 'package:my_homeproyek/main_layout.dart';
import 'package:my_homeproyek/utils/config.dart';
import 'package:my_homeproyek/components/button.dart';
import 'package:my_homeproyek/api_service.dart'; // Import ApiService

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ApiService apiService = ApiService(); // Gunakan ApiService

  bool obsecurePass = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: usernameController,
            keyboardType: TextInputType.emailAddress,
            cursorColor: Config.PrimaryColor,
            decoration: const InputDecoration(
              hintText: 'Email Address',
              labelText: 'Email',
              alignLabelWithHint: true,
              prefixIcon: Icon(Icons.email_outlined),
              prefixIconColor: Config.SecondaryColor,
            ),
          ),
          Config.spaceSmall,
          TextFormField(
            controller: passwordController,
            keyboardType: TextInputType.visiblePassword,
            cursorColor: Config.PrimaryColor,
            obscureText: obsecurePass,
            decoration: InputDecoration(
                hintText: 'Password',
                labelText: 'Password',
                alignLabelWithHint: true,
                prefixIcon: const Icon(Icons.lock_outline),
                prefixIconColor: Config.PrimaryColor,
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obsecurePass = !obsecurePass;
                      });
                    },
                    icon: obsecurePass
                        ? const Icon(
                            Icons.visibility_off_outlined,
                            color: Colors.black38,
                          )
                        : const Icon(
                            Icons.visibility_outlined,
                            color: Config.PrimaryColor,
                          ))),
          ),
          Config.spaceSmall,
          Button(
            width: double.infinity,
            title: 'Sign In',
            onPressed: () async {
              String USERID = usernameController.text;
              String USERPASSWORD = passwordController.text;

              try {
                Map<String, dynamic> result =
                    await apiService.loginUser(USERID, USERPASSWORD);
                print('Login Result: ${result["code"]}');
                print('Login Result: $result');
                if (result['code'] == "1") {
                  showSuccess("user was successfully login");
                } else {
                  print('Login Failed');
                }
              } catch (error) {
                print('Error: $error');
              }
            },
            disable: false,
          ),
        ],
      ),
    );
  }

  void showSuccess(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Success!"),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MainLayout()),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
