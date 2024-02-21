import 'package:cloud_firestore/cloud_firestore.dart';

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

}
