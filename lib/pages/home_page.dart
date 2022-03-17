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

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final router = getIt<AppRouter>();
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return AvatarButton(
            onTap: () => Scaffold.of(context).openDrawer(),
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
      drawer: AppDrawer(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ElevatedButton(
            //     onPressed: () {
            //       GoRouter.of(context).push('/shop');
            //     },
            //     child: Text('Shop')),
            // ElevatedButton(
            //     onPressed: () {
            //       GoRouter.of(context).push('/cart');
            //     },
            //     child: Text('Cart')),
            // ElevatedButton(onPressed: () {}, child: Text('Profile')),
            // ElevatedButton(
            //     onPressed: () {
            //       context.read<AppBloc>().add(LogoutEvent());
            //     },
            //     child: Text('Logout')),
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
    );
  }
}
