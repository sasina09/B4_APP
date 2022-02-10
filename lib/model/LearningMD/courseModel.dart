// To parse this JSON data, do
//
//     final course = courseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Course> courseFromJson(String str) => List<Course>.from(json.decode(str).map((x) => Course.fromJson(x)));

String courseToJson(List<Course> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Course {
    Course({
        required this.id,
        required this.name,
        required this.description,
        required this.imageUrl,
        required this.statused,
    });

    String id;
    String name;
    String description;
    String imageUrl;
    String statused;

    factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        imageUrl: json["image-url"],
        statused: json["statused"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image-url": imageUrl,
        "statused": statused,
    };
}
