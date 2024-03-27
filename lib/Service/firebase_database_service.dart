import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/Model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
//Get All users in a database
  Future<List<UserModel>> getAllUsersInADatabase() async {
    try {
      CollectionReference _userCollection =
      await dbInstance.collection('users');
      final snapshot = await _userCollection.get();
      return await snapshot.docs
          .map((doc) => UserModel.fromJson(
          doc as QueryDocumentSnapshot<Map<String, dynamic>>))
          .toList();
    } catch (e) {
      print('Something went wrong');
    }
    return [];
  }
  // Update a user in firebase Database
  Future<UserModel?>updateUserUsingUID({required String uID, required UserModel userModel})async{
    try{
      CollectionReference _usersCollection =
          await dbInstance.collection('users');
      final documentSnapShot = await _usersCollection.where('id',isEqualTo: uID).get();
      if(documentSnapShot.docs.isNotEmpty){
        final documentId = documentSnapShot.docs.single.id;
        await _usersCollection.doc(documentId).update(userModel.toJson());
        final userModelResponse =
          await documentSnapShot.docs.map((doc) =>
              UserModel.fromJson(doc as QueryDocumentSnapshot<Map<String, dynamic>>)).single;
        return userModelResponse;
      }else{
        return null;
      }
    }catch (e){
      print('Something went wrong');
    }
    return null;
  }
  // Delete a user in firebase database
  Future<List<UserModel>?>deleteUserUsingUID ({required String uId})async{
      try{
        CollectionReference _usersCollection =
         await dbInstance.collection('users');
        final documentSnapShot =
          await _usersCollection.where('id',isEqualTo: uId).get();
        if(documentSnapShot.docs.isNotEmpty){
          final documentId= documentSnapShot.docs.first.id;
          await _usersCollection.doc(documentId).delete();
          return await documentSnapShot.docs
              .map((doc) => UserModel.fromJson(
              doc as QueryDocumentSnapshot<Map<String, dynamic>>))
              .toList();
        }else{
          return [];
        }
    }catch(e){
      print('Something went wrong!');
    }
  }

}

