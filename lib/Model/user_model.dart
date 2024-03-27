import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? fullName;
  int? phoneNumber;
  String? address;
  String? email;

  UserModel({this.id, this.fullName, this.phoneNumber, this.address, this.email});

  ///This function is used to convert flutter model object to firebase readable json
  toJson() {
    return {
      'id': id,
      'full_name': fullName,
      'phone_number': phoneNumber,
      'address': address,
      'email_id': email,
    };
  }

  factory UserModel.fromJson(
      QueryDocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    final data = documentSnapshot.data();
    return UserModel(
      id: data['id'],
      fullName: data['full_name'],
      address: data['address'],
      phoneNumber: data['phone_number'],
      email: data['email_id'],
    );
  }
}

/// setting
/// notification
/// about app
