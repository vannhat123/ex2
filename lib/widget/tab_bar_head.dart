import 'package:ex2/const/consts.dart';
import 'package:flutter/material.dart';

class TabBarHead extends StatelessWidget {
  const TabBarHead({Key? key, this.text1, this.text2}) : super(key: key);
  final text1;
  final text2;
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration:  BoxDecoration(
          color: MyColors.SUB_COLOR2,
          borderRadius:
          const BorderRadius.all(Radius.circular(40))),
      margin: const EdgeInsets.all(8),
      child:  TabBar(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white,
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(50), // Creates border
            color: MyColors.SUB_COLOR2,),
        labelStyle: const TextStyle(fontSize: 18),
        unselectedLabelStyle: const TextStyle(fontSize: 18),
        tabs:   [
          Tab(
            height: 45,
            child: Text(text1,style: TextStyle(fontSize: 18),textAlign: TextAlign.center,),),
          Tab(
            height: 45,
            child: Text(text2,style: TextStyle(fontSize: 18),textAlign: TextAlign.center,) ,
          ),
        ],
      ),
    );
  }
}
