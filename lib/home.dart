import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:majeat/feature/login/model/user_login.dart';

class HomeBase extends StatelessWidget {
   HomeBase({super.key});
final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        children: [
          Text('HomeBase user logged in as :${user.email!}'),
          MaterialButton(onPressed: (){
            FirebaseAuth.instance.signOut();
          },
          child: Text('signout'),)
        ],
      ),),
    );
  }
}