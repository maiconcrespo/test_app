import 'dart:convert';

import 'package:exelin_test_app/features/posts/domain/entities/coments.dart';


class CommentsModel extends Comments {

const CommentsModel({
  required super.postId, 
  required super.id,
  required super.name,    
  required super.email,
  required super.body,

 
});



 CommentsModel copyWith({
    int? postId,
    int? id,
    String? name,
    String? email,
    String? body,
  }) {
    return CommentsModel(
      postId: postId ?? this.postId,
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'postId': postId,
      'id': id,
      'name': name,
      'email': email,
      'body': body,
    };
  }

  factory CommentsModel.fromMap(Map<String, dynamic> map) {
    return switch (map) {
      {
        'postId': final int postId,
        'id': final int id,
        'name': final String name,
        'email': final String email,
        'body': final String body
      } =>
        CommentsModel(
          postId: postId,
          id: id,
          name: name,
          email: email,
          body: body,
        ),
      _ => throw ArgumentError('Invalid Coment map'),
    };
  }

  String toJson() => json.encode(toMap());

  factory CommentsModel.fromJson(String source) => CommentsModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ComentsModel(postId: $postId, id: $id, name: $name, email: $email, body: $body)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CommentsModel &&
      other.postId == postId &&
      other.id == id &&
      other.name == name &&
      other.email == email &&
      other.body == body;
  }

  @override
  int get hashCode {
    return postId.hashCode ^
      id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      body.hashCode;
  }
}
