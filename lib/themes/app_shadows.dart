import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart';

class AppShadows {
  const AppShadows._();

  static List<BoxShadow> shadowOne = [
    BoxShadow(
      blurRadius: 6.0,
      color: Colors.black.withOpacity(0.64),
    ),
    BoxShadow(
      blurRadius: 2.0,
      color: Colors.black.withOpacity(0.32),
    ),
  ];

  static List<BoxShadow> shadowTwo = [
    BoxShadow(
      offset: const Offset(0.0, 6.0),
      blurRadius: 10.0,
      color: Colors.black.withOpacity(0.8),
    ),
  ];

  static List<BoxShadow> shadowThree = [
    BoxShadow(
      offset: const Offset(0.0, 6.0),
      blurRadius: 16.0,
      color: Colors.black.withOpacity(0.24),
    ),
    BoxShadow(
      offset: const Offset(0.0, 1.0),
      blurRadius: 3.0,
      color: Colors.black.withOpacity(0.2),
    ),
  ];

  static List<BoxShadow> shadowFour = [
    BoxShadow(
      offset: const Offset(0.0, 2.0),
      blurRadius: 4.0,
      color: Colors.black.withOpacity(0.64),
    ),
    BoxShadow(
      offset: const Offset(0.0, 4.0),
      blurRadius: 8.0,
      color: Colors.black.withOpacity(0.25),
    ),
  ];

  static List<BoxShadow> shadowFive = [
    BoxShadow(
      offset: const Offset(0.0, -4.0),
      blurRadius: 12.0,
      color: Colors.black.withOpacity(0.25),
      inset: true,
    ),
    BoxShadow(
      offset: const Offset(0.0, -4.0),
      blurRadius: 2.0,
      color: Colors.black.withOpacity(0.25),
      inset: true,
    ),
  ];
}
