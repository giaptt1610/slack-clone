import 'package:flutter/material.dart';

class InkWellIcon extends StatelessWidget {
  final Widget icon;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final double? iconSize;
  final double size;

  const InkWellIcon({
    required this.icon,
    this.padding,
    this.onTap,
    this.iconSize,
    this.size = 30.0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: size,
        width: size,
        child: icon,
      ),
    );
  }
}
