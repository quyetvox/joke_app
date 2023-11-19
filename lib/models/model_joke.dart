import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ModelJoke {
  final int id;
  final String content;
  
  ModelJoke({
    required this.id,
    required this.content,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'content': content,
    };
  }

  factory ModelJoke.fromMap(Map<String, dynamic> map) {
    return ModelJoke(
      id: map['id'] as int,
      content: map['content'] as String,
    );
  }

  String toJson() => json.encode(toMap());
  factory ModelJoke.fromJson(String source) =>
      ModelJoke.fromMap(json.decode(source) as Map<String, dynamic>);
}
