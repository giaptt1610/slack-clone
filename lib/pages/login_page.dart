import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../routes/app_router.dart';
import '../service_locator.dart';
import '../blocs/app/app_bloc.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final router = getIt<AppRouter>().router;
    return Scaffold(
      appBar: AppBar(
        title: Text('${router.location}'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                context.read<AppBloc>().add(LoginEvent());
              },
              child: Text('Loign'),
            ),
          ],
        ),
      ),
    );
  }
}
