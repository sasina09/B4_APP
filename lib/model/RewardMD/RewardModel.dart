// To parse this JSON data, do
//
//     final rewards = rewardsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Rewards> rewardsFromJson(String str) => List<Rewards>.from(json.decode(str).map((x) => Rewards.fromJson(x)));

String rewardsToJson(List<Rewards> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Rewards {
    Rewards({
        required this.image,
        required this.name,
        required this.price,
    });

    String image;
    String name;
    String price;

    factory Rewards.fromJson(Map<String, dynamic> json) => Rewards(
        image: json["image"],
        name: json["name"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "image": image,
        "name": name,
        "price": price,
    };
}
