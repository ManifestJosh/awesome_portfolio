import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class frosted_Containers extends StatelessWidget {
  final double height;
  final double width;
  final EdgeInsetsGeometry? padding;
  final Widget? child;
  const frosted_Containers(
      {super.key,
      required this.height,
      required this.width,
      this.child,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
              child: Container(
                height: height,
                width: width,
              ),
            ),
            Container(
              padding: padding,
              height: height,
              width: width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      colors: [
                    Colors.white.withOpacity(0.5),
                    Colors.white.withOpacity(0.3)
                  ])),
              child: child,
            )
          ],
        ),
      ),
    );
  }
}
