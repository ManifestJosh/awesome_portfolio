import 'package:flutter/material.dart';

class AppsModels {
  String title;
  String? assetPath;
  IconData? icon;
  Color color;
  Widget? screen;
  String? link;

  AppsModels(
      {required this.color,
      required this.title,
      this.assetPath,
      this.icon,
      this.link,
      this.screen})
      : assert(icon == null || assetPath == null);
}
