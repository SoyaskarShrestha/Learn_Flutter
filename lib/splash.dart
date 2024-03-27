import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'controller/counter_controller.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    Timer(Duration(seconds: 3),
        () => Navigator.of(context).pushNamed('/mainApp'));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ///Dependency injection of countercontroller object in getX
    Get.put(CounterController());
    return Scaffold(
      body: Center(
        child: Image.asset('Assets/Images/infinity.gif'),
      ),
    );
  }
}
