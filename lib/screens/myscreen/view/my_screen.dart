import 'package:ex2/const/consts.dart';
import 'package:flutter/material.dart';

class MyScreen extends StatelessWidget {
  const MyScreen({Key? key}) : super(key: key);
  static const routeName = '/my_screen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: MyColors.PRIMARY_COLOR1,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            height: 40,
            color: MyColors.SUB_COLOR2.withOpacity(0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.account_circle_outlined,
                  color: MyColors.SUB_COLOR1,
                  size: 28,
                ),
                Row(
                  children: [
                    Container(
                      height: 28,
                      width: 96,
                      decoration: BoxDecoration(
                          color: MyColors.SUB_COLOR1,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4),
                              bottomLeft: Radius.circular(4))),
                      alignment: Alignment.center,
                      child: const Text(
                        "Library",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Container(
                      height: 28,
                      width: 96,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: MyColors.SUB_COLOR1),
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(4),
                              bottomRight: Radius.circular(4))),
                      alignment: Alignment.center,
                      child: Text(
                        "Playlists",
                        style: TextStyle(color: MyColors.SUB_COLOR1),
                      ),
                    ),
                  ],
                ),
                //  const Expanded(child: SizedBox()),
                Icon(
                  Icons.search,
                  color: MyColors.SUB_COLOR1,
                  size: 28,
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Divider(height: 1, color: MyColors.SUB_COLOR2.withOpacity(0.3)),
                const SizedBox(
                  height: 4,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 5, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Shuffle All",
                        style: TextStyle(
                            fontSize: 20,
                            color: MyColors.SUB_COLOR1,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.read_more,
                        color: MyColors.SUB_COLOR1,
                        size: 30,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Divider(height: 1, color: MyColors.SUB_COLOR2.withOpacity(0.3)),
                Container(
                  margin: const EdgeInsets.only(left: 10, top: 22, bottom: 22),
                  child: const Text(
                    "RECENTLY ADDED >",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10,right: 10),
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        width: 150,
                        color: Colors.red,
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        width: 150,
                        color: Colors.red,
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        width: 150,
                        color: Colors.red,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
          // Row(),
        ],
      ),
    ));
  }
}
