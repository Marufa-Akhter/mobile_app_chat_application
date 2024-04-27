import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';

class UserManage{
  final firebase = FirebaseFirestore.instance;


  Future<void> createUserProfile({required String userName, required String userEmail, required String userID})async{

    var user = UserModel(
      name: userName,
      uuid: userID,
      email: userEmail,
    );


    await firebase.collection("users").doc(userID).set(user.toMap());

    // await firebase.collection("users").add({
    //   "name": userName,
    //   "email": userEmail,
    //   "my_chats": FieldValue.arrayUnion([]),
    // });
  }


}