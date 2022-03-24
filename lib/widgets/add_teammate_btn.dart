import 'package:flutter/material.dart';

class AddTeammateBtn extends StatelessWidget {
  final VoidCallback? onTap;
  const AddTeammateBtn({this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.0,
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Icon(
              Icons.add,
              color: Colors.black87,
            ),
            SizedBox(width: 12.0),
            Expanded(
              child: Text(
                'Add Teammates',
                style: TextStyle(
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
