import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DarkEroticWallpapersCell extends StatefulWidget {
  final wallCell;
  final imageURL =
      'https://images.unsplash.com/photo-1595277579301-c4ec937b9f1d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=615&q=80';
  DarkEroticWallpapersCell(this.wallCell);
  @override
  _DarkEroticWallpapersCellState createState() =>
      _DarkEroticWallpapersCellState();
}

class _DarkEroticWallpapersCellState extends State<DarkEroticWallpapersCell> {
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
