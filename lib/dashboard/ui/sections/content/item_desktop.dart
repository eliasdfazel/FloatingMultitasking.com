import 'package:flutter/material.dart';
import 'package:multitasking/dashboard/provider/content_data_structure.dart';
import 'package:multitasking/resources/colors_resources.dart';
import 'package:multitasking/utils/modifications/numbers.dart';
import 'package:multitasking/utils/ui/display.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ItemDesktop extends StatefulWidget {

  ContentDataStructure contentDataStructure;

  ItemDesktop({Key? key, required this.contentDataStructure}) : super(key: key);

  @override
  State<ItemDesktop> createState() => _ItemDesktopState();
}
class _ItemDesktopState extends State<ItemDesktop> {

  ScrollController scrollController = ScrollController();

  Widget screenshotsPlaceholder = Container();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
        padding: EdgeInsets.fromLTRB(calculatePercentage(7, displayLogicalWidth(context)), 137, calculatePercentage(7, displayLogicalWidth(context)), calculatePercentage(3, displayLogicalHeight(context))),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              /* Start
             * Cover, Name, Summary, Screenshots
             */
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    /* Start
                 * Cover, Name, Summary
                 */
                    coverNameSummary(),
                    /* End
                 * Cover, Name, Summary
                 */

                    SizedBox(
                      height: calculatePercentage(1, displayLogicalHeight(context)),
                    ),

                    /* Start
                 * Screenshots
                 */
                    screenshotsPlaceholder
                    /* End
                 * Screenshots
                 */

                  ]
              ),
              /* End
             * Cover, Name, Summary, Screenshots
             */

              const Divider(
                height: 19,
                color: Colors.transparent,
              ),

              /*
             * Start - Description, Contact, Install
             */
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    ClipRRect(
                        borderRadius: BorderRadius.circular(37),
                        child: Container(
                            color: ColorsResources.black.withOpacity(0.07),
                            child: Padding(
                                padding: const EdgeInsets.fromLTRB(37, 13, 37, 13),
                                child: SizedBox(
                                    width: calculatePercentage(63, displayLogicalWidth(context)),
                                    height: calculatePercentage(6, displayLogicalWidth(context)),
                                    child: Text(
                                      widget.contentDataStructure.applicationDescriptionValue(),
                                      style: TextStyle(
                                          color: ColorsResources.premiumLight,
                                          fontSize: calculatePercentage(1.11, displayLogicalWidth(context)),
                                          height: 1.19
                                      ),
                                    )
                                )
                            )
                        )
                    ),

                    SizedBox(
                        width: calculatePercentage(1, displayLogicalWidth(context))
                    ),

                    Expanded(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [

                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [

                                    SizedBox(
                                        height: calculatePercentage(4, displayLogicalWidth(context)),
                                        width: calculatePercentage(4, displayLogicalWidth(context)),
                                        child: InkWell(
                                            onTap: () {

                                              launchUrlString(widget.contentDataStructure.applicationFacebookValue(), mode: LaunchMode.externalNonBrowserApplication);

                                            },
                                            child: const Padding(
                                                padding: EdgeInsets.all(5),
                                                child: Image(
                                                  image: AssetImage('images/facebook_icon.png'),
                                                )
                                            )
                                        )
                                    ),

                                    SizedBox(
                                        height: calculatePercentage(4, displayLogicalWidth(context)),
                                        width: calculatePercentage(4, displayLogicalWidth(context)),
                                        child: InkWell(
                                            onTap: () {

                                              launchUrlString(widget.contentDataStructure.applicationXValue(), mode: LaunchMode.externalNonBrowserApplication);

                                            },
                                            child: const Padding(
                                                padding: EdgeInsets.all(5),
                                                child: Image(
                                                  image: AssetImage('images/twitter_icon.png'),
                                                )
                                            )
                                        )
                                    ),

                                    SizedBox(
                                        height: calculatePercentage(4, displayLogicalWidth(context)),
                                        width: calculatePercentage(4, displayLogicalWidth(context)),
                                        child: InkWell(
                                            onTap: () {

                                              launchUrlString(widget.contentDataStructure.applicationYoutubeValue(), mode: LaunchMode.externalNonBrowserApplication);

                                            },
                                            child: const Padding(
                                                padding: EdgeInsets.all(5),
                                                child: Image(
                                                  image: AssetImage('images/youtube_icon.png'),
                                                )
                                            )
                                        )
                                    ),

                                  ]
                              ),

                              SizedBox(
                                height: calculatePercentage(1, displayLogicalHeight(context))
                              ),

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
                                      height: calculatePercentage(6, displayLogicalHeight(context)),
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
                                                  child: const Image(
                                                    image: AssetImage('images/install_icon.png'),
                                                  )
                                              )
                                          )
                                      )
                                  )
                              )

                            ]
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
        height: calculatePercentage(61, displayLogicalHeight(context)),
        width: calculatePercentage(27, displayLogicalWidth(context)),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              ClipRRect(
                  borderRadius: BorderRadius.circular(19),
                  child: SizedBox(
                    width: calculatePercentage(27, displayLogicalWidth(context)),
                    child: Image.network(
                      widget.contentDataStructure.applicationCoverValue(),
                      alignment: Alignment.bottomCenter,
                      fit: BoxFit.cover,
                    ),
                  )
              ),

              Padding(
                  padding: EdgeInsets.only(left: calculatePercentage(1.37, displayLogicalWidth(context)), right: calculatePercentage(1.37, displayLogicalWidth(context)), top: 19),
                  child: Row(
                      children: [

                        ClipRRect(
                            borderRadius: BorderRadius.circular(37),
                            child: SizedBox(
                                height: calculatePercentage(13, displayLogicalHeight(context)),
                                width: calculatePercentage(13, displayLogicalHeight(context)),
                                child: Image.network(
                                  widget.contentDataStructure.applicationIconValue(),
                                  fit: BoxFit.cover,
                                )
                            )
                        ),

                        SizedBox(
                          width: calculatePercentage(1, displayLogicalWidth(context)),
                        ),

                        SizedBox(
                            height: calculatePercentage(15, displayLogicalHeight(context)),
                            width: calculatePercentage(15, displayLogicalWidth(context)),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  widget.contentDataStructure.applicationNameValue(),
                                  maxLines: 2,
                                  style: TextStyle(
                                      color: ColorsResources.premiumLight,
                                      fontSize: calculatePercentage(2.73, displayLogicalWidth(context)),
                                      overflow: TextOverflow.ellipsis
                                  ),
                                )
                            )
                        )

                      ]
                  )
              ),

              Padding(
                  padding: const EdgeInsets.only(left: 19, right: 19, top: 19),
                  child: SizedBox(
                      height: calculatePercentage(15, displayLogicalHeight(context)),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.contentDataStructure.applicationSummaryValue(),
                            style: TextStyle(
                                color: ColorsResources.premiumLight,
                                fontSize: calculatePercentage(1.73, displayLogicalWidth(context)),
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
          height: calculatePercentage(61, displayLogicalHeight(context)),
          width: calculatePercentage(57, displayLogicalWidth(context)),
          child: Padding(
              padding: const EdgeInsets.only(left: 37),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(37),
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      controller: scrollController,
                      shrinkWrap: false,
                      children: allScreenshots
                  )
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
            height: calculatePercentage(61, displayLogicalHeight(context)),
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