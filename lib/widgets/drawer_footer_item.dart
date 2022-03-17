import 'package:flutter/material.dart';

class DrawerFooterItem extends StatelessWidget {
  final IconData icon;
  final String lable;
  final VoidCallback? onTap;
  const DrawerFooterItem(
      {required this.icon, required this.lable, this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32.0,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.fromLTRB(16.0, 0, 0, 0),
          child: Row(
            children: [
              Icon(icon),
              SizedBox(width: 12.0),
              Expanded(child: Text(lable)),
            ],
          ),
        ),
      ),
    );
  }
}
