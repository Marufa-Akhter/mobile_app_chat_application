// To parse this JSON data, do
//
//     final userData = userDataFromMap(jsonString);

import 'dart:convert';

class UserModel {
  String? name;
  String? uuid;
  String? email;
  String? avatarUrl; // Add avatarUrl field

  UserModel({
    this.name,
    this.uuid,
    this.email,
    this.avatarUrl,
  });

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
    name: json["name"],
    uuid: json["uuid"],
    email: json["email"],
    avatarUrl: json["avatarUrl"], // Update avatarUrl
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "uuid": uuid,
    "email": email,
    "avatarUrl": avatarUrl, // Update avatarUrl
  };

  @override
  String toString() {
    return 'UserModel{name: $name, uuid: $uuid, email: $email, avatarUrl: $avatarUrl}';
  }
}
