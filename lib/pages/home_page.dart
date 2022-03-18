import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../blocs/app/app_bloc.dart';
import '../routes/app_router.dart';
import '../service_locator.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/app_drawer.dart';
import '../widgets/avatar_button.dart';
import '../widgets/search_box.dart';
import '../widgets/collapsible_list.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int _tabIndex = 0;
  late AnimationController _controller;
  late CurvedAnimation _curvedAnimation;

  final _scrimColorTween =
      ColorTween(begin: Colors.transparent, end: Colors.black54);
  final _offsetMain = Tween(begin: Offset(0, 0), end: Offset(0.77, 0));
  final _offsetDrawer = Tween(begin: Offset(-1, 0), end: Offset(0, 0));

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    _controller.addStatusListener(_onAnimationStatusChanged);

    _curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );
  }

  void _onAnimationStatusChanged(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
    } else if (status == AnimationStatus.dismissed) {}
  }

  @override
  Widget build(BuildContext context) {
    final router = getIt<AppRouter>();
    return Stack(
      children: [
        SlideTransition(
          position: _offsetMain.animate(_curvedAnimation),
          child: Scaffold(
            appBar: AppBar(
              leading: Builder(builder: (context) {
                return AvatarButton(
                  onTap: () {
                    toggleDrawer();
                  },
                );
              }),
              title: Row(
                children: [
                  Text('Title'),
                  SizedBox(width: 10.0),
                  Text('${router.router.location}'),
                ],
              ),
            ),
            body: SafeArea(
              child: Stack(
                children: [
                  Positioned(
                    top: 70,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Divider(height: 2),
                            CollapsibleList(
                              label: 'Channels',
                            ),
                            Divider(height: 2),
                            CollapsibleList(
                              label: 'Direct Messages',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: SearchBox(
                        onTap: () {
                          print('-- tap search box');
                        },
                      ),
                    ),
                    top: 12.0,
                    left: 0,
                    right: 0,
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: const Icon(
                CupertinoIcons.pencil_outline,
                size: 28,
              ),
            ),
            bottomNavigationBar: BottomNavBar(
              currentIndex: _tabIndex,
              onTap: (index) {
                if (index != _tabIndex) {
                  setState(() {
                    _tabIndex = index!;
                  });
                }
              },
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            toggleDrawer();
          },
          child: Semantics(
            label: MaterialLocalizations.of(context).modalBarrierDismissLabel,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) => MouseRegion(
                opaque: _controller.isCompleted,
                child: Container(
                  color: _scrimColorTween.evaluate(_curvedAnimation),
                ),
              ),
            ),
          ),
        ),
        SlideTransition(
          position: _offsetDrawer.animate(_curvedAnimation),
          child: AppDrawer(),
        ),
      ],
    );
  }

  void toggleDrawer() {
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
