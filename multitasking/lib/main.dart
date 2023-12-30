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

        Uri uri = Uri.parse(routeSettings.name ?? "");

        Map<String, dynamic> parameters = {};

        uri.queryParameters.forEach((key, value) {

          parameters[key] = value;

        });

        if (parameters["link"].toString().isNotEmpty) {
          debugPrint("Link: ${parameters["link"].toString().toUpperCase()}");

          FirebaseAnalytics.instance.logViewPromotion(promotionName: parameters["link"].toString().toUpperCase());

          launchUrl(Uri.parse(parameters["link"].toString().toUpperCase()), mode: LaunchMode.externalNonBrowserApplication);

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