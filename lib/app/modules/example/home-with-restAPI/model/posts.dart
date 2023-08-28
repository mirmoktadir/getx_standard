import 'package:hive/hive.dart';

part 'posts.g.dart'; // This is the generated Hive type adapter file

@HiveType(typeId: 0) // Replace 0 with a unique integer identifier for this type
class Posts extends HiveObject {
  @HiveField(0)
  int? userId;

  @HiveField(1)
  int? id;

  @HiveField(2)
  String? title;

  @HiveField(3)
  String? body;

  Posts({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory Posts.fromJson(Map<String, dynamic> json) {
    return Posts(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
