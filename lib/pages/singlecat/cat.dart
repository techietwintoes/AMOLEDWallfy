import 'package:AMOLED/animations/grid.dart';
import 'package:AMOLED/constants/colors.dart';
import 'package:AMOLED/constants/frazile.dart';
import 'package:AMOLED/constants/gradients.dart';
import 'package:AMOLED/constants/loaders.dart';
import 'package:AMOLED/pages/singlecat/catargs.dart';
import 'package:AMOLED/providers/checkinternet.dart';
import 'package:AMOLED/providers/fetchcat.dart';
import 'package:AMOLED/widgets/catWall.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class Cat extends StatefulWidget {
  @override
  _CatState createState() => _CatState();
}

class _CatState extends State<Cat> {
  CatArguments args;
  @override
  void initState() {
    args = ModalRoute.of(context).settings.arguments;
    Provider.of<CatWallfy>(context, listen: false).getHomeData(args.cat);
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
    final mq = MediaQuery.of(context);
    final internet = Provider.of<InternetStatus>(context);
    final catwallfy = Provider.of<CatWallfy>(context);

    final CatArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: FzColors.bgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: mq.size.height,
            child: catwallfy.isFetching
                ? Center(
                    child: FzLoaders.eroticWallfyLoader(),
                  )
                : catwallfy.getResponseJson() != null
                    ? Stack(
                        fit: StackFit.expand,
                        children: [
                          Positioned(
                            top: -(mq.size.height * .055),
                            left: -(mq.size.width * .33),
                            child: Container(
                              height: mq.size.height * .45,
                              width: (mq.size.width - 22) * .98941176,
                              decoration: BoxDecoration(
                                gradient: FzGradients.yellowOrangeGradient,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          Positioned(
                            top: (mq.size.height * .36),
                            right: -(mq.size.width * .33),
                            child: Container(
                              height: mq.size.height * .45,
                              width: (mq.size.width - 22) * .98941176,
                              decoration: BoxDecoration(
                                gradient: FzGradients.bluePinkGradient,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          Positioned(
                            top: mq.size.height * .05,
                            left: mq.size.width * .05,
                            child: Text(
                              args.cat.toUpperCase(),
                              style: TextStyle(
                                // color: Colors.white,
                                fontSize: (mq.size.height / mq.size.width) * 12,
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
                          internet.status
                              ? Positioned(
                                  top: mq.size.height * .11,
                                  left: mq.size.width * .05,
                                  right: mq.size.width * .05,
                                  bottom: 0.0,
                                  child: GridAnimate(
                                    Container(
                                      height: mq.size.height,
                                      width: mq.size.width,
                                      child: NotificationListener<
                                          ScrollNotification>(
                                        onNotification:
                                            (ScrollNotification scrolling) {
                                          if (!catwallfy.isLoading &&
                                              scrolling.metrics.pixels ==
                                                  scrolling.metrics
                                                      .maxScrollExtent) {
                                            catwallfy.loadmore(args.cat);
                                          }
                                          return catwallfy.isLoading;
                                        },
                                        child: GridView.count(
                                          crossAxisCount: 2,
                                          childAspectRatio: .6,
                                          crossAxisSpacing: 10.0,
                                          mainAxisSpacing: 10.0,
                                          physics:
                                              AlwaysScrollableScrollPhysics(),
                                          children: List.generate(
                                            catwallfy.getResponseJson().length,
                                            (i) => CatWall(
                                              catwallfy.getResponseJson()[i].id,
                                              catwallfy
                                                  .getResponseJson()[i]
                                                  .color,
                                              catwallfy
                                                  .getResponseJson()[i]
                                                  .urls
                                                  .thumb,
                                              catwallfy
                                                  .getResponseJson()[i]
                                                  .urls
                                                  .small,
                                              catwallfy
                                                  .getResponseJson()[i]
                                                  .urls
                                                  .regular,
                                              catwallfy
                                                  .getResponseJson()[i]
                                                  .urls
                                                  .full,
                                              catwallfy
                                                  .getResponseJson()[i]
                                                  .urls
                                                  .raw,
                                            ),
                                          ),
                                          // staggeredTileBuilder: (i) => StaggeredTile.count(
                                          //   2,
                                          //   i.isEven ? 2 : 3,
                                          // ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        Frazile.nointernet.toUpperCase(),
                                        style: TextStyle(
                                          fontSize:
                                              (mq.size.height / mq.size.width) *
                                                  10,
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
                                          catwallfy.getHomeData(args.cat);
                                        },
                                        child: Text('Retry'),
                                        color: Colors.amber,
                                      )
                                    ],
                                  ),
                                ),
                          Positioned(
                            left: MediaQuery.of(context).size.width * .1,
                            right: MediaQuery.of(context).size.width * .1,
                            bottom: MediaQuery.of(context).size.height * .02,
                            child: catwallfy.isLoading
                                ? SpinKitChasingDots(
                                    size: 80.0,
                                    itemBuilder: (context, index) =>
                                        DecoratedBox(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: LinearGradient(
                                          colors: FzColors.getListColors(
                                            [
                                              "#9400D3",
                                              "#4B0082",
                                              "#0000FF",
                                              "#00FF00",
                                              "#FFFF00",
                                              "#FF7F00",
                                              "#FF0000"
                                            ],
                                          ),
                                          tileMode: TileMode.clamp,
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          stops: [
                                            0.0,
                                            0.14285714285714285,
                                            0.2857142857142857,
                                            0.42857142857142855,
                                            0.5714285714285714,
                                            0.7142857142857143,
                                            0.8571428571428571
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(),
                          ),
                        ],
                      )
                    : Center(
                        child: Text(
                          Frazile.servererror.toUpperCase(),
                          style: TextStyle(
                            fontSize: (mq.size.height / mq.size.width) * 10,
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
          ),
        ],
      ),
    );
  }
}
