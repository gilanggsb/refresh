import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_homeproyek/main_layout.dart';
import 'package:my_homeproyek/utils/config.dart';
import 'package:my_homeproyek/components/button.dart';
import 'package:http/http.dart' as http;

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  bool obsecurePass = true;
  bool _isLoading = false;

  Future<void> _login(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
    }
    final String url =
        'http://108.136.252.63:8080/refresh/login.php'; // Replace with your API endpoint

    try {
      final response = await http.post(
        Uri.parse(url),
        body: {
          'USERID': _emailController.text,
          'USERPASSWORD': _passController.text,
        },
      );

      if (response.statusCode == 200) {
        // Authentication successful, handle the response accordingly
        print('Login successful!');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainLayout()),
        );
      } else {
        print('Login failed: ${response.body}');
      }
    } catch (e) {
      // Handle potential network or server errors
      print('Error: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            cursorColor: Config.PrimaryColor,
            decoration: const InputDecoration(
              hintText: 'Email Address',
              labelText: 'Email',
              alignLabelWithHint: true,
              prefixIcon: Icon(Icons.email_outlined),
              prefixIconColor: Config.PrimaryColor,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your username';
              }
              return null;
            },
          ),
          Config.spaceSmall,
          TextFormField(
            controller: _passController,
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
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your username';
              }
              return null;
            },
          ),

          Config.spaceSmall,
          ElevatedButton(
            onPressed: _isLoading ? null : () => _login(context),
            child: _isLoading ? CircularProgressIndicator() : Text('Login'),
          ),
          // Button(
          //     width: double.infinity,
          //     title: 'Sign In',
          //     onPressed: () => {
          //           if (_formKey.currentState!= null)
          //             {_formKey.currentState!.validate()},
          //           {userLogin()}
          //         },
          //     disable: false)
        ],
      ),
    );
  }
}
