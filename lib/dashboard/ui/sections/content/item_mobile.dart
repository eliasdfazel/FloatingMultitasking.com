import 'package:flutter/material.dart';
import 'package:multitasking/dashboard/provider/content_data_structure.dart';
import 'package:multitasking/resources/colors_resources.dart';
import 'package:multitasking/utils/modifications/numbers.dart';
import 'package:multitasking/utils/ui/display.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ItemMobile extends StatefulWidget {

  ContentDataStructure contentDataStructure;

  ItemMobile({Key? key, required this.contentDataStructure}) : super(key: key);

  @override
  State<ItemMobile> createState() => _ItemMobileState();
}
class _ItemMobileState extends State<ItemMobile> {

  ScrollController scrollController = ScrollController();

  Widget screenshotsPlaceholder = Container();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
        padding: EdgeInsets.fromLTRB(calculatePercentage(7, displayLogicalWidth(context)), 101, calculatePercentage(7, displayLogicalWidth(context)), calculatePercentage(3, displayLogicalHeight(context))),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              /* Start
               * Cover, Name, Summary, Screenshots
               */
              coverNameSummary(),
              /* End
               * Cover, Name, Summary, Screenshots
               */

              SizedBox(
                height: calculatePercentage(3, displayLogicalHeight(context))
              ),

              /* Start
               * Screenshots
               */
              screenshotsPlaceholder,
              /* End
               * Screenshots
               */

              SizedBox(
                height: calculatePercentage(3, displayLogicalHeight(context))
              ),

              /*
               * Start - Contact, Install
               */
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          SizedBox(
                              height: calculatePercentage(11, displayLogicalWidth(context)),
                              width: calculatePercentage(11, displayLogicalWidth(context)),
                              child: InkWell(
                                  onTap: () {

                                    launchUrlString(widget.contentDataStructure.applicationFacebookValue(), mode: LaunchMode.externalNonBrowserApplication);

                                  },
                                  child: const Padding(
                                      padding: EdgeInsets.all(5),
                                      child: Image(
                                        image: AssetImage('assets/facebook_icon.png'),
                                      )
                                  )
                              )
                          ),

                          SizedBox(
                              height: calculatePercentage(11, displayLogicalWidth(context)),
                              width: calculatePercentage(11, displayLogicalWidth(context)),
                              child: InkWell(
                                  onTap: () {

                                    launchUrlString(widget.contentDataStructure.applicationXValue(), mode: LaunchMode.externalNonBrowserApplication);

                                  },
                                  child: const Padding(
                                      padding: EdgeInsets.all(5),
                                      child: Image(
                                        image: AssetImage('assets/twitter_icon.png'),
                                      )
                                  )
                              )
                          ),

