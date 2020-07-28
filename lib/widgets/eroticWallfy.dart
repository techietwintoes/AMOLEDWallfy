import 'package:AMOLED/constants/gradients.dart';
import 'package:AMOLED/constants/loaders.dart';
import 'package:AMOLED/providers/fetcherotic.dart';
import 'package:flutter/material.dart';
import 'girlWallfy.dart';

Widget eroticWallfy(double height, width, EroticWallfy erotic) => Container(
      width: width - 20,
      height: height * .35,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Erotic Wallfy",
                style: TextStyle(
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
                      gradient: FzGradients.blueSexyGradient,
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
          erotic.isFetching
              ? FzLoaders.eroticWallfyLoader()
              : erotic.getResponseJson() != null
                  ? Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemCount: 10,
                        itemBuilder: (context, i) {
                          return Container(
                            padding: const EdgeInsets.only(right: 17.0),
                            child: GirlWallfy(
                              erotic.getResponseJson()[i].id,
                              erotic.getResponseJson()[i].color,
                              erotic.getResponseJson()[i].urls.thumb,
                              erotic.getResponseJson()[i].urls.small,
                              erotic.getResponseJson()[i].urls.regular,
                              erotic.getResponseJson()[i].urls.full,
                              erotic.getResponseJson()[i].urls.raw,
                            ),
                          );
                        },
                      ),
                    )
                  : Container(),
        ],
      ),
    );
