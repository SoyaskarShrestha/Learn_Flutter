import 'package:demo/Profile/profile_view.dart';
import 'package:demo/Service/firebase_database_service.dart';
import 'package:flutter/material.dart';

class profilePage extends StatelessWidget {
  profilePage({super.key});

  List<dynamic> usersList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: FirebaseDatabaseService().getUsersInACollection(),
        builder: (context, snapshot){
         if(snapshot.hasError){
           return Center(
             child: Text('Error Fetching Users Data'),
           );
         }
         if(snapshot.connectionState == ConnectionState.done){
           usersList = snapshot.data as List;
           return ProfileView();
         }
         return Center(
           child:
           SizedBox(
             child: SizedBox(
               child: CircularProgressIndicator(),
               height: 50,
               width: 50,
             ),
           ),
         );
        },
      ),
    );
  }
}
