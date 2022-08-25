import 'package:ex2/const/color.dart';
import 'package:ex2/const/size_config.dart';
import 'package:ex2/screens/myscreen/model/models.dart';
import 'package:flutter/material.dart';


class UserListItem extends StatelessWidget {
  User user;//not null
  int index;
  UserListItem({
    Key? key,
    required this.user,
    required this.index
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Stack(
           children: [
             SizedBox(
               height: 90,
               width: 90,
               child: Image.network(user.url,fit: BoxFit.cover,),
             ),
             Container(
               height: 90,
               width: 90,
               padding:const EdgeInsets.all(3),
               child: Row(
                 crossAxisAlignment: CrossAxisAlignment.end,
                 children: const [
                   Expanded(child: SizedBox()),
                   Icon(Icons.play_circle, color: Colors.grey,size: 20,)
                 ],
               ),
             )
           ],
         ),
          const SizedBox(height: 5),
          Text(user.title, style: const TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
          const SizedBox(height: 3),
          Text(user.name, style:  TextStyle(fontSize: 10, color: MyColors.SUB_COLOR2),),
        ],
      ),
    );
  }
}
