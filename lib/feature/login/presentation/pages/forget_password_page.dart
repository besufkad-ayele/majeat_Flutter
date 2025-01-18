import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:majeat/core/shared/widgets/custom_floating_action_button.dart';

class ForgetPasswordPage extends StatelessWidget {
  ForgetPasswordPage({super.key});
  final _emailPhoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future resetPassword() async {
      try {
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: _emailPhoneController.text.trim());
            showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('gO TO YOUR EMAIL WE HAVE SENT RESET PAGE'),
            );
          },
        );
      } on FirebaseAuthException catch (e) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          },
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter Your Email You want to Reset',
              textAlign: TextAlign.center,
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
            CustomFloatingActionButton(
                alignment: Alignment.bottomCenter,
                onPressed: resetPassword,
                BtnTitile: 'Reset Password')
          ],
        ),
      ),
    );
  }
}
