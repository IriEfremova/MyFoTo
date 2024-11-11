import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:photo_view/photo_view.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    print("HEIGHT SCREEn = " + screenHeight.toString());
    double sizeImage =  (2 * screenHeight / 3) / 1911;

    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            height: 2 * screenHeight / 3,
            child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: <Widget>[            
            ClipRect(
              child: PhotoView(
                imageProvider: AssetImage('assets/images/start.jpg'),
                minScale: sizeImage,
                maxScale: sizeImage,
                //initialScale: PhotoViewComputedScale.contained,
              ),
            ),
            Padding(padding: EdgeInsets.all(10),
            child: ClipOval(
            child: Container(
              color: Colors.white70,
            child: Icon(Icons.swap_horiz, size: 30.0,)
              )
            ))
            ])
          ),
          Text("Выпуск 2024 года\nЛицей №6\n4 \"A\" класс",
              textAlign: TextAlign.center),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/gallery');
            },
            child: const Text('Смотреть'),
          )
        ],
      ),
    );
  }
}
