import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../blocs/app/app_bloc.dart';
import '../routes/app_router.dart';
import '../service_locator.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final router = getIt<AppRouter>();
    return Scaffold(
      appBar: AppBar(
        title: Text('${router.router.location}'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                GoRouter.of(context).push('/shop');
              },
              child: Text('Shop')),
          ElevatedButton(
              onPressed: () {
                GoRouter.of(context).push('/cart');
              },
              child: Text('Cart')),
          ElevatedButton(onPressed: () {}, child: Text('Profile')),
          ElevatedButton(
              onPressed: () {
                context.read<AppBloc>().add(LogoutEvent());
              },
              child: Text('Logout')),
        ],
      ),
    );
  }
}
