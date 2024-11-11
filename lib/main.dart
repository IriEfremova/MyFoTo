import 'package:flutter/material.dart';
import 'package:myfoto/app/ui/pages/AllGalleryPage.dart';
import 'package:myfoto/app/ui/pages/GalleryPage.dart';
import 'package:myfoto/app/ui/pages/StartPage.dart';
import 'package:myfoto/app/ui/style/theme.dart';

import 'app/ui/main_page.dart';
import 'app/ui/pages/FullScreenImage.dart';
import 'app/ui/pages/PersonPage.dart';
import 'app/ui/pages/VideoPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          '/start': (BuildContext context) {
            return const StartPage();
          },
          '/gallery': (BuildContext context) {
            return const GalleryPage();
          },
          '/person': (BuildContext context) {
            return const PersonPage();
          },
          '/allphoto': (BuildContext context) {
            return const AllGalleryPage();
          },
          '/fullImage': (BuildContext context) {
            return const FullScreenImage();
          },
          '/video': (BuildContext context) {
            return const VideoPage();
          },
        },
      title: 'Flutter Demo',
      theme: mainThemeData,
      home: MainPage()
    );
  }
}
