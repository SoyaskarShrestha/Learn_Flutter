import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/Model/user_model.dart';
import 'package:flutter/foundation.dart';

class FirebaseDatabaseService{
  final dbInstance = FirebaseFirestore.instance;
  final usersList = [];

  Future getSingleUser() async{
    try{
      CollectionReference userCollection = dbInstance.collection('users');
      final userDoc = await userCollection.doc('user1').get();
      if(userDoc.exists){
        print('The user1 Details is ${userDoc.data()}');
      }
      else{
        print('Data not found');
      }
    }
    catch(e) {
      print('Error fetching Data $e');

    }
  }
  /// this function is used to get list of users from a collection in firebase
  Future getUsersInACollection() async{
    try{
      CollectionReference _usersCollection = await dbInstance.collection('users');
      await _usersCollection.get().then((querySnapShot){
        for(var doc in querySnapShot.docs){
          usersList.add(doc.data());
        }

      });
      print('Users list ${usersList.length}');
      return usersList;
    }catch(e){
      print('Error while getting users $e');
    }
  }

  ///Create a user in firestore database
  void createUser({required UserModel userModel})async{
    try{
      CollectionReference _usersCollection =
      await dbInstance.collection('users');
      await _usersCollection.add(userModel.toJson()).whenComplete((){
        print('user created successfully');
      });
    }catch(e){
      print('Something went wrong $e');
    }
  }


  /// This function is used to get user details using uid
  Future<UserModel?>getUserDetailsUsingUID({required String uId}) async{
    try{
      CollectionReference _usersCollection = await dbInstance.collection('users');
      final snapShot = await _usersCollection.where('id',isEqualTo: uId).get();
      final userModel = snapShot.docs.map((doc) => UserModel.fromJson(doc as QueryDocumentSnapshot<Map<String, dynamic>>)).single;
      return userModel;
    }catch(e){
      print('Something went wrong $e');
    }
    return null;
}
}
