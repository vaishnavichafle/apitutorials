import 'dart:convert';

List<PostsModel> postsModelFromJson(String str) => List<PostsModel>.from(json.decode(str).map((x) => PostsModel.fromJson(x)));

String postsModelToJson(List<PostsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostsModel {
  DateTime createdAt;
  String name;
  String avatar;
  String id;

  PostsModel({
    required this.createdAt,
    required this.name,
    required this.avatar,
    required this.id,
  });

  factory PostsModel.fromJson(Map<String, dynamic> json) => PostsModel(
    createdAt: DateTime.parse(json["createdAt"]),
    name: json["name"],
    avatar: json["avatar"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt.toIso8601String(),
    "name": name,
    "avatar": avatar,
    "id": id,
  };
}