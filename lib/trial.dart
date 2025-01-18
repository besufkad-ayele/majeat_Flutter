import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:majeat/feature/home_page/view/pages/MyHomePage.dart';
import 'package:majeat/feature/login/presentation/pages/login.dart';
import 'package:majeat/home.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: StreamBuilder<User?>(  
        
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          print('user alldetail'+snapshot.data.toString());
          print(snapshot.error);
          if(snapshot.hasData){
            return MyHomePage();
          }else{
            return Loginpage();
          }
        },
      ),
    );
  }
}