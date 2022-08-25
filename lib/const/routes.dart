
import 'package:ex2/screens/bottom_bar.dart';
import 'package:ex2/screens/myscreen/view/my_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes={
  MyScreen.routeName:(context)=> const MyScreen(),
  BottomBarScreen.routeName:(context)=> const BottomBarScreen(),
};