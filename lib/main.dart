import 'dart:js';

import 'package:demo/List_view.dart';
import 'package:demo/dashboard.dart';
import 'package:demo/login.dart';
import 'package:demo/offers.dart';
import 'package:demo/Profile/profile.dart';
import 'package:demo/splash.dart';
import 'package:demo/utils/default_firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:demo/registration_form.dart';

void main() {
  initializeFirebase();
  runApp(MaterialApp(
    theme: ThemeData(
      useMaterial3: false,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    ),
    routes: {
      '/': (context) => splash(),
      '/registration_form': (context) => RegistrationForm(),
      '/login_Form': (context) => Login(),
      '/dashboard': (context) => Dashboard(),
      '/List_view': (context) => ListViewPage(),
      '/mainApp': (context) => MyApp(),
      '/profile':(context) => profilePage(),
    },
    initialRoute: '/',
    debugShowCheckedModeBanner: false,
  ));
}

void initializeFirebase() async{
  await Firebase.initializeApp(options: DefaultFirebaseOptions.web);
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final pages = [
    Dashboard(),
    ListViewPage(),
    offerPage(),
    profilePage(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List View',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Offers',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.blue,
          ),
        ],
        onTap: (index) {
          print('Selected Index $index');
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
      ),

      body: pages.elementAt(_currentIndex),
    );
  }
}
