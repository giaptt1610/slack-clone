import 'package:flutter/material.dart';

import 'dm_avatar.dart';

class DmItem extends StatelessWidget {
  final String recipentName;
  final VoidCallback? onTap;
  final String? avatarUrl;
  const DmItem({
    required this.recipentName,
    this.onTap,
    this.avatarUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            DmAvatar(
              status: 1,
              url: avatarUrl,
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: Text(
                recipentName,
                style: const TextStyle(
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
