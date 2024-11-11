import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:photo_view/photo_view.dart';

class FullScreenImage extends StatelessWidget {

  const FullScreenImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String photoPath = ModalRoute.of(context)!.settings.arguments as String ?? "";
    print("PHOTo = " + photoPath);
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
        color: Colors.white,
        height: double.infinity,
        width: double.infinity,
        child: PhotoView(
          initialScale: PhotoViewComputedScale.covered,
          imageProvider: AssetImage(photoPath),)
    );
  }
}
