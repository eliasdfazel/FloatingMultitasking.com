import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multitasking/dashboard/provider/content_data_structure.dart';
import 'package:multitasking/dashboard/provider/content_provider.dart';
import 'package:multitasking/dashboard/ui/sections/content/item_desktop.dart';
import 'package:multitasking/dashboard/ui/sections/content/item_mobile.dart';
import 'package:multitasking/dashboard/ui/sections/header.dart';
import 'package:multitasking/dashboard/ui/sections/menus.dart';
import 'package:multitasking/resources/colors_resources.dart';
import 'package:multitasking/resources/strings_resources.dart';
import 'package:multitasking/utils/modifications/numbers.dart';
import 'package:multitasking/utils/ui/display.dart';
import 'package:multitasking/utils/ui/nexted_page_controller.dart';

class Dashboard extends StatefulWidget {

  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => DashboardState();
}
class DashboardState extends State<Dashboard> with TickerProviderStateMixin {

  PageController pageController = PageController();

  /*
   * Start - Menu
   */
  late AnimationController animationController;

  late Animation<Offset> offsetAnimation;
  late Animation<double> scaleAnimation;
  BorderRadius radiusAnimation = BorderRadius.circular(0);

  late Animation<Offset> offsetAnimationItems;
  double opacityAnimation = 0.37;

  bool menuOpen = false;
  /*
   * End - Menu
   */

  /*
   * Start - Content Provider
   */
  ContentProvider contentProvider = ContentProvider();

  List<ContentDataStructure> allContent = [];

  Widget contentPlaceholder = Container();
  Widget nextIconPlaceholder = Container();

  bool nextVisibility = true;
  int pageIndex = 0;
  /*
   * End - Content Provider
   */

  /* Start - Next Page */
  double nextPageIndicatorHeight = 73;

  double nextPageIconHeight = 51;
  double nextPageIconWidth = 51;
  /* End - Next Page */


  @override
  void initState() {
    super.initState();

    animationController = AnimationController(vsync: this,
        duration: const Duration(milliseconds: 777),
        reverseDuration: const Duration(milliseconds: 333),
        animationBehavior: AnimationBehavior.preserve);

    offsetAnimation = Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0.51, 0))
        .animate(CurvedAnimation(
        parent: animationController,
        curve: Curves.easeIn
    ));
    scaleAnimation = Tween<double>(begin: 1, end: 0.91)
        .animate(CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut
    ));

    offsetAnimationItems = Tween<Offset>(begin: const Offset(-0.19, 0), end: const Offset(0, 0))
        .animate(CurvedAnimation(
        parent: animationController,
        curve: Curves.easeIn
    ));

    initializeScales();

  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: StringsResources.websiteTitle(),
            color: ColorsResources.black,
            theme: ThemeData(
              fontFamily: 'Ubuntu',
              colorScheme: ColorScheme.fromSwatch().copyWith(secondary: ColorsResources.black),
              pageTransitionsTheme: const PageTransitionsTheme(builders: {
                TargetPlatform.android: ZoomPageTransitionsBuilder(),
                TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
              }),
            ),
            home: Scaffold(
                resizeToAvoidBottomInset: true,
                backgroundColor: ColorsResources.black,
                body: Stack(
                    children: [

                      /* Start - Menu Items */
                      menuItems(),
                      /* End - Menu Items */

                      /* Start - Contents Widgets */
                      allContentsWidgets(),
                      /* End - Contents Widgets */

                    ]
                )
            )
        )
    );
  }

  Widget allContentsWidgets() {

    return SlideTransition(
        position: offsetAnimation,
        child: ScaleTransition(
            scale: scaleAnimation,
            child: Stack(
                children: [

                  /* Start - Content */
                  AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastOutSlowIn,
                      decoration: BoxDecoration(
                          color: ColorsResources.premiumDark,
                          borderRadius: radiusAnimation,
                          border: Border.all(
                              color: Colors.transparent,
                              width: 0
                          )
                      ),
                      child: contentPlaceholder
                  ),
                  /* End - Content */

                  /* Start - Header */
                  Header(dashboardState: this),
                  /* End - Header */

                  /* Start - Next */
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                              height: nextPageIndicatorHeight,
                              child: Visibility(
                                  visible: nextVisibility,
                                  child: Stack(
                                      children: [

                                        Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Image.asset(
                                                "assets/images/next_background.png"
                                            )
                                        ),

                                        Center(
                                            child: ClipRRect(
                                                borderRadius: BorderRadius.circular(99),
                                                child: InkWell(
                                                    onTap: () {

                                                      if ((pageIndex + 1) == allContent.length) {

                                                        pageController.animateToPage(0, duration: const Duration(milliseconds: 777), curve: Curves.easeInOutCubic);

                                                      } else {

                                                        pageController.nextPage(duration: const Duration(milliseconds: 555), curve: Curves.decelerate);

                                                      }

                                                    },
                                                    child: nextIconPlaceholder
                                                )
                                            )
                                        )

                                      ]
                                  )
                              )
                          )
                      )
                  )
                  /* End - Next */

                ]
            )
        )
    );
  }

  Widget menuItems() {

    return Container(
        width: calculatePercentage(53, displayLogicalWidth(context)),
        alignment: AlignmentDirectional.centerStart,
        color: Colors.black,
        child: SlideTransition(
            position: offsetAnimationItems,
            child: AnimatedOpacity(
                opacity: opacityAnimation,
                duration: Duration(milliseconds: menuOpen ? 753 : 137),
                child: const Menus()
            )
        )
    );
  }

  /* Start - Content Provider */
  void prepareContent() {

    List<Widget> allContentWidgets = [];

    allContent = contentProvider.process();

    for (var element in allContent) {

      if (GetPlatform.isDesktop) {

        allContentWidgets.add(ItemDesktop(contentDataStructure: element));

      } else {

        allContentWidgets.add(ItemMobile(contentDataStructure: element));

      }

    }

    nextApplicationIcon();

    setState(() {

      contentPlaceholder = PageView(
          controller: pageController,
          scrollDirection: Axis.vertical,
          physics: const NextedPageController(),
          onPageChanged: (index) {

            pageIndex = index;

            nextApplicationIcon();

          },
          children: allContentWidgets
      );

    });

  }

  void nextApplicationIcon() {

    if ((pageIndex + 1) == allContent.length) {

      setState(() {

        nextIconPlaceholder = SizedBox(
            height: nextPageIconHeight,
            width: nextPageIconWidth,
            child: Image.asset(
              allContent[0].applicationIconValue(),
              height: nextPageIconHeight,
              width: nextPageIconWidth,
            )
        );

        nextVisibility = true;

      });

    } else {

      setState(() {

        nextIconPlaceholder = SizedBox(
            height: nextPageIconHeight,
            width: nextPageIconWidth,
            child: Image.asset(
              allContent[pageIndex + 1].applicationIconValue(),
              height: nextPageIconHeight,
              width: nextPageIconWidth,
            )
        );

        nextVisibility = true;

      });

    }

  }
  /* End - Content Provider */

  void initializeScales() {

    setState(() {

      if (GetPlatform.isDesktop) {

        /* Start - Next Page */
        nextPageIndicatorHeight = 73;

        nextPageIconHeight = 51;
        nextPageIconWidth = 51;
        /* End - Next Page */

      } else {

        /* Start - Next Page */
        nextPageIndicatorHeight = 37;

        nextPageIconHeight = 27;
        nextPageIconWidth = 27;
        /* End - Next Page */

      }

    });

    prepareContent();

  }

}