import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meta_seo/meta_seo.dart';
import 'package:multitasking/dashboard/ui/Dashboard.dart';
import 'package:multitasking/firebase_options.dart';
import 'package:seo_renderer/seo_renderer.dart';

void main() async {

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (kIsWeb) {
    MetaSEO().config();
  }

  Widget dashboard = const Dashboard();

  runApp(RobotDetector(
    child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: dashboard,
        routes: <String, WidgetBuilder> {
          '/Home': (BuildContext context) => dashboard,
        },
        onGenerateRoute: (routeSettings) {

        },
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute<void>(
              settings: settings,
              builder: (BuildContext context) {

                return dashboard;
              }
          );
        },
        navigatorObservers: [
          seoRouteObserver
      ],
    )
  ));

}