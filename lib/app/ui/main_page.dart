import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myfoto/app/ui/pages/StartPage.dart';
import 'package:myfoto/app/ui/style/colors.dart';


class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StartPage()
    );
  }
}
