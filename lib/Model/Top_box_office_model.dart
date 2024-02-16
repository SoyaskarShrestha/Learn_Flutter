import 'package:flutter/material.dart';

class TopBoxOfficeModel{
  IconData? icon;
  String? title;
  double? revenue;

  TopBoxOfficeModel({this.icon, this.title, this.revenue});

}

final List<TopBoxOfficeModel> topBoxOfficeList = [
  TopBoxOfficeModel(icon: Icons.star, title: 'Argylle', revenue: 18),
  TopBoxOfficeModel(icon: Icons.star, title: null, revenue: 4.7),
  TopBoxOfficeModel(icon: Icons.star, title: 'Episode', revenue: 5.9),
  TopBoxOfficeModel(icon: Icons.star, title: 'Migration', revenue: 4.2),
  TopBoxOfficeModel(icon: Icons.star, title: 'The Beekeeper', revenue: 5.3),
  TopBoxOfficeModel(icon: Icons.star, title: 'Mean Girls', revenue: 18),
];