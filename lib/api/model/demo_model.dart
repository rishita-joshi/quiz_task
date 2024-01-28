import 'dart:convert';

class Demo {
  int userId;
  int id;
  String title;

  Demo({
    required this.userId,
    required this.id,
    required this.title,
  });

  Demo copyWith({
    int? userId,
    int? id,
    String? title,
  }) =>
      Demo(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        title: title ?? this.title,
      );

  factory Demo.fromRawJson(String str) => Demo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Demo.fromJson(Map<String, dynamic> json) => Demo(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
      };
}
