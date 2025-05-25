import 'dart:developer';

class ServiceModel {
  final String title;
  final String description;
  final String icon;

  ServiceModel({
    required this.title,
    required this.description,
    required this.icon
  });

  factory ServiceModel.fromMap(Map<String, dynamic> map) {
    return ServiceModel(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      icon: map['icon'] ?? '',
    );
  }

}
