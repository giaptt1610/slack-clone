import 'dart:math';
import 'package:flutter/material.dart';
import 'inkwell_icon.dart';

class CollapsibleList extends StatefulWidget {
  final VoidCallback? onTap;
  final bool expanded;
  final String label;
  final List<Widget> children;
  final Alignment? expandedAlignment;
  final CrossAxisAlignment? expandedCrossAxisAlignment;
  final bool maintainState;
  final EdgeInsetsGeometry? childrenPadding;

  CollapsibleList({
    required this.label,
    this.onTap,
    this.expanded = true,
    this.children = const [],
    this.expandedAlignment,
    this.expandedCrossAxisAlignment,
    this.maintainState = false,
    this.childrenPadding,
    Key? key,
  }) : super(key: key);

  @override
  State<CollapsibleList> createState() => _CollapsibleListState();
}

class _CollapsibleListState extends State<CollapsibleList>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);
  late Animation<double> _angleAnimation;
  late Animation<double> _heightFactor;

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
    _angleAnimation = Tween(begin: 0.0, end: pi / 2).animate(_controller);
    _heightFactor = _controller.drive(_easeInTween);

    if (_isExpanded) {
      _controller.value = 1.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool closed = !_isExpanded && _controller.isDismissed;
    final bool shouldRemoveChildren = closed && !widget.maintainState;
    final Widget result = Offstage(
      offstage: closed,
      child: TickerMode(
        enabled: !closed,
        child: Padding(
          padding: widget.childrenPadding ?? EdgeInsets.zero,
          child: Column(
            crossAxisAlignment:
                widget.expandedCrossAxisAlignment ?? CrossAxisAlignment.center,
            children: widget.children,
          ),
        ),
      ),
    );

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                toggle();
              },
              child: Container(
                height: 38.0,
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
                    const SizedBox(width: 4.0),
                    InkWellIcon(
                      icon: const Icon(
                        Icons.add,
                        size: 18.0,
                      ),
                      iconSize: 18.0,
                      onTap: () {},
                    ),
                    const SizedBox(width: 4.0),
                    InkWellIcon(
                      icon: Transform.rotate(
                        angle: _angleAnimation.value,
                        child: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16.0,
                        ),
                      ),
                      onTap: () {
                        toggle();
                      },
                    ),
                  ],
                ),
              ),
            ),
            ClipRect(
              child: Align(
                alignment: widget.expandedAlignment ?? Alignment.centerLeft,
                heightFactor: _heightFactor.value,
                child: child,
              ),
            ),
          ],
        );
      },
      child: shouldRemoveChildren ? null : result,
    );
  }

  void toggle() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse().then<void>((void value) {
          if (!mounted) return;
          setState(() {
            // Rebuild without widget.children.
          });
        });
      }
      // PageStorage.of(context)?.writeState(context, _isExpanded);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
