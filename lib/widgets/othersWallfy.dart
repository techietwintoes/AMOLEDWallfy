import 'package:AMOLED/constants/gradients.dart';
import 'package:AMOLED/constants/loaders.dart';
import 'package:AMOLED/providers/fetchnature.dart';
import 'package:AMOLED/providers/fetchothers.dart';
import 'package:flutter/material.dart';
import 'girlWallfy.dart';

Widget othersWallfy(double height, width, OthersWallfy others) => Container(
      width: width - 20,
      height: height * .35,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "More Wallfy",
                style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.w400,
                  foreground: Paint()
                    ..shader = LinearGradient(
                      colors: [
                        const Color(0xFFEE0979),
                        const Color(0xFFFF6A00),
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
              Container(
                height: 20.0,
                padding: EdgeInsets.only(
                  right: width * .03,
                ),
                child: RaisedButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      20.0,
                    ),
                  ),
                  padding: EdgeInsets.all(
                    0.0,
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: FzGradients.lbizaSunset,
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                    ),
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: 100.0,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "View More",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
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
          // SizedBox(
          //   height: 15.0,
          // ),
          others.isFetching
              ? FzLoaders.othersWallfyLoader()
              : others.getResponseJson() != null
                  ? Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemCount: 10,
                        itemBuilder: (context, i) {
                          return Container(
                            padding: const EdgeInsets.only(right: 17.0),
                            child: GirlWallfy(
                              others.getResponseJson()[i].id,
                              others.getResponseJson()[i].urls.thumb,
                              others.getResponseJson()[i].urls.small,
                              others.getResponseJson()[i].urls.regular,
                              others.getResponseJson()[i].urls.full,
                              others.getResponseJson()[i].urls.raw,
                            ),
                          );
                        },
                      ),
                    )
                  : Container(),
        ],
      ),
    );
