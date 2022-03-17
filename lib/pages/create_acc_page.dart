import 'package:flutter/material.dart';

class CreateAccPage extends StatefulWidget {
  CreateAccPage({Key? key}) : super(key: key);

  @override
  State<CreateAccPage> createState() => _CreateAccPageState();
}

class _CreateAccPageState extends State<CreateAccPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Acc'),
      ),
      body: Center(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
