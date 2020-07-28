import 'package:AMOLED/constants/colors.dart';
import 'package:AMOLED/constants/frazile.dart';
import 'package:AMOLED/pages/fullscreen/fullScreenArguments.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class GirlWallfy extends StatefulWidget {
  final imageID,
      imagecolor,
      thumbImage,
      smallImage,
      regularImage,
      fullImage,
      rawImage;
  GirlWallfy(
    this.imageID,
    this.imagecolor,
    this.thumbImage,
    this.smallImage,
    this.regularImage,
    this.fullImage,
    this.rawImage,
  );
  @override
  _GirlWallfyState createState() => _GirlWallfyState();
}

class _GirlWallfyState extends State<GirlWallfy> {
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
          alignment: Alignment.center,
          child: Container(
            height: height * .25,
            width: 130.0,
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
                imageUrl: widget.thumbImage,
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
