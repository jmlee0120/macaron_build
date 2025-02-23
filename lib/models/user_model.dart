import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String email;
  final String? nickname;
  final String? profileImage;
  final DateTime createdAt;

  UserModel({
    required this.uid,
    required this.email,
    this.nickname,
    this.profileImage,
    required this.createdAt,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      nickname: map['nickname'],
      profileImage: map['profileImage'],
      createdAt: (map['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'nickname': nickname,
      'profileImage': profileImage,
      'createdAt': createdAt,
    };
  }
} 