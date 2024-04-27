import 'package:chat_application_iub_cse464/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  Future<List<UserModel>> fetchUsers() async {
    try {
      // Get a reference to the users collection
      final usersRef = FirebaseFirestore.instance.collection('users');

      // Get the documents in the collection
      final querySnapshot = await usersRef.get();

      // Map documents to UserModel objects
      final List<UserModel> users = querySnapshot.docs.map((doc) {
        final data = doc.data();
        return UserModel.fromMap({
          'name': data['name'],
          'uuid': data['uuid'],
          'email': data['email'],
          'avatarUrl': data['avatarUrl'],
        });
      }).toList();

      return users;
    } catch (e) {
      // Handle errors appropriately
      print('Error fetching users: $e');
      return []; // Return an empty list in case of an error
    }
  }
}
