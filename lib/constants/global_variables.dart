import 'package:flutter/material.dart';

String uri = 'http://192.168.29.95:3000';

class GlobalVariables {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 29, 167, 201),
      Color.fromARGB(255, 175, 125, 221),
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromARGB(255, 0, 184, 104);
  static const backgroundColor = Color.fromARGB(255, 240, 248, 248);
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;

  static const List<String> carouselImages = [
    'https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/276528/pexels-photo-276528.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/923192/pexels-photo-923192.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/189333/pexels-photo-189333.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/1457841/pexels-photo-1457841.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Couch',
      'image': 'assets/images/couch.jpg',
    },
    {
      'title': 'Table',
      'image': 'assets/images/Table.jpg',
    },
    {
      'title': 'Bed',
      'image': 'assets/images/Bed.jpg',
    },
    {
      'title': 'Lamp',
      'image': 'assets/images/lamp.jpg',
    },
    {
      'title': 'Chair',
      'image': 'assets/images/chair.jpg',
    },
  ];
}
