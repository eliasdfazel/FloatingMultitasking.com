/*
 * Copyright © 2023 By Geeks Empire.
 *
 * Created by Elias Fazel
 * Last modified 11/4/23, 11:09 AM
 *
 * Licensed Under MIT License.
 * https://opensource.org/licenses/MIT
 */

import 'package:flutter/material.dart';
import 'package:multitasking/resources/colors_resources.dart';
import 'package:multitasking/resources/strings_resources.dart';
import 'package:seo_renderer/seo_renderer.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Menus extends StatefulWidget {

  const Menus({Key? key}) : super (key: key);

  @override
  State<Menus> createState() => _MenusState();
}
class _MenusState extends State<Menus> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return ListView(
        padding: const EdgeInsets.fromLTRB(37, 37, 0, 37),
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [

          SizedBox(
              height: 73,
              child: InkWell(
                  onTap: () {

                    launchUrlString('#', mode: LaunchMode.externalApplication);

                  },
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        ImageRenderer(
                          alt: 'Geeks Empire Logo',
                          child: Image.asset(
                            "images/logo.png",
                            height: 73,
                            width: 73,
                          )
                        ),

                        const SizedBox(
                          width: 19,
                        ),

                        Expanded(
                            child: TextRenderer(
                              style: TextRendererStyle.header1,
                              child: Text(
                                StringsResources.titleGeeksEmpire(),
                                maxLines: 2,
                                style: const TextStyle(
                                    color: ColorsResources.light,
                                    fontSize: 23
                                ),
                              )
                            )
                        )

                      ]
                  )
              )
          ),

          const Divider(
            height: 99,
            color: Colors.transparent,
          ),

          SizedBox(
              height: 51,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(11),
                  child: Material(
                      shadowColor: Colors.transparent,
                      color: Colors.transparent,
                      child: InkWell(
                          splashColor: ColorsResources.lightestYellow.withOpacity(0.31),
                          splashFactory: InkRipple.splashFactory,
                          onTap: () {

                            launchUrlString(StringsResources.projectsLink(), mode: LaunchMode.externalApplication);

                          },
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                Padding(
                                    padding: const EdgeInsets.all(3),
                                    child: ImageRenderer(
                                      alt: 'Geeks Empire Projects',
                                      child: Image.asset(
                                        "images/projects_icon.png",
                                        color: ColorsResources.light,
                                        height: 51,
                                        width: 51,
                                      )
                                    )
                                ),

                                const SizedBox(
                                  width: 19,
                                ),

                                Expanded(
                                    child: TextRenderer(
                                      style: TextRendererStyle.header2,
                                      child:  Text(
                                          StringsResources.projects(),
                                          maxLines: 2,
                                          style: const TextStyle(
                                              color: ColorsResources.lightTransparent,
                                              fontSize: 19
                                          )
                                      )
                                    )
                                )

                              ]
                          )
                      )
                  )
              )
          ),

          const Divider(
            height: 19,
            color: ColorsResources.premiumDarkTransparent,
          ),

          SizedBox(
              height: 51,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(11),
                  child: Material(
                      shadowColor: Colors.transparent,
                      color: Colors.transparent,
                      child: InkWell(
                          splashColor: ColorsResources.lightestYellow.withOpacity(0.31),
                          splashFactory: InkRipple.splashFactory,
                          onTap: () {

                            launchUrlString(StringsResources.termServiceLink(), mode: LaunchMode.externalApplication);

                          },
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                Padding(
                                    padding: const EdgeInsets.fromLTRB(3, 11, 11, 11),
                                    child: ImageRenderer(
                                      alt: 'Arwen AI Terms Of Service',
                                      child: Image.asset(
                                        "images/tos.png",
                                        color: ColorsResources.light,
                                        height: 51,
                                        width: 51,
                                      )
                                    )
                                ),

                                const SizedBox(
                                  width: 7,
                                ),

                                Expanded(
                                    child: TextRenderer(
                                      style: TextRendererStyle.header2,
                                      child: Text(
                                        StringsResources.termService(),
                                        maxLines: 2,
                                        style: const TextStyle(
                                            color: ColorsResources.lightTransparent,
                                            fontSize: 15
                                        ),
                                      )
                                    )
                                )

                              ]
                          )
                      )
                  )
              )
          ),

          const Divider(
            height: 7,
            color: Colors.transparent,
          ),

          SizedBox(
              height: 51,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(11),
                  child: Material(
                      shadowColor: Colors.transparent,
                      color: Colors.transparent,
                      child: InkWell(
                          splashColor: ColorsResources.lightestYellow.withOpacity(0.31),
                          splashFactory: InkRipple.splashFactory,
                          onTap: () {

                            launchUrlString(StringsResources.privacyPolicyLink(), mode: LaunchMode.externalApplication);

                          },
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                Padding(
                                    padding: const EdgeInsets.fromLTRB(3, 11, 11, 11),
                                    child: ImageRenderer(
                                      alt: 'Arwen AI Privacy and Policy',
                                      child: Image.asset(
                                        "images/privacy.png",
                                        color: ColorsResources.light,
                                        height: 51,
                                        width: 51,
                                      )
                                    )
                                ),

                                const SizedBox(
                                  width: 7,
                                ),

                                Expanded(
                                    child: TextRenderer(
                                      style: TextRendererStyle.header2,
                                      child: Text(
                                        StringsResources.privacyPolicy(),
                                        maxLines: 2,
                                        style: const TextStyle(
                                            color: ColorsResources.lightTransparent,
                                            fontSize: 15
                                        ),
                                      )
                                    )
                                )

                              ]
                          )
                      )
                  )
              )
          ),

          const Divider(
            height: 73,
            color: Colors.transparent,
          ),

          SizedBox(
              height: 51,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    InkWell(
                        onTap: () {

                          launchUrlString(StringsResources.threadsLink(), mode: LaunchMode.externalApplication);

                        },
                        child: const ImageRenderer(
                          alt: 'Arwen AI on Threads',
                          child: Image(
                            image: AssetImage("images/threads_icon.png"),
                            height: 51,
                            width: 51,
                          )
                        )
                    ),

                    const SizedBox(
                      width: 13,
                    ),

                    InkWell(
                        onTap: () {

                          launchUrlString(StringsResources.twitterLink(), mode: LaunchMode.externalApplication);

                        },
                        child: const ImageRenderer(
                          alt: 'Arwen AI on X, Twitter',
                          child: Image(
                            image: AssetImage("images/twitter_icon.png"),
                            height: 51,
                            width: 51,
                          )
                        )
                    ),

                    const SizedBox(
                      width: 13,
                    ),

                    InkWell(
                        onTap: () {

                          launchUrlString(StringsResources.youtubeLink(), mode: LaunchMode.externalApplication);

                        },
                        child: const ImageRenderer(
                          alt: 'Arwen AI on YouTube',
                          child: Image(
                            image: AssetImage("images/youtube_icon.png"),
                            height: 51,
                            width: 51,
                          )
                        )
                    )

                  ]
              )
          ),

        ]
    );
  }

}
