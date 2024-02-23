import 'dart:async';

import 'package:flutter/material.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {

  @override
  void initState() {
    Timer(Duration(seconds: 3),()=> Navigator.of(context).pushNamed('/profile'));
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('Assets/Images/infinity.gif'),
      ),
    );
  }
}
