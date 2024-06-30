/*
 * Copyright © 2023 By Geeks Empire.
 *
 * Created by Elias Fazel
 * Last modified 11/4/23, 11:09 AM
 *
 * Licensed Under MIT License.
 * https://opensource.org/licenses/MIT
 */

import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multitasking/dashboard/ui/Dashboard.dart';
import 'package:multitasking/resources/colors_resources.dart';
import 'package:seo_renderer/renderers/image_renderer/image_renderer_vm.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Header extends StatefulWidget {

  DashboardState dashboardState;

  Header({Key? key, required this.dashboardState}) : super (key: key);

  @override
  State<Header> createState() => _HeaderState();
}
class _HeaderState extends State<Header> {

  double scaleParameter = 1;

  @override
  void initState() {
    super.initState();

    initializeScales();

  }

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 175,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(
                height: 101 / scaleParameter,
                child: Blur(
                    blur: 37,
                    colorOpacity: 0.73,
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(37), topRight: Radius.circular(37)),
                    blurColor: ColorsResources.premiumDark,
                    overlay: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Padding(
                              padding: EdgeInsets.only(left: 37 / scaleParameter),
                              child: SizedBox(
                                  height: 59 / scaleParameter,
                                  width: 59 / scaleParameter,
                                  child: InkWell(
                                      onTap: () {

                                        if (widget.dashboardState.menuOpen) {

                                          widget.dashboardState.menuOpen = false;

                                          widget.dashboardState.animationController.reverse().whenComplete(() {

                                          });

                                          widget.dashboardState.setState(() {

                                            widget.dashboardState.opacityAnimation = 0.37;

                                            widget.dashboardState.radiusAnimation = BorderRadius.circular(0);

                                          });

                                        } else {


                                          widget.dashboardState.menuOpen = true;

                                          widget.dashboardState.animationController.forward().whenComplete(() {

                                          });

                                          widget.dashboardState.setState(() {

                                            widget.dashboardState.opacityAnimation = 1;

                                            widget.dashboardState.radiusAnimation = BorderRadius.circular(37);

                                          });

                                        }

                                      },
                                      child: const ImageRenderer(
                                        alt: 'Arwen AI Menu',
                                        child: Image(
                                          image: AssetImage("images/menu.png"),
                                        )
                                      )
                                  )
                              )
                          ),

                          Expanded(
                              child: Center(
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [

                                        SizedBox(
                                            height: 57 / scaleParameter,
                                            width: 57 / scaleParameter,
                                            child: const ImageRenderer(
                                              alt: 'Geeks Empire Logo',
                                              child: Image(
                                                image: AssetImage("images/logo.png"),
                                              )
                                            )
                                        ),

                                        SizedBox(
                                          width: 19 / scaleParameter,
                                        ),

                                        SizedBox(
                                            height: 57 / scaleParameter,
                                            child: const Padding(
                                              padding: EdgeInsets.only(top: 5, bottom: 5),
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: ImageRenderer(
                                                  alt: 'Geeks Empire Text Logo',
                                                  child: Image(
                                                    image: AssetImage("images/geeks_empire.png"),
                                                    fit: BoxFit.contain,
                                                  )
                                                )
                                              )
                                            )
                                        ),

                                      ]
                                  )
                              )
                          ),

                          Padding(
                              padding: EdgeInsets.only(right: 37 / scaleParameter),
                              child: SizedBox(
                                  height: 59 / scaleParameter,
                                  width: 59 / scaleParameter,
                                  child: InkWell(
                                      onTap: () {

                                        launchUrlString("mailto:Support@GeeksEmpire.co", mode: LaunchMode.externalApplication);

                                      },
                                      child: const ImageRenderer(
                                        alt: 'Arwen AI Support',
                                        child: Image(
                                          image: AssetImage("images/support.png"),
                                        )
                                      )
                                  )
                              )
                          ),

                        ]
                    ),
                    child: Container()
                )
            ),

            SizedBox(
                height: 33 / scaleParameter,
                child: const Image(
                  image: AssetImage("images/shadow.png"),
                  fit: BoxFit.cover,
                )
            )

          ]

      )
    );
  }

  void initializeScales() {

    if (GetPlatform.isDesktop) {

      scaleParameter = 1;

    } else {

      scaleParameter = 1.37;

    }

  }

}
