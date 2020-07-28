import 'package:AMOLED/constants/colors.dart';
import 'package:AMOLED/constants/frazile.dart';
import 'package:AMOLED/constants/gradients.dart';
import 'package:AMOLED/providers/checkinternet.dart';
import 'package:AMOLED/providers/fetchabstract.dart';
import 'package:AMOLED/providers/fetchdark.dart';
import 'package:AMOLED/providers/fetcherotic.dart';
import 'package:AMOLED/providers/fetchgirls.dart';
import 'package:AMOLED/providers/fetchminimal.dart';
import 'package:AMOLED/providers/fetchnature.dart';
import 'package:AMOLED/providers/fetchothers.dart';
import 'package:AMOLED/services/menuItems.dart';
import 'package:AMOLED/widgets/abstractWallfy.dart';
import 'package:AMOLED/widgets/darkWallfy.dart';
import 'package:AMOLED/widgets/eroticWallfy.dart';
import 'package:AMOLED/widgets/girlsWallfy.dart';
import 'package:AMOLED/widgets/minimalWallfy.dart';
import 'package:AMOLED/widgets/natureWallfy.dart';
import 'package:AMOLED/widgets/othersWallfy.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:launch_review/launch_review.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<bool> _onBackPress() => showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
          title: Text("Do you wish to close the app?"),
          cancelButton: CupertinoActionSheetAction(
            child: const Text("Close"),
            isDefaultAction: true,
            onPressed: () => Navigator.of(context).pop(true),
          ),
          message: Text("Have you reviewed the app on Playstore yet?"),
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: Text("Review now on Playstore"),
              onPressed: () {
                Navigator.pop(context);
                LaunchReview.launch();
              },
            ),
            CupertinoActionSheetAction(
              child: Text("Connect with the Developer"),
              onPressed: () {},
            ),
            CupertinoActionSheetAction(
              child: Text("Share the App"),
              onPressed: () => Share.text(
                Frazile.shareTitle,
                Frazile.shareMsg,
                'text/plain',
              ),
            )
          ],
        ),
      );

  @override
  void initState() {
    Provider.of<AbstractWallfy>(context, listen: false).getHomeData();
    Provider.of<DarkWallfy>(context, listen: false).getHomeData();
    Provider.of<EroticWallfy>(context, listen: false).getHomeData();
    Provider.of<GirlsWallfy>(context, listen: false).getHomeData();
    Provider.of<MinimalWallfy>(context, listen: false).getHomeData();
    Provider.of<NatureWallfy>(context, listen: false).getHomeData();
    Provider.of<OthersWallfy>(context, listen: false).getHomeData();
    Provider.of<InternetStatus>(context, listen: false).updateInternetStatus();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.black,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarDividerColor: Colors.transparent.withOpacity(
          0.7,
        ),
      ),
    );

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final internet = Provider.of<InternetStatus>(context);
    final abs = Provider.of<AbstractWallfy>(context);
    final dark = Provider.of<DarkWallfy>(context);
    final erotic = Provider.of<EroticWallfy>(context);
    final girls = Provider.of<GirlsWallfy>(context);
    final minimal = Provider.of<MinimalWallfy>(context);
    final nature = Provider.of<NatureWallfy>(context);
    final others = Provider.of<OthersWallfy>(context);
    // print('Original height = ' + ((height / width) * 6).toString());
    // print('Original Width = ' + width.toString());
    return WillPopScope(
      onWillPop: _onBackPress,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: FzColors.bgColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Positioned(
                    top: -(height * .055),
                    left: -(width * .33),
                    child: Container(
                      height: height * .45,
                      width: (width - 22) * .98941176,
                      decoration: BoxDecoration(
                        gradient: FzGradients.deLaclos,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    top: (height * .36),
                    right: -(width * .33),
                    child: Container(
                      height: height * .45,
                      width: (width - 22) * .98941176,
                      decoration: BoxDecoration(
                        gradient: FzGradients.whiteSmokeGunmetalGray,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    top: height * .05,
                    left: width * .05,
                    child: Text(
                      Frazile.appName.toUpperCase(),
                      style: TextStyle(
                        // color: Colors.white,
                        fontSize: (height / width) * 12,
                        letterSpacing: 1.0,
                        wordSpacing: 2.5,
                        fontWeight: FontWeight.w400,
                        foreground: Paint()
                          ..shader = LinearGradient(
                            colors: [
                              const Color(0xFFFF3399),
                              const Color(0xFFFF0000),
                            ],
                          ).createShader(
                            Rect.fromLTRB(
                              200.0,
                              0.0,
                              100.0,
                              0.0,
                            ),
                          ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: height * .036,
                    right: width * .02,
                    child: PopupMenuButton<MenuItems>(
                      elevation: 3.0,
                      onCanceled: () => {},
                      tooltip: "Menu",
                      onSelected: selectedMenuItem,
                      itemBuilder: (BuildContext context) {
                        return menu.map(
                          (MenuItems menuItem) {
                            return PopupMenuItem<MenuItems>(
                              value: menuItem,
                              child: Text(menuItem.title),
                            );
                          },
                        ).toList();
                      },
                    ),
                  ),
                  Container(
                    height: height,
                    margin: EdgeInsets.only(
                      top: height * .09,
                      left: width * .05,
                      bottom: 0.0,
                    ),
                    child: internet.status
                        ? ListView(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            children: [
                              abstractWallfy(height, width, abs),
                              darkWallfy(height, width, dark),
                              eroticWallfy(height, width, erotic),
                              girlsWallfy(height, width, girls),
                              minimalWallfy(height, width, minimal),
                              natureWallfy(height, width, nature),
                              othersWallfy(height, width, others),
                            ],
                          )
                        : Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  Frazile.nointernet.toUpperCase(),
                                  style: TextStyle(
                                    // color: Colors.white,

                                    fontSize: (height / width) * 10,

                                    fontWeight: FontWeight.w400,

                                    foreground: Paint()
                                      ..shader = LinearGradient(
                                        colors: [
                                          const Color(0xFFFF3399),
                                          const Color(0xFFFF0000),
                                        ],
                                      ).createShader(
                                        Rect.fromLTRB(
                                          200.0,
                                          0.0,
                                          100.0,
                                          0.0,
                                        ),
                                      ),
                                  ),
                                ),
                                MaterialButton(
                                  onPressed: () {
                                    internet.updateInternetStatus();
                                    abs.getHomeData();
                                    dark.getHomeData();
                                    erotic.getHomeData();
                                    girls.getHomeData();
                                    minimal.getHomeData();
                                    nature.getHomeData();
                                    others.getHomeData();
                                  },
                                  child: Text('Retry'),
                                  color: Colors.amber,
                                )
                              ],
                            ),
                          ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void selectedMenuItem(MenuItems menu) {
    switch (menu.id) {
      case 0:
        // Navigator.pushNamed(context, Frazile.about);
        break;
      case 1:
        // Navigator.pushNamed(context, Frazile.settings);
        break;
      case 2:
        // Navigator.pushNamed(context, Frazile.donate);
        break;
    }
  }

  static const List<MenuItems> menu = const <MenuItems>[
    const MenuItems(id: 0, title: 'About'),
    const MenuItems(id: 1, title: 'Settings'),
    const MenuItems(id: 2, title: 'Donate'),
  ];
}
