import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class GirlWallfy extends StatefulWidget {
  final imageURL;
  GirlWallfy(this.imageURL);
  @override
  _GirlWallfyState createState() => _GirlWallfyState();
}

class _GirlWallfyState extends State<GirlWallfy> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        child: Container(
          height: height * .25,
          width: 130.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: CachedNetworkImage(
              imageUrl: widget.imageURL,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
        ),
      ),
    );
  }
}
