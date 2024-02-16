import 'package:flutter/material.dart';

class Login_Form extends StatefulWidget {
  const Login_Form({super.key});

  final String a= "Hello";

  @override
  State<Login_Form> createState() => _Login_FormState();
}

class _Login_FormState extends State<Login_Form> {
  int _value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            _value += 1;
          });

        },
        child: Icon(Icons.plus_one),
      ),
      body: Center(child: Text('${widget.a} The value is $_value')),
    );
  }
}

