import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String id;
  final String userId;
  final String title;
  final String content;
  final DateTime createdAt;
  final List<String> images;
  final int likes;
  final int comments;

  PostModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.images,
    this.likes = 0,
    this.comments = 0,
  });

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      title: map['title'] ?? '',
      content: map['content'] ?? '',
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      images: List<String>.from(map['images'] ?? []),
      likes: map['likes'] ?? 0,
      comments: map['comments'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'content': content,
      'createdAt': createdAt,
      'images': images,
      'likes': likes,
      'comments': comments,
    };
  }
} 