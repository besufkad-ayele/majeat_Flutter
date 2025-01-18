import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:majeat/core/shared/constant/app_constant.dart';
import 'package:majeat/core/shared/widgets/blured_container.dart';
import 'package:majeat/core/shared/widgets/custom_floating_action_button.dart';
import 'package:majeat/feature/home_page/view/pages/MyHomePage.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailPhoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _repeatPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  Future signUp() async {
    if (passwordConfirmed()) {
      print('password confirmed');
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailPhoneController.text.trim(),
          password: _passwordController.text.trim());
      print('firebase created with the email and password');
      Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyHomePage(),
                    ),
                  );
    }
    print('password confirmation not working password');
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            margin: const EdgeInsets.all(30),
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  'MAJEAT ',
                  style: AppConstant.headingStyle,
                ),
                BlurredContainer(
                  padding: const EdgeInsets.all(AppConstant.defaultPadding),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(height: 16.0),
                        TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            prefixIcon: const Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                  color: Colors
                                      .grey), // Optional, can be customized
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                  color: Colors
                                      .blue), // Optional, can be customized
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                  color: Colors
                                      .red), // Optional, can be customized
                            ),
                            errorStyle: const TextStyle(color: Colors.red),
                            hintText: 'Enter your name',
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 16.0),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16.0),
                        TextFormField(
                          controller: _emailPhoneController,
                          decoration: InputDecoration(
                            labelText: 'Email or Phone Number',
                            prefixIcon: const Icon(Icons.email),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.blue),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 16.0),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email or phone number';
                            }
                            // Add more validation logic for email/phone format if needed
                            return null;
                          },
                        ),
                        const SizedBox(height: 16.0),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: const Icon(Icons.lock),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.blue),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 16.0),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a password';
                            }
                            // Add more validation logic for password strength if needed
                            return null;
                          },
                        ),
                        const SizedBox(height: 16.0),
                        TextFormField(
                          controller: _repeatPasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Repeat Password',
                            prefixIcon: const Icon(Icons.lock),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.blue),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 16.0),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please repeat your password';
                            } else if (value != _passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                        CustomFloatingActionButton(
                            alignment: Alignment.bottomCenter,
                            width: 300,
                            onPressed: (){
                              signUp();
                             
                            },
                            BtnTitile: "Sign UP"),
                        const SizedBox(height: 12.0),
                      ],
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 8.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: [
                //       ElevatedButton(
                //         onPressed: () {
                //           // Handle button press
                //         },
                //         style: ElevatedButton.styleFrom(
                //           backgroundColor: Colors.blue,
                //         ),
                //         child: const Text(' green button'),
                //       ),
                //       ElevatedButton(
                //         onPressed: () {
                //         },
                //         style: ElevatedButton.styleFrom(
                //           backgroundColor: Colors.green,
                //         ),
                //         child: const Text('Green Button'),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            )),
      ),
    );
  }
}