                          SizedBox(
                              height: calculatePercentage(11, displayLogicalWidth(context)),
                              width: calculatePercentage(11, displayLogicalWidth(context)),
                              child: InkWell(
                                  onTap: () {

                                    launchUrlString(widget.contentDataStructure.applicationYoutubeValue(), mode: LaunchMode.externalNonBrowserApplication);

                                  },
                                  child: const Padding(
                                      padding: EdgeInsets.all(5),
                                      child: Image(
                                        image: AssetImage('assets/youtube_icon.png'),
                                      )
                                  )
                              )
                          ),

                        ]
                    ),

                    Expanded(child: Container()),

                    Container(
                        decoration: BoxDecoration(
                            boxShadow: [

                              BoxShadow(
                                  color: ColorsResources.black.withOpacity(0.19),
                                  blurRadius: 19,
                                  offset: const Offset(0, 13)
                              )

                            ]
                        ),
                        child: SizedBox(
                            height: calculatePercentage(11, displayLogicalWidth(context)),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(19),
                                child: Material(
                                    shadowColor: Colors.transparent,
                                    color: Colors.transparent,
                                    child: InkWell(
                                        splashColor: ColorsResources.premiumLight,
                                        splashFactory: InkRipple.splashFactory,
                                        onTap: () {

                                          Future.delayed(const Duration(milliseconds: 357), () {

                                            launchUrlString(widget.contentDataStructure.packageNameValue(), mode: LaunchMode.externalApplication);

                                          });

                                        },
                                        child: SizedBox(
                                          height: calculatePercentage(11, displayLogicalWidth(context)),
                                          child: const Padding(
                                            padding: EdgeInsets.fromLTRB(13, 7, 0, 7),
                                            child: Image(
                                              image: AssetImage('assets/install_icon.png'),
                                              fit: BoxFit.fill,
                                            )
                                          )
                                        )
                                    )
                                )
                            )
                        )
                    )

                  ]
              )
              /*
               * End - Description, Contact, Install
               */

            ]
        )
    );
  }

  /* Start -
   * Cover, Name, Summary
   */
  Widget coverNameSummary() {

    prepareScreenshots();

    return SizedBox(
        height: calculatePercentage(39, displayLogicalHeight(context)),
        width: calculatePercentage(83, displayLogicalWidth(context)),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              ClipRRect(
                  borderRadius: BorderRadius.circular(19),
                  child: SizedBox(
                    width: calculatePercentage(83, displayLogicalWidth(context)),
                    height: calculatePercentage(21, displayLogicalHeight(context)),
                    child: Image.network(
                      widget.contentDataStructure.applicationCoverValue(),
                      alignment: Alignment.bottomCenter,
                      fit: BoxFit.cover,
                    ),
                  )
              ),

              Padding(
                  padding: EdgeInsets.only(left: calculatePercentage(6, displayLogicalWidth(context)), right: calculatePercentage(6, displayLogicalWidth(context)), top: calculatePercentage(1.79, displayLogicalHeight(context))),
                  child: Row(
                      children: [

                        ClipRRect(
                            borderRadius: BorderRadius.circular(19),
                            child: SizedBox(
                                height: calculatePercentage(9, displayLogicalHeight(context)),
                                width: calculatePercentage(9, displayLogicalHeight(context)),
                                child: Image.network(
                                  widget.contentDataStructure.applicationIconValue(),
                                  fit: BoxFit.cover,
                                )
                            )
                        ),

                        SizedBox(
                          width: calculatePercentage(5, displayLogicalWidth(context)),
                        ),

                        SizedBox(
                            height: calculatePercentage(9, displayLogicalHeight(context)),
                            width: calculatePercentage(37, displayLogicalWidth(context)),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  widget.contentDataStructure.applicationNameValue(),
                                  maxLines: 2,
                                  style: TextStyle(
                                      color: ColorsResources.premiumLight,
                                      fontSize: calculatePercentage(6, displayLogicalWidth(context)),
                                      overflow: TextOverflow.ellipsis
                                  ),
                                )
                            )
                        )

                      ]
                  )
              ),

              Padding(
                  padding: EdgeInsets.only(left: calculatePercentage(1, displayLogicalWidth(context)), right: calculatePercentage(1, displayLogicalWidth(context)), top: calculatePercentage(1.79, displayLogicalHeight(context))),
                  child: SizedBox(
                      width: calculatePercentage(83, displayLogicalWidth(context)),
                      height: calculatePercentage(5, displayLogicalHeight(context)),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.contentDataStructure.applicationSummaryValue(),
                            style: TextStyle(
                              color: ColorsResources.premiumLight,
                              fontSize: calculatePercentage(3.73, displayLogicalWidth(context)),
                            ),
                          )
                      )
                  )
              )

            ]
        )
    );
  }
  /* End -
   * Cover, Name, Summary
   */

  /* Start -
   * Screenshots
   */
  void prepareScreenshots() async {

    List<Widget> allScreenshots = [];

    widget.contentDataStructure.applicationScreenshotsValue().indexed.forEach((element) {

      allScreenshots.add(screenshotItem(element.$1, element.$2));

    });

    setState(() {

      screenshotsPlaceholder = SizedBox(
          height: calculatePercentage(31, displayLogicalHeight(context)),
          width: calculatePercentage(93, displayLogicalWidth(context)),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(19),
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  controller: scrollController,
                  shrinkWrap: false,
                  children: allScreenshots
              )
          )
      );

    });

  }

  Widget screenshotItem(int index, String screenshotLink) {

    double rightPadding = 13;

    if ((index + 1) == widget.contentDataStructure.applicationScreenshotsValue().length) {

      rightPadding = 0;

    }

    return Padding(
      padding: EdgeInsets.only(right: rightPadding),
      child: SizedBox(
          height: calculatePercentage(41, displayLogicalWidth(context)),
          child: GestureDetector(
              onHorizontalDragEnd: (dragDetails) {
                debugPrint('Delta X: ${dragDetails.velocity.pixelsPerSecond}');

                if (dragDetails.velocity.pixelsPerSecond.dx < 0) {

                  scrollController.animateTo((dragDetails.velocity.pixelsPerSecond.dx / 5) * -1, duration: const Duration(milliseconds: 555), curve: Curves.decelerate);

                } else {

                  scrollController.animateTo((dragDetails.velocity.pixelsPerSecond.dx / 5) * -1, duration: const Duration(milliseconds: 555), curve: Curves.decelerate);

                }

              },
              child: Image.network(
                screenshotLink,
              )
          )
      )
    );
  }
  /* End -
   * Screenshots
   */

}