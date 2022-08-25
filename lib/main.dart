
import 'package:ex2/screens/bottom_bar.dart';
import 'package:ex2/test/test.dart';
import 'package:flutter/material.dart';

import 'const/consts.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   SizeConfig();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
     initialRoute: BottomBarScreen.routeName,
      routes: routes,
    //  home: HomePage()
    );
  }
}
