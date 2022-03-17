import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  final Color bgColor;
  const Loading({required this.bgColor, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      color: bgColor,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
