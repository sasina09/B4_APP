// To parse this JSON data, do
//
//     final department = departmentFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Department departmentFromJson(String str) => Department.fromJson(json.decode(str));

String departmentToJson(Department data) => json.encode(data.toJson());

class Department {
    Department({
        required this.depart,
        required this.userdata,
    });

    List<Depart> depart;
    List<Userdatum> userdata;

    factory Department.fromJson(Map<String, dynamic> json) => Department(
        depart: List<Depart>.from(json["depart"].map((x) => Depart.fromJson(x))),
        userdata: List<Userdatum>.from(json["Userdata"].map((x) => Userdatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "depart": List<dynamic>.from(depart.map((x) => x.toJson())),
        "Userdata": List<dynamic>.from(userdata.map((x) => x.toJson())),
    };
}

class Depart {
    Depart({
        required this.id,
        required this.type,
    });

    String id;
    String type;

    factory Depart.fromJson(Map<String, dynamic> json) => Depart(
        id: json["id"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
    };
}

class Userdatum {
    Userdatum({
        required this.id,
        required this.name,
        required this.imageUrl,
        required this.department,
    });

    String id;
    String name;
    String imageUrl;
    String department;

    factory Userdatum.fromJson(Map<String, dynamic> json) => Userdatum(
        id: json["id"],
        name: json["name"],
        imageUrl: json["image-url"],
        department: json["department"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image-url": imageUrl,
        "department": department,
    };
}
