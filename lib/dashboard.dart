import 'dart:js_interop_unsafe';
import 'package:flutter/material.dart';
import 'package:demo/Service/dio_service.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List'),
        actions: [
          GestureDetector(child:Icon(Icons.star), onTap: (){
            final dioService = DioService();
            dioService.getSampleData();
          }),
        ],
      ),
      body: Column(children: [
        Image.network('https://149363560.v2.pressablecdn.com/wp-content/uploads/2019/09/sea-4420591_1920.jpg',width: 150,height: 150,),
        SizedBox(height: 30,),
        Text('Nepal',style: TextStyle(fontSize: 30),),
        SizedBox(height: 25,),
        Text('Description 1'),
        SizedBox(height: 25,),
        Text('Description 2')

      ],
      ),
    );
  }
}
