import 'dart:async';

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'src/features/home/web/views/web_screen.dart';
import 'package:esports_cuba_admin/resources/themes.dart';
import 'src/features/home/mobile/views/mobile_screen.dart';
import 'package:esports_cuba_admin/src/features/home/views/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runZonedGuarded<Future<void>>(() async {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    runApp(const MainApp());
  }, (error, stackTrace) async {
    print("Error");
    print("$error");
    print("$stackTrace");
  });
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final routerDelegate = BeamerDelegate(
        notFoundPage: const BeamPage(
          child: Scaffold(body: Text("Not Found")),
        ),
        locationBuilder: RoutesLocationBuilder(routes: {
          '/': (context, state, data) => const HomeScreen(
              mobileLayout: MobileScreen(), webLayout: WebScreen()),
        }));

    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('en'), // English
            Locale('es'), // Spanish
          ],
          routeInformationParser: BeamerParser(),
          routerDelegate: routerDelegate,
          theme: Themes.darkTheme);
    });
  }
}
