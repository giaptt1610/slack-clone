import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uni_links/uni_links.dart';
import '/blocs/cart/cart_bloc.dart';
import '/routes/app_router.dart';
import '/service_locator.dart';
import 'theme/custom_theme.dart';

import 'blocs/app/app_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final appBloc = AppBloc();
  late AppRouter appRouter;

  _MyAppState() {
    appRouter = AppRouter(appBloc.stream);
    getIt.registerSingleton<AppRouter>(appRouter);
  }

  @override
  void initState() {
    super.initState();

    linkStream.listen((link) {
      print('--- giap, link: $link');
      try {
        final uri = Uri.parse(link!);
        String path = uri.path;
        appBloc.add(NewDeepLinkEvent(path));
      } catch (e) {
        print('--- giap, ${e.toString()}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => appBloc),
        BlocProvider(create: (context) => CartBloc()),
      ],
      child: MaterialApp.router(
        routeInformationParser: appRouter.router.routeInformationParser,
        routerDelegate: appRouter.router.routerDelegate,
        title: 'Go Router',
        theme: CustomTheme.lightTheme,
        darkTheme: CustomTheme.darkTheme,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
