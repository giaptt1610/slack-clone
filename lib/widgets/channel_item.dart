import 'package:flutter/material.dart';

class ChannelItem extends StatelessWidget {
  final String name;
  final VoidCallback? onTap;
  const ChannelItem({required this.name, this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40.0,
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 6.0,
        ),
        child: Row(
          children: [
            Text('#'),
            SizedBox(width: 20.0),
            Expanded(child: Text(name)),
          ],
        ),
      ),
    );
  }
}
