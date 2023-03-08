import 'dart:convert';

class CustProduct {
  final String name;
  final String description;
  final String fabric;
  final double quantity;
  final String wood;
  final List<String> images;

  CustProduct({
    required this.name,
    required this.description,
    required this.fabric,
    required this.quantity,
    required this.wood,
    required this.images,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'fabric': fabric,
      'quantity': quantity,
      'wood': wood,
      'images': images,
    };
  }

  factory CustProduct.fromMap(Map<String, dynamic> map) {
    return CustProduct(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      fabric: map['fabric'] ?? '',
      quantity: map['quantity']?.toDouble() ?? 0.0,
      wood: map['wood'] ?? '',
      images: List<String>.from(map['images']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CustProduct.fromJson(String source) =>
      CustProduct.fromMap(json.decode(source));
}
