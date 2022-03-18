import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:slack_clone/widgets/channel_item.dart';

class CollapsibleList extends StatefulWidget {
  final VoidCallback? onTap;
  final bool expanded;
  final String label;
  CollapsibleList({
    required this.label,
    this.onTap,
    this.expanded = true,
    Key? key,
  }) : super(key: key);

  @override
  State<CollapsibleList> createState() => _CollapsibleListState();
}

class _CollapsibleListState extends State<CollapsibleList>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _heightAnimation;
  late Animation<double> _angleAnimation;
  bool _isExpanded = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    if (widget.expanded) {
      _controller.reverse();
    }
    _heightAnimation = Tween(begin: 0.0, end: 150.0).animate(_controller);
    _angleAnimation = Tween(begin: 0.0, end: pi / 2).animate(_controller);

    if (_isExpanded) {
      _controller.value = 1.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  toggle();
                },
                child: Container(
                  height: 32.0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 4.0,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        '${widget.label}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      InkWell(
                        child: Transform.rotate(
                          angle: _angleAnimation.value,
                          child: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: _heightAnimation.value,
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) =>
                      ChannelItem(name: 'Channel ${index + 1}'),
                ),
              ),
            ],
          );
        },
        child: Row(
          children: [
            Expanded(child: Text('Channels')),
            InkWell(
              child: Icon(Icons.arrow_forward_ios_rounded),
            ),
          ],
        ),
      ),
    );
  }

  void toggle() {
    if (_controller.isAnimating) return;

    if (_controller.isCompleted) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
