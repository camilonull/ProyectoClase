import 'dart:convert';


FeaturesModel featureModelFromJson(String str) =>
  FeaturesModel.fromJson(json.decode(str));

String featureModelFromToJson(FeaturesModel data) => json.encode(data.toJson());

class FeaturesModel {
  FeaturesModel({
    this.id,
    this.category = '',
    this.color = '',
    this.icon = '',
  });

  int? id;
  String category;
  String color;
  String icon;

  factory FeaturesModel.fromJson(Map<String, dynamic> json) => FeaturesModel(
    id: json["id"],
    category: json["category"],
    color: json["color"],
    icon: json["icon"],
   );

   Map<String, dynamic> toJson() => {
    "id": id,
    "category": category,
    "color": color,
    "icon": icon,
   };
}