import 'package:AMOLED/constants/frazile.dart';
import 'package:AMOLED/constants/gradients.dart';
import 'package:AMOLED/constants/loaders.dart';
import 'package:AMOLED/constants/serviceCalls.dart';
import 'package:AMOLED/pages/singlecat/catargs.dart';
import 'package:AMOLED/providers/fetchnature.dart';
import 'package:flutter/material.dart';
import 'girlWallfy.dart';

Widget natureWallfy(
        BuildContext context, double height, width, NatureWallfy nature) =>
    Container(
      width: width - 20,
      height: height * .35,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Nature Wallfy",
                style: TextStyle(
                  fontSize: (height / width) * 11,
                  fontWeight: FontWeight.w400,
                  foreground: Paint()
                    ..shader = LinearGradient(
                      colors: [
                        const Color(0xFF15EDED),
                        const Color(0xFF029CF5),
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
                  onPressed: () => Navigator.pushNamed(
                    context,
                    Frazile.cat,
                    arguments: CatArguments(
                      FzCalls.natureQuery,
                    ),
                  ),
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
                      gradient: FzGradients.skyBlueGradient,
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
                          fontSize: (height / width) * 6,
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
          nature.isFetching
              ? FzLoaders.natureWallfyLoader()
              : nature.getResponseJson() != null
                  ? Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemCount: 10,
                        itemBuilder: (context, i) {
                          return Container(
                            padding: const EdgeInsets.only(right: 17.0),
                            child: GirlWallfy(
                              i,
                              nature.getResponseJson()[i].id,
                              nature.getResponseJson()[i].color,
                              nature.getResponseJson()[i].urls.thumb,
                              nature.getResponseJson()[i].urls.small,
                              nature.getResponseJson()[i].urls.regular,
                              nature.getResponseJson()[i].urls.full,
                              nature.getResponseJson()[i].urls.raw,
                            ),
                          );
                        },
                      ),
                    )
                  : Container(),
        ],
      ),
    );
