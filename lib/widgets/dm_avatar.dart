import 'package:flutter/material.dart';

import 'dot_status.dart';

class DmAvatar extends StatelessWidget {
  final double size;
  final int status;
  final String? url;
  const DmAvatar({
    this.url,
    this.size = 36.0,
    this.status = 0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: url == null
                ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.grey,
                    ),
                  )
                : Image.network(
                    url!,
                    fit: BoxFit.cover,
                  ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: DotStatus(
              status: status,
            ),
          ),
        ],
      ),
    );
  }
}
