import 'dart:async';
import 'dart:developer';

import 'package:extensionresoft/helper.dart';
import 'package:flight_tracker_and_bookings_ui_app/providers/theme_provider.dart';
import 'package:flight_tracker_and_bookings_ui_app/routes/boarding.dart';
import 'package:flight_tracker_and_bookings_ui_app/routes/booking.dart';
import 'package:flight_tracker_and_bookings_ui_app/routes/error.dart';
import 'package:flight_tracker_and_bookings_ui_app/routes/select_flight.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fontresoft/fontresoft.dart';
import 'package:go_router/go_router.dart';

import 'data/constants/constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]).then(appCallback);
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        var state = ref.watch(themeProvider.select((value) => value));
        log(state.toString());
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: Constants.appName,
          themeMode: condition(state, ThemeMode.light, ThemeMode.dark),
          theme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.light,
            colorSchemeSeed: Colors.cyan,
            fontFamily: FontResoft.poppins,
            package: FontResoft.package,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            typography: Typography.material2021(englishLike: Typography.dense2021),
            textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark,
            colorSchemeSeed: Colors.cyan,
            fontFamily: FontResoft.poppins,
            package: FontResoft.package,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            textTheme: const TextTheme(bodyMedium: TextStyle()),
          ),
          routeInformationProvider: _router.routeInformationProvider,
          routeInformationParser: _router.routeInformationParser,
          routerDelegate: _router.routerDelegate,
          shortcuts: {
            ...WidgetsApp.defaultShortcuts,
            const SingleActivator(LogicalKeyboardKey.select): const ActivateIntent(),
          },
          localizationsDelegates: const [],
        );
      },
    );
  }

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      route(Constants.root, const SelectFlight()),
      //route(Constants.root, const BoardingPass()),
      route(Constants.selection, const SelectFlight()),
      route(Constants.booking, const BookFlight()),
      route(Constants.boarding, const BoardingPass()),
      route(Constants.error, const ErrorPage()),
    ],
    errorBuilder: (context, state) => const ErrorPage(),
  );
}

GoRoute route(String path, Widget route) {
  return routeTransition(path, route);
}

GoRoute routeTransition(String path, Widget route) {
  return GoRoute(
    path: path,
    pageBuilder: (context, state) => CustomTransitionPage(
      child: route,
      transitionsBuilder: (context, animation, _, child) => FadeTransition(
        opacity: CurvedAnimation(parent: animation, curve: Curves.easeInOutBack),
        child: child,
      ),
      transitionDuration: const Duration(seconds: 1),
    ),
  );
}

launch(BuildContext context, String route, [Object? extra]) {
  GoRouter.of(context).push(route, extra: extra);
}

replace(BuildContext context, String route, [Object? extra]) {
  GoRouter.of(context).replace(route, extra: extra);
}

launchReplace(BuildContext context, String route, [Object? extra]) {
  GoRouter.of(context).pushReplacement(route, extra: extra);
}

finish(BuildContext context) => GoRouter.of(context).pop();

FutureOr appCallback(void value) {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}
