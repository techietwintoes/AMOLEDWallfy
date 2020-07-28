import 'package:AMOLED/constants/colors.dart';
import 'package:AMOLED/constants/frazile.dart';
import 'package:AMOLED/pages/fullscreen/fullScreenArguments.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CatWall extends StatefulWidget {
  final imageID,
      imagecolor,
      thumbImage,
      smallImage,
      regularImage,
      fullImage,
      rawImage;
  CatWall(
    this.imageID,
    this.imagecolor,
    this.thumbImage,
    this.smallImage,
    this.regularImage,
    this.fullImage,
    this.rawImage,
  );
  @override
  _CatWallState createState() => _CatWallState();
}

class _CatWallState extends State<CatWall> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          Frazile.fullScreen,
          arguments: FullScreenArguments(
            widget.fullImage,
            widget.thumbImage,
          ),
        );
      },
      child: Hero(
        tag: widget.imageID,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: FzColors.hexToColor(widget.imagecolor),
                blurRadius: 5.0,
                spreadRadius: .4,
                offset: Offset(
                  .7,
                  3.0,
                ),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: CachedNetworkImage(
              fadeInCurve: Curves.easeInCubic,
              fadeInDuration: Duration(milliseconds: 900),
              imageUrl: widget.thumbImage,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
        ),
      ),
    );
  }
}
