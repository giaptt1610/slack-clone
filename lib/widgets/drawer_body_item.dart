import 'package:flutter/material.dart';

class DrawerBodyItem extends StatelessWidget {
  const DrawerBodyItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Row(
        children: [
          SizedBox(
            width: 54,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(6.0),
              ),
            ),
          ),
          SizedBox(width: 10.0),
          Expanded(child: Column()),
          SizedBox(width: 10.0),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
        ],
      ),
    );
  }
}
