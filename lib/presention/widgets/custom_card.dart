import 'package:flutter/material.dart';
import 'package:online_learning/configration/themedata.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final Color? color;
  final double? padding;
  final double? width;
 final List<BoxShadow>? boxShadow;
  const CustomCard({super.key, required this.child, this.color, this.padding, this.width, this.boxShadow});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:width,
      padding: EdgeInsets.all(padding ?? 16),
      decoration: BoxDecoration(
          color: color ?? ThemeDataProvider.textLightThemeColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow:boxShadow),
          child: child,
    );
  }
}
