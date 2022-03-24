import 'package:flutter/material.dart';

class DotStatus extends StatelessWidget {
  final int status;
  final double size;
  const DotStatus({this.status = 1, this.size = 14.0, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2.0,
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(size / 2),
        color: status == 1
            ? Colors.green
            : status == 2
                ? Colors.yellowAccent
                : Colors.grey,
      ),
    );
  }
}
