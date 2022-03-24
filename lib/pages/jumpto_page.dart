import 'package:flutter/material.dart';
import 'package:slack_clone/widgets/search_box.dart';

class JumpToPage extends StatefulWidget {
  JumpToPage({Key? key}) : super(key: key);

  @override
  State<JumpToPage> createState() => _JumpToPageState();
}

class _JumpToPageState extends State<JumpToPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 12.0),
                child: Row(
                  children: [
                    Expanded(child: SearchBox()),
                    SizedBox(width: 10.0),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),

              /// history
              _SectionTitle(title: 'History'),
              _Item(label: 'channel 1'),
              _Item(label: 'channel 2'),
              _Item(label: 'channel 3'),
              Divider(),

              /// Suggestions
              _SectionTitle(title: 'Suggestions'),
              _Item(label: 'channel 1'),
              _Item(label: 'channel 1'),
              _Item(label: 'channel 1'),
            ],
          ),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final String label;
  const _Item({this.label = '', Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.0,
      child: Row(
        children: [
          const Text(
            '#',
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
          const SizedBox(width: 14.0),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({this.title = '', Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 14.0),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
