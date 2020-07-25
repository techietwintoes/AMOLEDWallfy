import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DarkWallpaperCell extends StatefulWidget {
  final wallCell;
  final imageURL =
      'https://images.unsplash.com/photo-1595053898099-fa9d460ec6c4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80';
  DarkWallpaperCell(this.wallCell);
  @override
  _DarkWallpaperCellState createState() => _DarkWallpaperCellState();
}

class _DarkWallpaperCellState extends State<DarkWallpaperCell> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {},
      child: Column(
        children: <Widget>[
          Container(
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
        ],
      ),
    );
  }
}
