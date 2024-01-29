import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:multitasking/dashboard/ui/Dashboard.dart';
import 'package:multitasking/firebase_options.dart';
import 'package:multitasking/install/Install.dart';

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
        '/Install': (BuildContext context) => const Install()
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
      }
  )
  );

}