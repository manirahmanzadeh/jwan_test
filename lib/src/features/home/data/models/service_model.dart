import 'dart:convert';

import 'package:jwan_test/src/features/home/domain/entities/service_entity.dart';

class ServiceModel extends ServiceEntity {
  ServiceModel({
    required int id,
    required String name,
    required String icon,
    required String cover,
  }) : super(
          id: id,
          name: name,
          icon: icon,
          cover: cover,
        );

  factory ServiceModel.fromRawJson(String str) => ServiceModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
        id: json["id"],
        name: json["name"],
        icon: json["icon"],
        cover: json["cover"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon": icon,
        "cover": cover,
      };
}
