import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class AllGalleryPage extends StatelessWidget {
  const AllGalleryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int count = 24;

    return Container(
        color: Colors.white,
        child: AlignedGridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            itemCount: count,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/fullImage', arguments:"assets/images/all/foto_" + (index + 1).toString()
                        + ".jpg");
                  },
                  child: GridTile(
                      child: Image.asset("assets/images/icons/all/foto_" + (index + 1).toString()
                          + ".jpg")));
            }
        )
    );
  }
}

