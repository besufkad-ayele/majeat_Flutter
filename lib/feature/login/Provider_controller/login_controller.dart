import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:majeat/feature/login/model/user_login.dart';

class LoginController with ChangeNotifier {
  List<User> _users = []; // List to hold user objects
  List<User> get users => _users;
  // User? signedinUser = [
  //   User(name: 'bese', email: 'a', image: 'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=300', password: 'passme', location: 'Adiss'),
  // ];
  List<User>? signedinUser = [
  User(
    id: 3,
    name: 'bese',
    email: 'a',
    image: 'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=300',
    password: 'passme',
    location: 'Adiss',
  ),
];


  LoginController() {
    loadUsers();
  }
  Future<void> loadUsers() async {
    try {
      String usersJson = await rootBundle.loadString('assets/data/user_profiles.json');
      List<dynamic> jsonList = json.decode(usersJson);

      _users = jsonList.map((json) => User.fromJson(json as Map<String, dynamic>)).toList();
      print('Loaded ${_users.length} users');
      if (_users.isNotEmpty) {
      }
    } catch (e) {
      print('Error loading users: $e');
    }
    notifyListeners();
  }
  // Authentication method
  bool authenticate(String email, String password) {
    for (User user in _users) {
      if (user.email == email && user.password == password) {
        signedinUser = _users; 
        notifyListeners(); 
        return true; 
      }
    }
    return false; 
  }
  void displaysnackbar(BuildContext context){
     ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Successful'),
                      backgroundColor: const Color.fromARGB(255, 210, 177, 46),
                      behavior: SnackBarBehavior.floating,
                      duration: const Duration(seconds: 2),
                      action: SnackBarAction(
                        label: 'Close',
                        textColor: Colors.white,
                        onPressed: () {
                          // Code to execute.
                        },
                      ),
                    ),
                  );
  }
  void displayUser() {
    if (signedinUser != null) {
      print('Signed-in user: ${signedinUser![0].email}');
    } else {
      print('No user signed in ');
    }
  }
}
