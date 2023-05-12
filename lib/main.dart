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

// defines a shortcut function that takes a `path` and a `route` as arguments, and returns a
// `GoRoute` object with a custom transition animation using the `routeTransition` function.
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

// The "launch" function is used to navigate to a new route in the app by pushing it onto
// the navigation stack, with an optional `extra` parameter, using the `GoRouter` object
// obtained from the current `BuildContext`.
launch(BuildContext context, String route, [Object? extra]) {
  GoRouter.of(context).push(route, extra: extra);
}

// The "replace" function is used to navigate to a new route in the app by replacing the
// current route on the navigation stack, using the `GoRouter` object obtained from the current
//`BuildContext`. It also accepts an optional `extra` parameter.
replace(BuildContext context, String route, [Object? extra]) {
  GoRouter.of(context).replace(route, extra: extra);
}

// "launchReplace" is a function used to navigate to a new route in the app by replacing the
// current route on the navigation stack, with an optional "extra" parameter, using the "GoRouter"
// object obtained from the current "BuildContext".
launchReplace(BuildContext context, String route, [Object? extra]) {
  GoRouter.of(context).pushReplacement(route, extra: extra);
}

// The finish function is a shorthand function that is used to pop the current route off the
// navigation stack and return to the previous route. The function takes a single argument, context,
// which is used to access the GoRouter object. The GoRouter object is a navigation library that is
// used to manage the navigation stack in a Flutter application.

// The "finish" function takes a context argument and uses it to access the GoRouter object, which is
// then used to pop the current route off the navigation stack and return to the previous route.
finish(BuildContext context) => GoRouter.of(context).pop();

FutureOr appCallback(void value) {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}
