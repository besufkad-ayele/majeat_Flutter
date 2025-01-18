import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:majeat/core/shared/constant/app_constant.dart';
import 'package:majeat/core/shared/widgets/blured_container.dart';
import 'package:majeat/core/shared/widgets/custom_floating_action_button.dart';
import 'package:majeat/feature/home_page/view/pages/MyHomePage.dart';
import 'package:majeat/feature/login/Provider_controller/login_controller.dart';
import 'package:majeat/feature/login/presentation/pages/forget_password_page.dart';
import 'package:majeat/feature/login/presentation/pages/signup_page.dart';
import 'package:provider/provider.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<Loginpage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailPhoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool rememberMe = false;
  void _onRememberMeChanged(bool? newValue) {
    setState(() {
      rememberMe = newValue ?? false;
    });
    print('Remember Me: $rememberMe');
  }

  Future signin() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailPhoneController.text.trim(),
        password: _passwordController.text.trim());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailPhoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    LoginController logincontroller = context.watch<LoginController>();
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Container(
            margin: const EdgeInsets.all(30),
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'MAJEAT',
                    // style: GoogleFonts.poppins(

                    // ),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      wordSpacing: 10,
                      fontSize: 50,
                    ),
                  ),
                  BlurredContainer(
                    padding: const EdgeInsets.all(AppConstant.defaultPadding),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(height: 16.0),
                          TextFormField(
                            controller: _emailPhoneController,
                            decoration: InputDecoration(
                              hoverColor: Colors.grey[200],
                              labelText: 'Email or Phone Number',
                              prefixIcon: const Icon(Icons.email),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 147, 150, 153)),
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
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 134, 134, 134)),
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
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: rememberMe,
                                        onChanged: _onRememberMeChanged,
                                      ),
                                      const Text('Remember Me'),
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ForgetPasswordPage(),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      'Forgot Password?',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                              CustomFloatingActionButton(
                                  alignment: Alignment.bottomCenter,
                                  width: 300,
                                  backgroundColor:
                                      const Color.fromARGB(255, 244, 181, 54),
                                  // onPressed: () {
                                  //   if (_formKey.currentState!.validate()) {
                                  //     if (logincontroller.authenticate(
                                  //         _emailPhoneController.text,
                                  //         _passwordController.text)) {
                                  //       Navigator.push(
                                  //         context,
                                  //         MaterialPageRoute(
                                  //           builder: (context) =>
                                  //               const MyHomePage(),
                                  //         ),
                                  //       );
                                  //       logincontroller
                                  //           .displaysnackbar(context);
                                  //       _emailPhoneController.clear();
                                  //       _passwordController.clear();
                                  //     } else {
                                  //       print('not authenticated correctly');
                                  //     }
                                  //   }
                                  // },
                                  onPressed: signin,
                                  BtnTitile: ' SIGN IN '),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Don\'t have an Account? '),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const SignupPage(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'sign up',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 12.0),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text('or continue with'),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        BlurredContainer(
                            padding: EdgeInsets.all(16),
                            backgroundColor: Colors.green,
                            child: Text('facebook')),
                        BlurredContainer(
                            padding: EdgeInsets.all(16),
                            backgroundColor: Colors.blue,
                            child: Text('google'))
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
