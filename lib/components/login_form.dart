import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_homeproyek/main_layout.dart';
import 'package:my_homeproyek/utils/config.dart';
import 'package:my_homeproyek/components/button.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ApiService apiService = ApiService();
  bool obsecurePass = true;
  bool _isLoading = false;

  // Future<void> _login(BuildContext context) async {
  //   if (_formKey.currentState!.validate()) {
  //     setState(() {
  //       _isLoading = true;
  //     });
  //   }
  //   final String url =
  //       'http://108.136.252.63:8080/refresh/login.php'; // Replace with your API endpoint

  //   try {
  //     final response = await http.post(
  //       Uri.parse(url),
  //       body: {
  //         'USERID': _emailController.text,
  //         'USERPASSWORD': _passController.text,
  //       },
  //     );

  //     if (response.statusCode == 200) {
  //       // Authentication successful, handle the response accordingly
  //       print('Login successful!');
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(builder: (context) => MainLayout()),
  //       );
  //     } else {
  //       print('Login failed: ${response.body}');
  //     }
  //   } catch (e) {
  //     // Handle potential network or server errors
  //     print('Error: $e');
  //   } finally {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   }
  // }

  // void _validateInputs() {
  //   if (_formKey.currentState!.validate()) {
  //     //If all data are correct then save data to out variables
  //     _formKey.currentState!.save();
  //     doLogin(_emailController.text, _passController.text);
  //   }
  // }

  // doLogin(email, password) async {
  //   final GlobalKey<State> _keyLoader = GlobalKey<State>();

  //   try {
  //     final response = await http.post(
  //         Uri.parse("http://108.136.252.63:8080/refresh/login.php"),
  //         headers: {'Content-Type': 'application/json; charset=UTF-8'},
  //         body: jsonEncode({
  //           "USERID": email,
  //           "USERPASSWORD": password,
  //         }));

  //     final output = jsonDecode(response.body);
  //     if (response.statusCode == 200) {
  //       Navigator.of(_keyLoader.currentContext!, rootNavigator: false).pop();
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //             content: Text(
  //           output['message'],
  //           style: const TextStyle(fontSize: 16),
  //         )),
  //       );

  //       if (output['success'] == true) {
  //         saveSession(email);
  //       }
  //       //debugPrint(output['message']);
  //     } else {
  //       Navigator.of(_keyLoader.currentContext!, rootNavigator: false).pop();
  //       //debugPrint(output['message']);
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //             content: Text(
  //           output.toString(),
  //           style: const TextStyle(fontSize: 16),
  //         )),
  //       );
  //     }
  //   } catch (e) {
  //     Navigator.of(_keyLoader.currentContext!, rootNavigator: false).pop();

  //     debugPrint('$e');
  //   }
  // }

  // saveSession(String email) async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   await pref.setString("USERID", email);
  //   await pref.setBool("is_login", true);

  //   Navigator.pushAndRemoveUntil(
  //     context,
  //     MaterialPageRoute(
  //       builder: (BuildContext context) => const MainLayout(),
  //     ),
  //     (route) => false,
  //   );
  // }

  // void ceckLogin() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   var islogin = pref.getBool("is_login");
  //   if (islogin != null && islogin) {
  //     Navigator.pushAndRemoveUntil(
  //       context,
  //       MaterialPageRoute(
  //         builder: (BuildContext context) => const MainLayout(),
  //       ),
  //       (route) => false,
  //     );
  //   }
  // }

  // @override
  // void initState() {
  //   ceckLogin();
  //   super.initState();
  // }

  // @override
  // dispose() {
  //   super.dispose();
  // }

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
              prefixIconColor: Config.PrimaryColor,
            ),
            validator: (USERID) {
              if (USERID == null || USERID.isEmpty) {
                return 'Please enter your username';
              }
              return null;
            },
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
            validator: (USERPASSWORD) {
              if (USERPASSWORD == null || USERPASSWORD.isEmpty) {
                return 'Please enter your username';
              }
              return null;
            },
          ),

          Config.spaceSmall,
          ElevatedButton(
            onPressed: () async {
              String USERID = usernameController.text;
              String USERPASSWORD = passwordController.text;

              try {
                Map<String, dynamic> result =
                    await apiService.loginUser(USERID, USERPASSWORD);

                // Handle the login result
                print('Login Result: $result');

                // Jika login berhasil, pindah ke halaman dashboard
                if (result['success'] == true) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MainLayout()),
                  );
                } else {
                  // Handle login failure, show an error message to the user if needed
                  print('Login Failed');
                }
              } catch (error) {
                // Handle errors, e.g., show an error message to the user.
                print('Error: $error');
              }
            },
            child: Text('Login'),
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

class ApiService {
  final String baseUrl = 'http://108.136.252.63:8080/refresh/login.php';

  Future<Map<String, dynamic>> loginUser(
      String USERID, String USERPASSWORD) async {
    try {
      final response = await http.post(
        Uri.parse(
            '$baseUrl/LOGIN'), // Sesuaikan dengan form action pada API Anda
        body: {
          'ACTION':
              'LOGIN', // Sesuaikan dengan nilai action yang diharapkan oleh API
          'USERID': USERID,
          'USERPASSWORD': USERPASSWORD,
          // ... tambahkan parameter lain jika diperlukan oleh API
        },
      );

      if (response.statusCode == 200) {
        // Jika permintaan berhasil, parsing respons JSON
        Map<String, dynamic> result = jsonDecode(response.body);
        return result;
      } else {
        // Jika permintaan gagal, lemparkan exception
        throw Exception('Failed to login');
      }
    } catch (error) {
      print('Error: $error');
      throw error;
    }
  }
}
