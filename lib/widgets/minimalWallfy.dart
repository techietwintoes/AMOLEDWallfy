import 'package:AMOLED/constants/gradients.dart';
import 'package:AMOLED/constants/loaders.dart';
import 'package:AMOLED/providers/fetchminimal.dart';
import 'package:flutter/material.dart';
import 'girlWallfy.dart';

Widget minimalWallfy(double height, width, MinimalWallfy minimal) => Container(
      width: width - 20,
      height: height * .35,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Minimal Wallfy",
                style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.w400,
                  foreground: Paint()
                    ..shader = LinearGradient(
                      colors: [
                        const Color(0xFF52A7EA),
                        const Color(0xFF712E98),
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
                      gradient: FzGradients.violetSexyGradient,
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
          minimal.isFetching
              ? FzLoaders.minimalWallfyLoader()
              : minimal.getResponseJson() != null
                  ? Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemCount: 10,
                        itemBuilder: (context, i) {
                          return Container(
                            padding: const EdgeInsets.only(right: 17.0),
                            child: GirlWallfy(
                              minimal.getResponseJson()[i].id,
                              minimal.getResponseJson()[i].color,
                              minimal.getResponseJson()[i].urls.thumb,
                              minimal.getResponseJson()[i].urls.small,
                              minimal.getResponseJson()[i].urls.regular,
                              minimal.getResponseJson()[i].urls.full,
                              minimal.getResponseJson()[i].urls.raw,
                            ),
                          );
                        },
                      ),
                    )
                  : Container(),
        ],
      ),
    );
