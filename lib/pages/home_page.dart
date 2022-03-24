import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../theme/colors.dart';
import '../blocs/app/app_bloc.dart';
import '../routes/app_router.dart';
import '../service_locator.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/app_drawer.dart';
import '../widgets/avatar_button.dart';
import '../widgets/search_box.dart';
import '../widgets/channel_item.dart';
import '../widgets/collapsible_list.dart';
import '../widgets/custom_expansion_tile.dart';
import '../widgets/dm_item.dart';

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
                        child: Builder(
                          builder: (BuildContext context) {
                            List<Widget> _children = [
                              CustomExpansionTile(
                                title: const Text(
                                  'Channels',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                trailing: Transform.rotate(
                                  angle: 0,
                                  child: const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: AppColors.primaryColor,
                                    size: 16.0,
                                  ),
                                ),
                                expandedAlignment: Alignment.centerLeft,
                                children: [
                                  ChannelItem(name: 'channel 1'),
                                  ChannelItem(name: 'channel 2'),
                                  ChannelItem(name: 'channel 3'),
                                  ChannelItem(name: 'channel 4'),
                                ],
                              ),
                              CollapsibleList(
                                label: 'Direct Messages',
                                childrenPadding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                children: [
                                  DmItem(
                                    recipentName: 'Giaptt',
                                  ),
                                  DmItem(
                                    recipentName: 'james2012',
                                    avatarUrl:
                                        'https://www.cuteeasydrawings.com/uploads/allimg/201128/1_201128145855_1.png',
                                  ),
                                  DmItem(
                                    recipentName: 'test',
                                  ),
                                  DmItem(
                                    recipentName: 'kfhmfg',
                                  ),
                                  DmItem(
                                    recipentName: 'fhfgh',
                                  ),
                                ],
                              ),
                            ];
                            return Column(
                              children: _children,
                            );
                          },
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
