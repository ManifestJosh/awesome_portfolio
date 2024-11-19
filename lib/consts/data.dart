import 'package:awesome_portfolio/mini_screen/aboutme.dart';
import 'package:awesome_portfolio/models/device_model.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';

import '../mini_screen/app_images.dart';
import '../models/apps_models.dart';
import '../models/color_models.dart';

List<DeviceModel> device = [
  DeviceModel(data: Icons.android, device: Devices.android.samsungGalaxyNote20),
  DeviceModel(data: Icons.apple, device: Devices.ios.iPhone13),
  DeviceModel(data: Icons.tablet, device: Devices.ios.iPad),
];

List<ColorModels> colorPalette = [
  ColorModels(
      svgPath: "assets/images/shapesblue.svg",
      gradient: LinearGradient(
          colors: [Colors.purple, Colors.blue.shade500],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight),
      color: Colors.purple),
  ColorModels(
      svgPath: "assets/images/shapesblue.svg",
      gradient: LinearGradient(
          colors: [Colors.green, Colors.purple],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight),
      color: Colors.green),
  ColorModels(
      svgPath: "assets/images/shapesblue.svg",
      gradient: LinearGradient(
          colors: [Colors.blue.shade600, Colors.black],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight),
      color: Colors.blue.shade600),
  ColorModels(
      svgPath: "assets/images/shapesblue.svg",
      gradient: LinearGradient(
          colors: [Colors.yellow, Colors.blue.shade600],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight),
      color: Colors.yellow),
];

List<AppsModels> apps = [
  AppsModels(
      color: Colors.white,
      title: 'About Me',
      icon: Icons.person,
      screen: const AboutMe()),
  AppsModels(
      color: Colors.white,
      title: 'Apps',
      icon: Icons.menu,
      screen: const AppImages()),
  AppsModels(
      color: Colors.white,
      title: 'LinkedIn',
      icon: Icons.social_distance,
      link: 'https://www.linkedin.com/in/joshua-chisom-16857921b/'),
  AppsModels(
      color: Colors.white,
      title: 'Github',
      icon: Icons.link,
      link: 'https://github.com/ManifestJosh'),
];
