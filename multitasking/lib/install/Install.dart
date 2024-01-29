import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Install extends StatefulWidget {

  const Install({Key? key}) : super(key: key);

  @override
  State<Install> createState() => InstallState();
}
class InstallState extends State<Install> with TickerProviderStateMixin {

  @override
  void initState() {
    super.initState();

    launchUrl(Uri.parse("https://play.google.com/store/apps/details?id=net.geekstools.floatshort.PRO"), mode: LaunchMode.externalApplication);

  }

  @override
  Widget build(BuildContext context) {

    return Container();
  }

}