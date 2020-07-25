import 'package:AMOLED/constants/colors.dart';
import 'package:AMOLED/constants/gradients.dart';
import 'package:AMOLED/widgets/darkEroticWallpapersCell.dart';
import 'package:AMOLED/widgets/darkWallpaperCell.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:launch_review/launch_review.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<bool> _onBackPress() => showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
          title: Text("Do you wish to close the app ?"),
          cancelButton: CupertinoActionSheetAction(
            child: const Text("Close"),
            isDefaultAction: true,
            onPressed: () => Navigator.of(context).pop(true),
          ),
          message: Text("Have you reviewed the app on Playstore yet ?"),
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
                'vkfdrnhogi',
                "Hey! Check out this app on Playstore.  is a Movie and TV Shows Database app. If you love the app please review the",
                '',
              ),
            )
          ],
        ),
      );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
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
                  Container(
                    height: height,
                    margin: EdgeInsets.only(
                      top: height * .11,
                      left: width * .05,
                      bottom: 0.0,
                    ),
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      children: [
                        Container(
                          width: width - 20,
                          height: height * .35,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Dark Sexy Wallpapers",
                                style: TextStyle(
                                  // color: Colors.black,

                                  // fontFamily: 'SFProBlack',

                                  fontSize: 26.0,

                                  // fontWeight: FontWeight.w700,

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

                              // Container(

                              //   margin: const EdgeInsets.only(

                              //     top: 8.0,

                              //     bottom: 15.0,

                              //   ),

                              //   width: (width - 40) * .783,

                              //   height: 3.0,

                              //   decoration: BoxDecoration(

                              //     gradient: FzGradients.pinkRedGradient,

                              //     borderRadius: BorderRadius.circular(

                              //       14.0,

                              //     ),

                              //   ),

                              // ),

                              SizedBox(
                                height: 15.0,
                              ),

                              Expanded(
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  physics: BouncingScrollPhysics(),
                                  itemCount: 10,
                                  itemBuilder: (context, i) {
                                    return Container(
                                      padding:
                                          const EdgeInsets.only(right: 17.0),
                                      child: DarkWallpaperCell(1),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: width - 20,
                          height: height * .35,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Dark Erotic Wallpapers",
                                style: TextStyle(
                                  // fontFamily: 'SFProBlack',

                                  fontSize: 26.0,

                                  fontWeight: FontWeight.w400,

                                  foreground: Paint()
                                    ..shader = LinearGradient(
                                      colors: [
                                        const Color(0xFF46A3B7),
                                        const Color(0xFF86F1DE),
                                      ],
                                    ).createShader(
                                      Rect.fromLTRB(
                                        200.0,
                                        0.0,
                                        100.0,
                                        0.0,
                                      ),

                                      // textDirection: TextDirection.ltr,
                                    ),
                                ),
                              ),

                              // Container(

                              //   margin: const EdgeInsets.only(

                              //     top: 8.0,

                              //     bottom: 15.0,

                              //   ),

                              //   width: (width - 40) * .82,

                              //   height: 3.0,

                              //   decoration: BoxDecoration(

                              //     gradient: FzGradients.greenSexyGradient,

                              //     borderRadius: BorderRadius.circular(

                              //       14.0,

                              //     ),

                              //   ),

                              // ),

                              SizedBox(
                                height: 15.0,
                              ),

                              Expanded(
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  physics: BouncingScrollPhysics(),
                                  itemCount: 10,
                                  itemBuilder: (context, i) {
                                    return Container(
                                      padding:
                                          const EdgeInsets.only(right: 17.0),
                                      child: DarkEroticWallpapersCell(1),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: width - 20,
                          height: height * .35,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Dark Wallpapers",
                                style: TextStyle(
                                  // fontFamily: 'SFProBlack',

                                  fontSize: 26.0,

                                  fontWeight: FontWeight.w400,

                                  foreground: Paint()
                                    ..shader = LinearGradient(
                                      colors: [
                                        const Color(0xFFFDC830),
                                        const Color(0xFFF37335),
                                      ],
                                    ).createShader(
                                      Rect.fromLTRB(
                                        200.0,
                                        0.0,
                                        100.0,
                                        0.0,
                                      ),

                                      // textDirection: TextDirection.ltr,
                                    ),
                                ),
                              ),

                              // Container(

                              //   margin: const EdgeInsets.only(

                              //     top: 8.0,

                              //     bottom: 15.0,

                              //   ),

                              //   width: (width - 40) * .82,

                              //   height: 3.0,

                              //   decoration: BoxDecoration(

                              //     gradient: FzGradients.greenSexyGradient,

                              //     borderRadius: BorderRadius.circular(

                              //       14.0,

                              //     ),

                              //   ),

                              // ),

                              SizedBox(
                                height: 15.0,
                              ),

                              Expanded(
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  physics: BouncingScrollPhysics(),
                                  itemCount: 10,
                                  itemBuilder: (context, i) {
                                    return Container(
                                      padding:
                                          const EdgeInsets.only(right: 17.0),
                                      child: DarkEroticWallpapersCell(1),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
}
