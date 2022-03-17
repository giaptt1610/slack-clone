import 'package:flutter/material.dart';

class AvatarButton extends StatelessWidget {
  final VoidCallback? onTap;
  const AvatarButton({this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 32.0,
          width: 32.0,
          decoration: BoxDecoration(
            color: Colors.green[300],
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
      ),
    );
  }
}
