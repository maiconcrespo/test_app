import 'dart:convert';

import 'package:exelin_test_app/features/posts/domain/entities/post.dart';

class PostModel extends Post {
  const PostModel({
    required super.id,
    required super.title,
    required super.body,
  });

  PostModel copyWith({
    int? id,
    String? title,
    String? body,
  }) {
    return PostModel(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return switch (map) {
      {
        'id': final int id,
        'title': final String title,
        'body': final String body
      } =>
        PostModel(
          id: id,
          title: title,
          body: body,
        ),
      _ => throw ArgumentError('Invalid Post map'),
    };
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source));

  @override
  String toString() => 'PostModel(id: $id, title: $title, body: $body)';

  @override
  List<Object> get props => [id, title, body];
}
