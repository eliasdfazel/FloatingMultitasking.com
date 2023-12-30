import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:multitasking/dashboard/ui/Dashboard.dart';
import 'package:multitasking/firebase_options.dart';
import 'package:url_launcher/url_launcher.dart';

void main() async {

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Widget dashboard = const Dashboard();

  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: dashboard,
      routes: <String, WidgetBuilder> {
        '/Home': (BuildContext context) => dashboard,
        '/Install': (BuildContext context) => dashboard
      },
      onGenerateRoute: (routeSettings) {
        print(">>> >> > ");

        Uri uri = Uri.parse(routeSettings.name ?? "");

        print(">>> >> > " + uri.toString());

        Map<String, dynamic> parameters = {};

        uri.queryParameters.forEach((key, value) {

          parameters[key] = value;

        });

        if (parameters["source"].toString().isNotEmpty) {
          debugPrint("Source: ${parameters["source"].toString().toUpperCase()}");

          FirebaseAnalytics.instance.logViewPromotion(promotionName: parameters["source"].toString().toUpperCase());

          launchUrl(Uri.parse("https://play.google.com/store/apps/details?id=net.geekstools.floatshort.PRO&utm_source:${parameters["source"].toString().toUpperCase()}"), mode: LaunchMode.externalNonBrowserApplication);

          return MaterialPageRoute(
              builder: (_) => dashboard
          );

        } else {

          return MaterialPageRoute(
              builder: (_) => dashboard
          );

        }

      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute<void>(
            settings: settings,
            builder: (BuildContext context) {

              return dashboard;
            }
        );
      }
  )
  );

}