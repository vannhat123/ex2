
import 'package:ex2/screens/myscreen/view/my_screen.dart';
import 'package:flutter/material.dart';

import 'const/consts.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
  //  ScreenSize.init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: MyScreen.routeName,
      routes: routes,

    );
  }
}
